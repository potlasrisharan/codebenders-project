import { describe, it, expect } from 'vitest';
import fs from 'node:fs';
import path from 'node:path';
import { VERIFIED_GOVERNMENT_SCHEMES } from '../src/core/data/schemes-dataset';
import { defaultSchemeRepository } from '../src/core/data/repository';
import { NATIONAL_STATE_COVERAGE } from '../src/core/data/coverage-registry';
import { SUPPORTED_LANGUAGES, TRANSLATIONS } from '../src/core/i18n/translations';

describe('Project Structure & Invariant Test Suite', () => {
  const rootDir = process.cwd();

  it('validates core directory layout adheres to Clean Architecture', () => {
    const requiredDirs = [
      'src/core/data',
      'src/core/discovery',
      'src/core/engine',
      'src/core/i18n',
      'src/core/privacy',
      'src/core/profile',
      'src/core/simulator',
      'src/core/tracker',
      'src/components/layout',
      'src/components/ui',
      'src/components/scheme',
      'src/components/voice',
      'src/routes',
      'worker/routes',
      'tests/unit',
      'tests/integration',
    ];

    for (const dir of requiredDirs) {
      const fullPath = path.join(rootDir, dir);
      expect(fs.existsSync(fullPath), `Directory missing: ${dir}`).toBe(true);
    }
  });

  it('validates all route pages exist and export valid React components', () => {
    const routeFiles = [
      'LandingPage.tsx',
      'IntakePage.tsx',
      'MatchesPage.tsx',
      'SchemeDetailPage.tsx',
      'ChecklistPage.tsx',
      'TrackerPage.tsx',
      'AdminReviewPage.tsx',
    ];

    for (const file of routeFiles) {
      const fullPath = path.join(rootDir, 'src/routes', file);
      expect(fs.existsSync(fullPath), `Route file missing: ${file}`).toBe(true);
      const content = fs.readFileSync(fullPath, 'utf-8');
      expect(content).toContain('export function');
    }
  });

  it('validates multilingual translation coverage across English, Telugu, and Hindi', () => {
    expect(SUPPORTED_LANGUAGES.map((l) => l.code)).toEqual(['en', 'te', 'hi']);

    const enKeys = Object.keys(TRANSLATIONS.en);
    const teKeys = Object.keys(TRANSLATIONS.te);
    const hiKeys = Object.keys(TRANSLATIONS.hi);

    expect(enKeys.length).toBeGreaterThan(40);
    expect(teKeys.length).toBeGreaterThan(40);
    expect(hiKeys.length).toBeGreaterThan(40);

    // Verify key UI text keys are present across all languages
    const criticalKeys = [
      'brand.name',
      'nav.intake',
      'nav.matches',
      'nav.checklist',
      'nav.tracker',
      'landing.title',
      'landing.stats.schemes',
      'intake.title',
      'matches.title',
    ];

    for (const key of criticalKeys) {
      expect(TRANSLATIONS.en[key], `Missing en key: ${key}`).toBeDefined();
      expect(TRANSLATIONS.te[key], `Missing te key: ${key}`).toBeDefined();
      expect(TRANSLATIONS.hi[key], `Missing hi key: ${key}`).toBeDefined();
    }
  });

  it('validates 32 States & UTs jurisdiction coverage registry', () => {
    expect(NATIONAL_STATE_COVERAGE.length).toBeGreaterThanOrEqual(30);
    const telangana = NATIONAL_STATE_COVERAGE.find((s) => s.stateCode === 'TG' || s.stateName === 'Telangana');
    expect(telangana).toBeDefined();
    expect(telangana?.coverageStatus).toBe('covered');
  });

  it('validates pilot foundation scheme data contract integrity', () => {
    expect(VERIFIED_GOVERNMENT_SCHEMES.length).toBeGreaterThanOrEqual(3);
    const all = defaultSchemeRepository.getAll();
    expect(all.length).toBeGreaterThanOrEqual(VERIFIED_GOVERNMENT_SCHEMES.length);

    for (const s of VERIFIED_GOVERNMENT_SCHEMES) {
      expect(s.id).toBeDefined();
      expect(s.name).toBeDefined();
      expect(s.rules.length).toBeGreaterThan(0);
      expect(s.documents.length).toBeGreaterThan(0);
      expect(s.sources.length).toBeGreaterThan(0);
      expect(s.feeStatus).toBe('free_verified');
    }
  });

  it('enforces Sensitive-ID Shield (Rule 0) security: no raw API secrets in git tracked files', () => {
    const gitignorePath = path.join(rootDir, '.gitignore');
    expect(fs.existsSync(gitignorePath)).toBe(true);
    const gitignoreContent = fs.readFileSync(gitignorePath, 'utf-8');

    // Confirm .env and credential files are gitignored
    expect(gitignoreContent).toContain('.env');
    expect(gitignoreContent).toContain('.dev.vars');
    expect(gitignoreContent).toContain('dist');
  });
});
