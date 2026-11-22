import { chromium } from 'playwright';
import { spawn } from 'node:child_process';

const PORT = 4173;
const BASE_URL = `http://localhost:${PORT}`;

console.log('--- Starting LabhSaathi End-to-End Verification ---');

// Spawn vite preview
const preview = spawn('npx', ['vite', 'preview', '--port', String(PORT), '--strictPort'], {
  stdio: 'pipe',
});

let serverReady = false;

preview.stdout.on('data', (data) => {
  const msg = data.toString();
  if (msg.includes(String(PORT))) {
    serverReady = true;
  }
});

preview.stderr.on('data', (data) => {
  console.error('[Preview Stderr]:', data.toString());
});

// Wait up to 5 seconds for preview server
for (let i = 0; i < 20; i++) {
  if (serverReady) break;
  await new Promise((r) => setTimeout(r, 250));
}

let browser;
let exitCode = 0;

try {
  browser = await chromium.launch({ headless: true });
  const page = await browser.newPage({
    viewport: { width: 1280, height: 800 },
  });

  const consoleErrors = [];
  const pageErrors = [];

  page.on('console', (msg) => {
    if (msg.type() === 'error') consoleErrors.push(msg.text());
  });
  page.on('pageerror', (err) => {
    pageErrors.push(err.message);
  });

  // Step 1: Landing Page
  console.log('1. Testing Landing Page (/)');
  const landingRes = await page.goto(`${BASE_URL}/`, { waitUntil: 'networkidle' });
  if (landingRes.status() !== 200) throw new Error(`Landing returned ${landingRes.status()}`);
  const landingHeading = await page.locator('h1').textContent();
  console.log(`   Heading: "${landingHeading.trim()}"`);

  // Step 2: Navigate to Intake
  console.log('2. Navigating to Intake (/intake)');
  await page.click('text=Start with intake');
  await page.waitForURL('**/intake');
  const intakeHeading = await page.locator('h1').textContent();
  console.log(`   Heading: "${intakeHeading.trim()}"`);

  // Step 3: Select Golden Persona (Priya)
  console.log('3. Selecting Priya Demo Persona');
  await page.click('text=Priya');
  await page.waitForTimeout(300);

  // Step 4: Click Find Likely Schemes -> Matches
  console.log('4. Submitting Intake to find Matches');
  await page.click('text=Find Likely Schemes');
  await page.waitForURL('**/matches');
  const matchesHeading = await page.locator('h1').textContent();
  console.log(`   Heading: "${matchesHeading.trim()}"`);

  // Verify matched scheme is displayed with status chip
  const epassText = await page.locator('text=Telangana ePASS Post-Matric Scholarship').first().textContent();
  console.log(`   Found match: "${epassText.trim()}"`);

  // Step 5: Open Scheme Details
  console.log('5. Opening Scheme Details');
  await page.click('text=View Action Graph');
  await page.waitForURL('**/scheme/**');
  const detailHeading = await page.locator('h1').textContent();
  console.log(`   Heading: "${detailHeading.trim()}"`);

  // Verify Middleman Shield card and Action Graph are present
  const shieldNotice = await page.locator('text=Middleman Shield & Fee Transparency').textContent();
  console.log(`   Verified component: "${shieldNotice.trim()}"`);

  const graphTitle = await page.locator('text=Unified Eligibility Action Graph').textContent();
  console.log(`   Verified component: "${graphTitle.trim()}"`);

  // Step 6: Checklist Page
  console.log('6. Navigating to Checklist (/checklist)');
  await page.goto(`${BASE_URL}/checklist`, { waitUntil: 'networkidle' });
  const checklistHeading = await page.locator('h1').textContent();
  console.log(`   Heading: "${checklistHeading.trim()}"`);

  // Step 7: Tracker Page
  console.log('7. Navigating to Tracker (/tracker)');
  await page.goto(`${BASE_URL}/tracker`, { waitUntil: 'networkidle' });
  const trackerHeading = await page.locator('h1').textContent();
  console.log(`   Heading: "${trackerHeading.trim()}"`);

  // Step 8: Admin Review Page
  console.log('8. Navigating to Admin Review (/admin-review)');
  await page.goto(`${BASE_URL}/admin-review`, { waitUntil: 'networkidle' });
  const adminHeading = await page.locator('h1').textContent();
  console.log(`   Heading: "${adminHeading.trim()}"`);

  console.log('\n--- Console & Page Error Summary ---');
  console.log(`Console Errors: ${consoleErrors.length}`);
  console.log(`Page Errors: ${pageErrors.length}`);

  if (consoleErrors.length > 0 || pageErrors.length > 0) {
    if (consoleErrors.length > 0) console.error('Console errors:', consoleErrors);
    if (pageErrors.length > 0) console.error('Page errors:', pageErrors);
    exitCode = 1;
  } else {
    console.log('SUCCESS: Desktop journey passed cleanly!');
  }

  // Multi-viewport & Responsiveness Verification
  console.log('\n--- Testing Responsive Viewports & Mobile Navigation ---');
  const viewports = [
    { name: 'Mobile (360x640)', width: 360, height: 640 },
    { name: 'Mobile iPhone (390x844)', width: 390, height: 844 },
    { name: 'Tablet iPad (768x1024)', width: 768, height: 1024 },
    { name: 'Desktop (1280x800)', width: 1280, height: 800 },
  ];

  for (const vp of viewports) {
    console.log(`Checking viewport: ${vp.name}`);
    await page.setViewportSize({ width: vp.width, height: vp.height });
    await page.goto(`${BASE_URL}/`, { waitUntil: 'networkidle' });

    // Verify horizontal overflow (no awkward horizontal scrollbars)
    const hasHorizontalOverflow = await page.evaluate(() => {
      return document.documentElement.scrollWidth > window.innerWidth;
    });
    if (hasHorizontalOverflow) {
      throw new Error(`Horizontal overflow detected at ${vp.name}: scrollWidth > innerWidth`);
    }

    if (vp.width < 768) {
      // Check mobile hamburger toggle exists
      const menuBtn = page.locator('button[aria-label*="navigation menu" i]');
      const isVisible = await menuBtn.isVisible();
      if (!isVisible) throw new Error(`Mobile menu toggle button not visible on ${vp.name}`);

      // Open drawer
      await menuBtn.click();
      await page.waitForTimeout(200);

      // Verify drawer nav links appear
      const intakeMobileLink = page.locator('nav[aria-label="Mobile Navigation"] a:has-text("Intake")').first();
      await intakeMobileLink.click();
      await page.waitForURL('**/intake');
      console.log(`   Mobile hamburger menu navigation verified on ${vp.name}`);
    }
  }

  console.log('SUCCESS: All responsive viewport audits passed with 0 horizontal overflow and seamless mobile navigation!');
} catch (err) {
  console.error('E2E Verification Failed:', err);
  exitCode = 1;
} finally {
  if (browser) await browser.close();
  preview.kill();
  process.exit(exitCode);
}
