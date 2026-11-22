import { describe, expect, it } from 'vitest';
import { SchemeRecordSchema } from '../../src/core/data/schema';
import { VERIFIED_GOVERNMENT_SCHEMES } from '../../src/core/data/schemes-dataset';
import { defaultSchemeRepository } from '../../src/core/data/repository';
import { NATIONAL_STATE_COVERAGE } from '../../src/core/data/coverage-registry';

describe('Scheme Data Foundation & Provenance (P3)', () => {
  it('validates every curated government scheme against SchemeRecordSchema', () => {
    expect(VERIFIED_GOVERNMENT_SCHEMES.length).toBeGreaterThanOrEqual(5);

    for (const scheme of VERIFIED_GOVERNMENT_SCHEMES) {
      const parseResult = SchemeRecordSchema.safeParse(scheme);
      if (!parseResult.success) {
        throw new Error(`Validation failed for scheme ${scheme.id}: ${JSON.stringify(parseResult.error.format())}`);
      }
      expect(parseResult.success).toBe(true);
    }
  });

  it('guarantees every scheme has official sources, department, and lastVerifiedDate', () => {
    for (const scheme of VERIFIED_GOVERNMENT_SCHEMES) {
      expect(scheme.sources.length).toBeGreaterThan(0);
      for (const source of scheme.sources) {
        expect(source.portalUrl).toMatch(/^https?:\/\//);
        expect(source.lastVerifiedDate).toMatch(/^\d{4}-\d{2}-\d{2}$/);
        expect(source.department.length).toBeGreaterThan(3);
      }
    }
  });

  it('enforces source-backed fee state (ADR-005)', () => {
    for (const scheme of VERIFIED_GOVERNMENT_SCHEMES) {
      expect(['free_verified', 'fee_verified', 'unknown']).toContain(scheme.feeStatus);
      if (scheme.feeStatus === 'free_verified') {
        expect(scheme.feeDetails).toBeDefined();
      }
    }
  });

  it('includes scam warning and middleman shield guidance on every scheme', () => {
    for (const scheme of VERIFIED_GOVERNMENT_SCHEMES) {
      expect(scheme.scamWarning).toBeDefined();
      expect(scheme.scamWarning.length).toBeGreaterThan(15);
    }
  });

  it('provides a national state coverage registry distinguishing covered vs partial vs unverified (FR-DATA-11)', () => {
    expect(NATIONAL_STATE_COVERAGE.length).toBeGreaterThanOrEqual(6);

    const ts = NATIONAL_STATE_COVERAGE.find((s) => s.stateCode === 'TS');
    expect(ts?.coverageStatus).toBe('covered');

    const ap = NATIONAL_STATE_COVERAGE.find((s) => s.stateCode === 'AP');
    expect(ap?.coverageStatus).toBe('partial');

    const tn = NATIONAL_STATE_COVERAGE.find((s) => s.stateCode === 'TN');
    expect(tn?.coverageStatus).toBe('not_yet_verified');
  });

  it('queries schemes by state and preserves jurisdiction boundaries', () => {
    const tsSchemes = defaultSchemeRepository.getByState('Telangana');
    expect(tsSchemes.some((s) => s.id === 'ts-epass-rtf-2026')).toBe(true);
    expect(tsSchemes.some((s) => s.id === 'central-nsp-csss-2026')).toBe(true);

    // North eastern state specific scheme should not appear in default Telangana query
    expect(tsSchemes.some((s) => s.id === 'ner-ishan-uday-2026')).toBe(false);
  });

  it('provides audit log and version history records', () => {
    const logs = defaultSchemeRepository.getAuditLog('ts-epass-rtf-2026');
    expect(logs.length).toBeGreaterThan(0);
    expect(logs[0].actor).toBeDefined();

    const versions = defaultSchemeRepository.getVersionHistory('ts-epass-rtf-2026');
    expect(versions.length).toBeGreaterThan(0);
    expect(versions[0].changesSummary).toContain('income ceiling');
  });
});
