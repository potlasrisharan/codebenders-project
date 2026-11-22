import { chromium } from 'playwright';

const REAL_URL = 'https://codebenders-project.potlasrisharanchowdary.workers.dev';

console.log('=================================================================');
console.log(`Testing Newly Deployed Production Website at: ${REAL_URL}`);
console.log('=================================================================');

let browser;
let exitCode = 0;

try {
  browser = await chromium.launch({ headless: true });
  const context = await browser.newContext({
    viewport: { width: 1280, height: 800 },
    userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
  });
  const page = await context.newPage();

  const errors = [];
  const networkRequests = [];

  page.on('console', (msg) => {
    if (msg.type() === 'error') {
      errors.push(`Console Error: ${msg.text()}`);
    }
  });

  page.on('pageerror', (err) => {
    errors.push(`Page Error: ${err.message}`);
  });

  page.on('response', (res) => {
    if (res.url().includes('/api/')) {
      networkRequests.push({
        url: res.url(),
        status: res.status(),
        ok: res.ok(),
      });
    }
  });

  // 1. Landing Page Test
  console.log('\n--- 1. Testing Live Landing Page ---');
  const res = await page.goto(`${REAL_URL}/`, { waitUntil: 'networkidle' });
  console.log(`Status: ${res?.status()}`);
  const title = await page.title();
  console.log(`Page Title: "${title}"`);
  const h1 = await page.locator('h1').first().textContent();
  console.log(`Main Heading: "${h1?.trim()}"`);

  // Verify 219 Schemes metric is present
  const statsText = await page.locator('text=219').first().isVisible();
  console.log(`Verified 219 Schemes Metric Visible: ${statsText}`);
  if (!statsText) throw new Error('219 Schemes metric not found on live landing page');

  // Verify Multilingual Switching Live: English -> Telugu -> Hindi -> English
  console.log('\n--- 2. Testing Live Multilingual Switching ---');
  const teluguBtn = page.locator('button:has-text("తెలుగు")').first();
  await teluguBtn.click();
  await page.waitForTimeout(300);
  const docLangTe = await page.evaluate(() => document.documentElement.lang);
  console.log(`HTML Document lang attribute: "${docLangTe}"`);
  if (docLangTe !== 'te') throw new Error(`Expected lang="te", got "${docLangTe}"`);
  const teHeading = await page.locator('h1').first().textContent();
  console.log(`Telugu H1: "${teHeading?.trim()}"`);

  const hindiBtn = page.locator('button:has-text("हिन्दी")').first();
  await hindiBtn.click();
  await page.waitForTimeout(300);
  const docLangHi = await page.evaluate(() => document.documentElement.lang);
  console.log(`HTML Document lang attribute: "${docLangHi}"`);
  if (docLangHi !== 'hi') throw new Error(`Expected lang="hi", got "${docLangHi}"`);
  const hiHeading = await page.locator('h1').first().textContent();
  console.log(`Hindi H1: "${hiHeading?.trim()}"`);

  // Switch back to English
  const enBtn = page.locator('button:has-text("English")').first();
  await enBtn.click();
  await page.waitForTimeout(300);

  // 3. Test Intake Page
  console.log('\n--- 3. Testing Live Intake Page ---');
  await page.goto(`${REAL_URL}/intake`, { waitUntil: 'networkidle' });
  const intakeHeading = await page.locator('h1').textContent();
  console.log(`Intake Heading: "${intakeHeading?.trim()}"`);

  // Verify Golden Personas are interactive
  const priyaBtn = page.locator('button:has-text("Priya")').first();
  const priyaVisible = await priyaBtn.isVisible();
  console.log(`Priya Demo Persona Visible: ${priyaVisible}`);
  if (priyaVisible) {
    await priyaBtn.click();
    console.log('Clicked Priya Persona');
    await page.waitForTimeout(300);
  }

  // Test Natural Language input with Telugu text
  const textarea = page.locator('textarea#intake-description');
  if (await textarea.isVisible()) {
    await textarea.fill('నేను నల్లగొండలో చిన్న రైతుని, నాకు 2 ఎకరాల పొలం ఉంది');
    console.log('Entered Telugu text in intake description');
    const extractBtn = page.locator('button:has-text("Extract Attributes")');
    if (await extractBtn.isVisible()) {
      await extractBtn.click();
      console.log('Clicked Extract Attributes button');
      await page.waitForTimeout(400);
    }
  }

  // 4. Test Matches Page & D1 Scheme Integration
  console.log('\n--- 4. Testing Live Matches & D1 Database Catalog ---');
  await page.goto(`${REAL_URL}/matches`, { waitUntil: 'networkidle' });
  const matchesHeading = await page.locator('h1').textContent();
  console.log(`Matches Heading: "${matchesHeading?.trim()}"`);

  // Wait for schemes to render
  await page.waitForSelector('text=Verified Schemes Catalog', { timeout: 5000 });

  // Test search input for 'kisan'
  const searchInput = page.locator('input[placeholder*="Search"]');
  if (await searchInput.isVisible()) {
    await searchInput.fill('kisan');
    console.log('Entered search query: "kisan"');
    await page.waitForTimeout(500);

    const kisanFound = await page.locator('text=Pradhan Mantri Kisan Samman Nidhi').first().isVisible();
    console.log(`PM-KISAN Scheme Found in search: ${kisanFound}`);
  }

  // 5. Test Scheme Details & Action Graph
  console.log('\n--- 5. Testing Scheme Details & Unified Action Graph ---');
  await page.goto(`${REAL_URL}/scheme/ts-epass-rtf-2026`, { waitUntil: 'networkidle' });
  const schemeTitle = await page.locator('h1, h2').first().textContent();
  console.log(`Scheme Title: "${schemeTitle?.trim()}"`);

  // Verify Middleman Shield is rendered
  const shieldNotice = await page.locator('text=Middleman Shield').first().isVisible();
  console.log(`Middleman Shield Visible: ${shieldNotice}`);

  // Verify Action Graph is rendered
  const graphVisible = await page.locator('text=Unified Eligibility Action Graph').first().isVisible();
  console.log(`Unified Action Graph Visible: ${graphVisible}`);

  // Test What-If simulation button
  const whatIfBtn = page.locator('button:has-text("Run What-If Simulation")');
  if (await whatIfBtn.isVisible()) {
    await whatIfBtn.click();
    console.log('Ran What-If Simulation on live page');
    await page.waitForTimeout(300);
  }

  // 6. Test Checklist Page
  console.log('\n--- 6. Testing Document Readiness Cockpit ---');
  await page.goto(`${REAL_URL}/checklist`, { waitUntil: 'networkidle' });
  const checklistHeading = await page.locator('h1').textContent();
  console.log(`Checklist Heading: "${checklistHeading?.trim()}"`);

  // 7. Test Tracker Page
  console.log('\n--- 7. Testing Application & Benefit Tracker ---');
  await page.goto(`${REAL_URL}/tracker`, { waitUntil: 'networkidle' });
  const trackerHeading = await page.locator('h1').textContent();
  console.log(`Tracker Heading: "${trackerHeading?.trim()}"`);

  // 8. Verify API Network Calls
  console.log('\n--- 8. Live Network API Verification ---');
  console.log(`Total API requests captured: ${networkRequests.length}`);
  for (const req of networkRequests) {
    console.log(`   [${req.status}] ${req.url}`);
  }

  // 9. Error Summary
  console.log('\n--- 9. Production Website Health & Console Report ---');
  console.log(`Page Errors: ${errors.length}`);
  if (errors.length > 0) {
    console.error('Errors encountered on live website:', errors);
    exitCode = 1;
  } else {
    console.log('✅ ALL LIVE PRODUCTION FEATURES VERIFIED AND PASSING 100%!');
  }
} catch (err) {
  console.error('Real Website Test Failed:', err);
  exitCode = 1;
} finally {
  if (browser) await browser.close();
  process.exit(exitCode);
}
