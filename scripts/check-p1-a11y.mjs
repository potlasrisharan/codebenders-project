// P1 accessibility and keyboard-focus evidence script.
// Runs against a preview server already serving the built app at BASE.
// Imports: node:fs, node:path, and the 'playwright' package (chromium) only.

import { mkdirSync, writeFileSync } from 'node:fs';
import { dirname, join, resolve } from 'node:path';
import { chromium } from 'playwright';

const BASE = 'http://localhost:4173';
const ROUTES = ['/', '/intake', '/matches', '/scheme/test', '/checklist', '/tracker', '/admin-review'];
const VIEWPORTS = {
  mobile: { width: 390, height: 844 },
  desktop: { width: 1440, height: 900 },
};

// Resolve the project root from this script's own location (no node:url import needed).
const scriptPath = decodeURIComponent(new URL(import.meta.url).pathname);
const projectRoot = resolve(dirname(scriptPath), '..');
const outDir = join(projectRoot, 'docs', 'evidence', 'P1');
const outFile = join(outDir, 'a11y-report.json');

const CHECK_NAMES = [
  'htmlLang',
  'singleH1',
  'skipLinkFirst',
  'skipTargetExists',
  'skipWorks',
  'focusVisible',
  'unlabelledControls',
  'unnamedLinksOrButtons',
  'landmarks',
];

async function gotoRoute(page, url) {
  await page.goto(url, { waitUntil: 'networkidle' });
}

async function activeInfo(page) {
  return page.evaluate(() => {
    const el = document.activeElement;
    if (!el || el === document.body) {
      return { tag: 'BODY', text: '', href: null, inMain: false, inNav: false };
    }
    return {
      tag: el.tagName,
      text: (el.textContent || '').replace(/\s+/g, ' ').trim(),
      href: el.getAttribute('href'),
      inMain: !!el.closest('main'),
      inNav: !!el.closest('nav'),
    };
  });
}

async function staticChecks(page) {
  return page.evaluate(() => {
    const lang = document.documentElement.lang || '';
    const h1Count = document.querySelectorAll('h1').length;

    const fields = Array.from(document.querySelectorAll('input, select, textarea')).filter(
      (el) => !(el.tagName === 'INPUT' && el.type === 'hidden'),
    );
    const unlabelled = fields
      .filter((el) => {
        const hasFor = el.id && document.querySelector(`label[for="${CSS.escape(el.id)}"]`);
        const wrapped = !!el.closest('label');
        const ariaLabel = (el.getAttribute('aria-label') || '').trim() !== '';
        const labelledBy = el.hasAttribute('aria-labelledby');
        return !(hasFor || wrapped || ariaLabel || labelledBy);
      })
      .map((el) => el.outerHTML.slice(0, 120));

    const unnamed = Array.from(document.querySelectorAll('a, button'))
      .filter((el) => {
        const text = (el.textContent || '').trim();
        const ariaLabel = (el.getAttribute('aria-label') || '').trim();
        const imgAlt = Array.from(el.querySelectorAll('img')).some(
          (img) => (img.getAttribute('alt') || '').trim() !== '',
        );
        return text === '' && ariaLabel === '' && !imgAlt;
      })
      .map((el) => el.outerHTML.slice(0, 120));

    return {
      lang,
      h1Count,
      unlabelled,
      unnamed,
      landmarks: {
        header: !!document.querySelector('header'),
        nav: !!document.querySelector('nav'),
        main: !!document.querySelector('main'),
        footer: !!document.querySelector('footer'),
      },
      mainTagOk: (() => {
        const m = document.getElementById('main-content');
        return { exists: !!m, isMain: !!m && m.tagName === 'MAIN' };
      })(),
    };
  });
}

async function tabOrderSample(page, url) {
  await gotoRoute(page, url);
  const sample = [];
  for (let i = 0; i < 8; i++) {
    await page.keyboard.press('Tab');
    const info = await activeInfo(page);
    sample.push({ tagName: info.tag, text: info.text.slice(0, 80) });
  }
  return sample;
}

async function skipWorksCheck(page, url) {
  await gotoRoute(page, url);
  await page.keyboard.press('Tab');
  await page.keyboard.press('Enter');
  await page.waitForTimeout(100);
  const afterEnter = await activeInfo(page);
  if (afterEnter.inMain) {
    return { pass: true, detail: `focus inside main after Enter (${afterEnter.tag})` };
  }
  await page.keyboard.press('Tab');
  const afterTab = await activeInfo(page);
  if (afterTab.inMain) {
    return { pass: true, detail: `focus inside main after one more Tab (${afterTab.tag})` };
  }
  return {
    pass: false,
    detail: `focus not in main: after Enter=${afterEnter.tag}, after Tab=${afterTab.tag}`,
  };
}

async function focusVisibleCheck(page, url) {
  await gotoRoute(page, url);
  let found = false;
  for (let i = 0; i < 40; i++) {
    await page.keyboard.press('Tab');
    const info = await activeInfo(page);
    if (info.tag === 'A' && info.inNav) {
      found = true;
      break;
    }
  }
  if (!found) {
    return { pass: false, detail: 'no nav link reached within 40 Tab presses' };
  }
  const styles = await page.evaluate(() => {
    const el = document.activeElement;
    const s = getComputedStyle(el);
    return { outlineStyle: s.outlineStyle, outlineWidth: s.outlineWidth, boxShadow: s.boxShadow };
  });
  const pass =
    styles.outlineStyle !== 'none' || styles.boxShadow !== 'none' || styles.outlineWidth !== '0px';
  return {
    pass,
    detail: `outline-style=${styles.outlineStyle}, outline-width=${styles.outlineWidth}, box-shadow=${styles.boxShadow}`,
  };
}

async function runRouteViewport(browser, route, viewportName, viewport) {
  const url = BASE + route;
  const page = await browser.newPage({ viewport });
  const checks = {};
  let tabOrder = [];
  try {
    await gotoRoute(page, url);
    const s = await staticChecks(page);

    checks.htmlLang = { pass: s.lang.trim() !== '', detail: `lang="${s.lang}"` };
    checks.singleH1 = { pass: s.h1Count === 1, detail: `h1 count=${s.h1Count}` };
    checks.skipTargetExists = {
      pass: s.mainTagOk.exists && s.mainTagOk.isMain,
      detail: `#main-content exists=${s.mainTagOk.exists}, isMain=${s.mainTagOk.isMain}`,
    };
    checks.unlabelledControls = {
      pass: s.unlabelled.length === 0,
      detail: `count=${s.unlabelled.length}${s.unlabelled.length ? ' ' + JSON.stringify(s.unlabelled.slice(0, 5)) : ''}`,
    };
    checks.unnamedLinksOrButtons = {
      pass: s.unnamed.length === 0,
      detail: `count=${s.unnamed.length}${s.unnamed.length ? ' ' + JSON.stringify(s.unnamed.slice(0, 5)) : ''}`,
    };
    const lm = s.landmarks;
    checks.landmarks = {
      pass: lm.header && lm.nav && lm.main && lm.footer,
      detail: `header=${lm.header}, nav=${lm.nav}, main=${lm.main}, footer=${lm.footer}`,
      header: lm.header,
      nav: lm.nav,
      main: lm.main,
      footer: lm.footer,
    };

    tabOrder = await tabOrderSample(page, url);
    const first = tabOrder[0] || { tagName: 'NONE', text: '' };
    // Re-query href on the first focused element for the skip-link check.
    await gotoRoute(page, url);
    await page.keyboard.press('Tab');
    const firstInfo = await activeInfo(page);
    const skipOk =
      firstInfo.tag === 'A' &&
      firstInfo.text.includes('Skip to main content') &&
      firstInfo.href === '#main-content';
    checks.skipLinkFirst = {
      pass: skipOk,
      detail: `first focus ${first.tagName} "${firstInfo.text}" href=${firstInfo.href}`,
    };

    checks.skipWorks = await skipWorksCheck(page, url);
    checks.focusVisible = await focusVisibleCheck(page, url);
  } catch (err) {
    const msg = `error: ${err && err.message ? err.message.split('\n')[0] : String(err)}`;
    for (const name of CHECK_NAMES) {
      if (!checks[name]) checks[name] = { pass: false, detail: msg };
    }
  } finally {
    await page.context().close();
  }
  for (const name of CHECK_NAMES) {
    if (!checks[name]) checks[name] = { pass: false, detail: 'not run' };
  }
  return { route, viewport: viewportName, checks, tabOrderSample: tabOrder };
}

async function main() {
  const browser = await chromium.launch({ headless: true });
  const results = [];
  let anyFail = false;
  try {
    for (const route of ROUTES) {
      for (const [viewportName, viewport] of Object.entries(VIEWPORTS)) {
        const result = await runRouteViewport(browser, route, viewportName, viewport);
        results.push(result);
        const failing = Object.entries(result.checks)
          .filter(([, c]) => !c.pass)
          .map(([name]) => name);
        if (failing.length) anyFail = true;
        const status = failing.length ? `FAIL (${failing.join(', ')})` : 'PASS';
        console.log(`${route} [${viewportName}]: ${status}`);
      }
    }
  } finally {
    await browser.close();
  }

  mkdirSync(outDir, { recursive: true });
  writeFileSync(outFile, JSON.stringify(results, null, 2) + '\n');
  console.log(`Wrote ${outFile}`);
  process.exitCode = anyFail ? 1 : 0;
}

main().catch((err) => {
  console.error(err);
  process.exitCode = 1;
});
