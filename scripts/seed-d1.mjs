#!/usr/bin/env node
/**
 * scripts/seed-d1.mjs
 * Seeds Cloudflare D1 database (labhsaathi-schemes-db) with verified Central and State schemes.
 * 
 * Supports:
 *   node scripts/seed-d1.mjs          # seeds local D1
 *   node scripts/seed-d1.mjs --local  # seeds local D1
 *   node scripts/seed-d1.mjs --remote # seeds remote Cloudflare D1
 *   node scripts/seed-d1.mjs --both   # seeds local and remote D1
 *   node scripts/seed-d1.mjs --generate-only # only generates SQL file
 */

import fs from 'node:fs';
import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { spawnSync } from 'node:child_process';
import esbuild from 'esbuild';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const projectRoot = path.resolve(__dirname, '..');

const DB_NAME = 'labhsaathi-schemes-db';
const REL_SEED_SQL = 'scripts/data/seed.sql';
const SEED_SQL_PATH = path.join(projectRoot, REL_SEED_SQL);

function runWrangler(args) {
  const result = spawnSync('npx', ['wrangler', 'd1', ...args], {
    cwd: projectRoot,
    stdio: 'inherit',
    shell: false,
  });
  if (result.status !== 0) {
    throw new Error(`Wrangler exited with status ${result.status}`);
  }
}

function escapeSql(val) {
  if (val === null || val === undefined) return 'NULL';
  return `'${String(val).replace(/'/g, "''")}'`;
}

async function loadExistingDataset() {
  const tsPath = path.join(projectRoot, 'src/core/data/schemes-dataset.ts');
  if (!fs.existsSync(tsPath)) {
    console.warn(`[seed] Warning: ${tsPath} not found`);
    return [];
  }
  try {
    const tsCode = fs.readFileSync(tsPath, 'utf8');
    const result = esbuild.transformSync(tsCode, { loader: 'ts', format: 'esm' });
    const base64Code = Buffer.from(result.code).toString('base64');
    const mod = await import(`data:text/javascript;base64,${base64Code}`);
    return mod.VERIFIED_GOVERNMENT_SCHEMES || [];
  } catch (err) {
    console.error('[seed] Error loading schemes-dataset.ts:', err.message);
    return [];
  }
}

function loadJsonFile(filePath) {
  if (!fs.existsSync(filePath)) {
    console.warn(`[seed] Notice: ${path.relative(projectRoot, filePath)} does not exist yet.`);
    return [];
  }
  try {
    const raw = fs.readFileSync(filePath, 'utf8');
    const parsed = JSON.parse(raw);
    if (Array.isArray(parsed)) return parsed;
    if (parsed.schemes && Array.isArray(parsed.schemes)) return parsed.schemes;
    return [];
  } catch (err) {
    console.error(`[seed] Failed to parse ${filePath}:`, err.message);
    return [];
  }
}

function normalizeScheme(raw) {
  const id = raw.id || raw.slug;
  if (!id) return null;

  const slug = raw.slug || raw.id;
  const name = raw.name || '';
  const short_description = raw.shortDescription || raw.short_description || '';
  const full_description = raw.fullDescription || raw.full_description || short_description;
  const category = raw.category || 'welfare';
  const state = raw.state || 'All India';
  const jurisdiction = raw.jurisdiction || (state === 'All India' ? 'central' : 'state');
  
  let ministry = raw.ministry || '';
  let department = raw.department || '';
  if (!department && raw.sources && raw.sources.length > 0) {
    department = raw.sources[0].department || '';
  }
  if (!ministry && department) {
    ministry = department;
  }

  let portal_url = raw.portalUrl || raw.portal_url || '';
  if (!portal_url && raw.sources && raw.sources.length > 0) {
    portal_url = raw.sources[0].portalUrl || '';
  }

  const fee_status = raw.feeStatus || raw.fee_status || 'free_verified';
  const benefit_details = raw.benefitDetails || raw.benefit_details || raw.feeDetails || '';
  
  let eligibility_summary = raw.eligibilitySummary || raw.eligibility_summary || '';
  if (!eligibility_summary && Array.isArray(raw.rules) && raw.rules.length > 0) {
    eligibility_summary = raw.rules
      .map(r => r.conditionName || r.sourceClause)
      .filter(Boolean)
      .join('; ');
  }

  const rules_json = JSON.stringify(raw.rules || []);
  const documents_json = JSON.stringify(raw.documents || []);
  const steps_json = JSON.stringify(raw.applicationSteps || raw.steps || []);

  return {
    id,
    slug,
    name,
    short_description,
    full_description,
    category,
    jurisdiction,
    state,
    ministry,
    department,
    portal_url,
    fee_status,
    benefit_details,
    eligibility_summary,
    rules_json,
    documents_json,
    steps_json,
  };
}

function toInsertSql(scheme) {
  return `INSERT OR REPLACE INTO schemes (
  id, slug, name, short_description, full_description, category, jurisdiction, state,
  ministry, department, portal_url, fee_status, benefit_details, eligibility_summary,
  rules_json, documents_json, steps_json, updated_at
) VALUES (
  ${escapeSql(scheme.id)},
  ${escapeSql(scheme.slug)},
  ${escapeSql(scheme.name)},
  ${escapeSql(scheme.short_description)},
  ${escapeSql(scheme.full_description)},
  ${escapeSql(scheme.category)},
  ${escapeSql(scheme.jurisdiction)},
  ${escapeSql(scheme.state)},
  ${escapeSql(scheme.ministry)},
  ${escapeSql(scheme.department)},
  ${escapeSql(scheme.portal_url)},
  ${escapeSql(scheme.fee_status)},
  ${escapeSql(scheme.benefit_details)},
  ${escapeSql(scheme.eligibility_summary)},
  ${escapeSql(scheme.rules_json)},
  ${escapeSql(scheme.documents_json)},
  ${escapeSql(scheme.steps_json)},
  CURRENT_TIMESTAMP
);`;
}

async function main() {
  const args = process.argv.slice(2);
  const isRemote = args.includes('--remote');
  const isBoth = args.includes('--both');
  const isGenerateOnly = args.includes('--generate-only');
  const isLocal = args.includes('--local') || (!isRemote && !isBoth);

  console.log('🚀 Starting LabhSaathi D1 Database Seeding Pipeline...');
  console.log(`Mode: ${isBoth ? 'Local + Remote' : isRemote ? 'Remote Only' : isGenerateOnly ? 'Generate SQL Only' : 'Local Only'}`);

  // 1. Load data from all sources
  const centralPath = path.join(projectRoot, 'scripts/data/central-schemes.json');
  const statePath = path.join(projectRoot, 'scripts/data/state-schemes.json');

  const [existingSchemes, centralSchemes, stateSchemes] = await Promise.all([
    loadExistingDataset(),
    Promise.resolve(loadJsonFile(centralPath)),
    Promise.resolve(loadJsonFile(statePath)),
  ]);

  console.log(`Loaded ${existingSchemes.length} schemes from src/core/data/schemes-dataset.ts`);
  console.log(`Loaded ${centralSchemes.length} schemes from scripts/data/central-schemes.json`);
  console.log(`Loaded ${stateSchemes.length} schemes from scripts/data/state-schemes.json`);

  // 2. Deduplicate by ID
  const schemeMap = new Map();

  for (const s of existingSchemes) {
    const norm = normalizeScheme(s);
    if (norm) schemeMap.set(norm.id, norm);
  }
  for (const s of centralSchemes) {
    const norm = normalizeScheme(s);
    if (norm) schemeMap.set(norm.id, norm);
  }
  for (const s of stateSchemes) {
    const norm = normalizeScheme(s);
    if (norm) schemeMap.set(norm.id, norm);
  }

  const allSchemes = Array.from(schemeMap.values());
  console.log(`Total unique schemes to seed: ${allSchemes.length}`);

  if (allSchemes.length === 0) {
    console.warn('⚠️ No schemes found to seed!');
    return;
  }

  // 3. Generate SQL statements
  const sqlStatements = [
    '-- Auto-generated Seed SQL for labhsaathi-schemes-db',
    '-- Generated at: ' + new Date().toISOString(),
    '',
    ...allSchemes.map(toInsertSql),
    '',
  ];

  fs.mkdirSync(path.dirname(SEED_SQL_PATH), { recursive: true });
  fs.writeFileSync(SEED_SQL_PATH, sqlStatements.join('\n\n'), 'utf8');
  console.log(`✅ Written ${allSchemes.length} INSERT statements to ${path.relative(projectRoot, SEED_SQL_PATH)}`);

  if (isGenerateOnly) {
    return;
  }

  // 4. Execute on Local D1
  if (isLocal || isBoth) {
    console.log('\n📦 Seeding Local D1 database...');
    try {
      runWrangler(['execute', DB_NAME, '--local', `--file=${REL_SEED_SQL}`]);
      console.log('✅ Local D1 database seeded successfully.');

      // Verification queries
      console.log('\n🔍 Verifying Local D1 counts and search:');
      runWrangler(['execute', DB_NAME, '--local', '--command=SELECT count(*) as total_schemes FROM schemes;']);
      runWrangler(['execute', DB_NAME, '--local', '--command=SELECT s.id, s.name, s.category, s.state FROM schemes_fts fts JOIN schemes s ON s.id = fts.id WHERE schemes_fts MATCH \'scholarship\' LIMIT 5;']);
    } catch (err) {
      console.error('❌ Failed to seed local D1:', err.message);
      process.exitCode = 1;
      return;
    }
  }

  // 5. Execute on Remote D1
  if (isRemote || isBoth) {
    console.log('\n☁️ Seeding Remote Cloudflare D1 database...');
    try {
      runWrangler(['execute', DB_NAME, '--remote', `--file=${REL_SEED_SQL}`, '--yes']);
      console.log('✅ Remote D1 database seeded successfully.');

      // Remote Verification queries
      console.log('\n🔍 Verifying Remote D1 counts:');
      runWrangler(['execute', DB_NAME, '--remote', '--command=SELECT count(*) as total_schemes FROM schemes;']);
    } catch (err) {
      console.error('❌ Failed to seed remote D1:', err.message);
      process.exitCode = 1;
      return;
    }
  }

  console.log('\n🎉 Seeding pipeline completed successfully!');
}

main().catch(err => {
  console.error('[seed] Fatal error:', err);
  process.exit(1);
});
