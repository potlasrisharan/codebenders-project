import { chromium } from 'playwright';
import fs from 'node:fs';
import path from 'node:path';

const BASE_URL = 'http://localhost:4173';
const ROUTES = ['/', '/intake', '/matches', '/scheme/test', '/checklist', '/tracker', '/admin-review'];
const VIEWPORTS = [
  { name: 'mobile', width: 390, height: 844 },
  { name: 'desktop', width: 1440, height: 900 },
];
const EVIDENCE_DIR = path.resolve('docs/evidence/P1');

function slugFor(route) {
  if (route === '/') return 'landing';
  if (route === '/scheme/test') return 'scheme-test';
  return route.replace(/^\//, '');
}

fs.mkdirSync(EVIDENCE_DIR, { recursive: true });

const browser = await chromium.launch({ headless: true });
const results = [];

try {
  for (const viewport of VIEWPORTS) {
    const page = await browser.newPage({
      viewport: { width: viewport.width, height: viewport.height },
    });

    let consoleErrors = [];
    let pageErrors = [];
    page.on('console', (msg) => {
      if (msg.type() === 'error') consoleErrors.push(msg.text());
    });
    page.on('pageerror', (err) => {
      pageErrors.push(err.message);
    });

    for (const route of ROUTES) {
      consoleErrors = [];
      pageErrors = [];
      let status = null;

      try {
        const response = await page.goto(`${BASE_URL}${route}`, { waitUntil: 'networkidle' });
        status = response ? response.status() : null;
      } catch (err) {
        pageErrors.push(`navigation: ${err.message}`);
      }

      const computed = await page.evaluate(() => {
        const header = document.querySelector('.app-header') || document.body;
        const headerStyle = getComputedStyle(header);
        const bodyStyle = getComputedStyle(document.body);
        const tmp = document.createElement('div');
        document.body.appendChild(tmp);
        const plainStyle = getComputedStyle(tmp);
        let cssRuleCount = 0;
        for (const sheet of document.styleSheets) {
          try {
            cssRuleCount += sheet.cssRules.length;
          } catch (err) {
            // cross-origin or unreadable sheet: contributes no countable rules
          }
        }
        const values = {
          sheetCount: document.styleSheets.length,
          cssRuleCount,
          bodyBackground: bodyStyle.backgroundColor,
          bodyFont: bodyStyle.fontFamily,
          plainBackground: plainStyle.backgroundColor,
          headerBackground: headerStyle.backgroundColor,
        };
        tmp.remove();
        return values;
      });

      // Body is styled white by --color-surface; a fresh unstyled div is transparent.
      const stylesheetApplied =
        computed.sheetCount > 0 &&
        computed.cssRuleCount > 0 &&
        computed.bodyBackground !== computed.plainBackground;

      const screenshot = path.join(EVIDENCE_DIR, `${viewport.name}-${slugFor(route)}.png`);
      await page.screenshot({ path: screenshot, fullPage: true });

      results.push({
        route,
        viewport: viewport.name,
        status,
        stylesheetApplied,
        computed: {
          bodyBackground: computed.bodyBackground,
          bodyFont: computed.bodyFont,
          plainBackground: computed.plainBackground,
          headerBackground: computed.headerBackground,
          cssRuleCount: computed.cssRuleCount,
        },
        consoleErrors: [...consoleErrors],
        pageErrors: [...pageErrors],
        screenshot,
      });
    }

    await page.close();
  }
} finally {
  await browser.close();
}

fs.writeFileSync(
  path.join(EVIDENCE_DIR, 'capture-report.json'),
  JSON.stringify(results, null, 2),
);

let failed = false;
for (const r of results) {
  const bad = r.status !== 200 || r.pageErrors.length > 0 || r.stylesheetApplied === false;
  if (bad) failed = true;
  console.log(
    `${bad ? 'FAIL' : 'OK'} ${r.viewport} ${r.route} status=${r.status} stylesheetApplied=${r.stylesheetApplied} pageErrors=${r.pageErrors.length} consoleErrors=${r.consoleErrors.length}`,
  );
}

process.exit(failed ? 1 : 0);
