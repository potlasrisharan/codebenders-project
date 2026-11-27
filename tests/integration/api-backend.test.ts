import { describe, expect, it } from 'vitest';
import { app } from '../../worker/index';
import { GOLDEN_PERSONAS } from '../../src/core/profile/citizen-profile';
import type { D1Database } from '../../worker/types';

describe('Hono API Backend (/api/v1)', () => {
  it('GET /api/v1/health returns status ok', async () => {
    const res = await app.request('/api/v1/health');
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.status).toBe('ok');
    expect(data.product).toBe('LabhSaathi API');
  });

  it('GET /api/v1/schemes returns verified government schemes', async () => {
    const res = await app.request('/api/v1/schemes?state=Telangana');
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.count).toBeGreaterThanOrEqual(4);
    expect(data.data.some((s: { id: string }) => s.id === 'ts-epass-rtf-2026')).toBe(true);
  });

  it('GET /api/v1/schemes/coverage returns national coverage registry', async () => {
    const res = await app.request('/api/v1/schemes/coverage');
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.coverage.length).toBeGreaterThan(5);
    expect(data.coverage.some((c: { stateCode: string }) => c.stateCode === 'TS')).toBe(true);
  });

  it('GET /api/v1/schemes/:id returns scheme details', async () => {
    const res = await app.request('/api/v1/schemes/ts-epass-rtf-2026');
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.data.name).toContain('Telangana ePASS');
    expect(data.data.feeStatus).toBe('free_verified');
    expect(data.data.documents.length).toBeGreaterThan(0);
  });

  it('POST /api/v1/intake/parse extracts profile facts from natural text', async () => {
    const res = await app.request('/api/v1/intake/parse', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        text: 'I am a 2nd year B.Tech student in Hyderabad, BC-B, income 1.5 Lakhs.',
      }),
    });
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.extractedProfile.domicileState).toBe('Telangana');
    expect(data.extractedProfile.educationLevel).toBe('undergraduate');
    expect(data.extractedProfile.socialCategory).toBe('BC-B');
    expect(data.extractedProfile.familyIncome).toBe(150000);
  });

  it('POST /api/v1/intake/parse blocks sensitive Aadhaar/PAN identifiers (FR-SEC-02)', async () => {
    const res = await app.request('/api/v1/intake/parse', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        text: 'My Aadhaar is 1234 5678 9012 and student id is 5566.',
      }),
    });
    expect(res.status).toBe(400);

    const data = await res.json();
    expect(data.error).toBe('SENSITIVE_IDENTIFIER_BLOCKED');
    expect(data.message).toBeDefined();
    // Raw identifier must never appear in response
    expect(JSON.stringify(data)).not.toContain('1234 5678 9012');
  });

  it('POST /api/v1/eligibility/evaluate returns canonical three-valued trace', async () => {
    const priya = GOLDEN_PERSONAS[0].profile;
    const res = await app.request('/api/v1/eligibility/evaluate', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        schemeId: 'ts-epass-rtf-2026',
        profile: priya,
      }),
    });
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.result.overallLabel).toBe('Likely eligible');
    expect(data.result.predicateTraces.length).toBeGreaterThan(0);
    expect(data.result.feeStatus).toBe('free_verified');
  });

  it('POST /api/v1/simulator/what-if runs simulation and returns delta', async () => {
    const vikram = GOLDEN_PERSONAS[4].profile;
    const res = await app.request('/api/v1/simulator/what-if', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        schemeId: 'ts-epass-rtf-2026',
        baseProfile: vikram,
        hypotheticalOverrides: {
          familyIncome: 150000,
          socialCategory: 'BC-B',
        },
      }),
    });
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.simulation.originalEligibility.overallLabel).toBe('Unlikely');
    expect(data.simulation.simulatedEligibility.overallLabel).toBe('Likely eligible');
    expect(data.simulation.labelChanged).toBe(true);
  });

  it('GET /api/v1/simulator/radar returns policy change diffs', async () => {
    const res = await app.request('/api/v1/simulator/radar?schemeId=ts-epass-rtf-2026');
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.diffs.length).toBeGreaterThan(0);
    expect(data.diffs[0].newVersion).toBe('2025-26.v1');
    expect(data.diffs[0].changeSummary).toContain('Income ceiling');
  });

  describe('D1-powered Scheme Search & Metadata Endpoints', () => {
    it('GET /api/v1/schemes/search returns filtered results from fallback repository', async () => {
      const res = await app.request('/api/v1/schemes/search?q=scholarship&state=Telangana');
      expect(res.status).toBe(200);

      const data = await res.json();
      expect(data.count).toBeGreaterThan(0);
      expect(data.data.some((s: { id: string }) => s.id === 'ts-epass-rtf-2026')).toBe(true);
      expect(data.source).toBe('in_memory');
    });

    it('POST /api/v1/schemes/search supports JSON discovery request', async () => {
      const res = await app.request('/api/v1/schemes/search', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          q: 'fee reimbursement',
          state: 'Telangana',
          limit: 5,
        }),
      });
      expect(res.status).toBe(200);

      const data = await res.json();
      expect(data.count).toBeGreaterThan(0);
      expect(data.data[0].id).toBe('ts-epass-rtf-2026');
    });

    it('GET /api/v1/schemes/categories returns category statistics', async () => {
      const res = await app.request('/api/v1/schemes/categories');
      expect(res.status).toBe(200);

      const data = await res.json();
      expect(Array.isArray(data.data)).toBe(true);
      expect(data.data.some((c: { category: string; count: number }) => c.category === 'scholarship')).toBe(true);
      expect(data.total).toBeGreaterThan(0);
    });

    it('GET /api/v1/schemes/states returns state distribution statistics', async () => {
      const res = await app.request('/api/v1/schemes/states');
      expect(res.status).toBe(200);

      const data = await res.json();
      expect(Array.isArray(data.data)).toBe(true);
      expect(data.data.some((s: { state: string; count: number }) => s.state === 'Telangana')).toBe(true);
      expect(data.total).toBeGreaterThan(0);
    });

    it('GET /api/v1/schemes/:id/sources returns verified provenance sources', async () => {
      const res = await app.request('/api/v1/schemes/ts-epass-rtf-2026/sources');
      expect(res.status).toBe(200);

      const data = await res.json();
      expect(data.schemeId).toBe('ts-epass-rtf-2026');
      expect(data.sources.length).toBeGreaterThan(0);
      expect(data.sources[0].portalUrl).toBe('https://telanganaepass.cgg.gov.in');
    });

    it('queries D1 database using FTS5 when DB binding is present', async () => {
      const mockD1 = {
        prepare: () => ({
          bind: () => ({
            all: async () => ({
              results: [
                {
                  id: 'd1-mock-scheme-1',
                  slug: 'd1-mock-scheme-1',
                  name: 'D1 FTS5 Verified Scheme',
                  short_description: 'Scholarship funded via D1 FTS5',
                  category: 'scholarship',
                  jurisdiction: 'central',
                  state: 'All India',
                  fee_status: 'free_verified',
                  rules_json: JSON.stringify([{ parameter: 'income', operator: 'LESS_THAN_OR_EQUAL', expectedValue: 200000 }]),
                  documents_json: JSON.stringify([{ id: 'd1', name: 'Income Certificate', requirementType: 'mandatory' }]),
                  steps_json: JSON.stringify([{ stepNumber: 1, title: 'Apply on portal', channel: 'online_portal' }]),
                  rank: -1.25,
                },
              ],
              success: true,
            }),
            first: async () => ({ total: 1 }),
          }),
        }),
      };

      const res = await app.request('/api/v1/schemes/search?q=scholarship', undefined, { DB: mockD1 as unknown as D1Database });
      expect(res.status).toBe(200);

      const data = await res.json();
      expect(data.source).toBe('d1_fts5');
      expect(data.count).toBe(1);
      expect(data.data[0].id).toBe('d1-mock-scheme-1');
      expect(data.data[0].rules.length).toBe(1);
      expect(data.data[0].documents.length).toBe(1);
      expect(data.data[0].applicationSteps.length).toBe(1);
    });

    it('falls back to LIKE when D1 FTS5 query throws a syntax error', async () => {
      let ftsAttempted = false;
      const mockD1 = {
        prepare: (query: string) => {
          if (query.includes('schemes_fts MATCH')) {
            ftsAttempted = true;
            return {
              bind: () => ({
                all: async () => {
                  throw new Error('fts5: syntax error near "-"');
                },
                first: async () => {
                  throw new Error('fts5: syntax error near "-"');
                },
              }),
            };
          }
          // LIKE query fallback
          return {
            bind: () => ({
              all: async () => ({
                results: [
                  {
                    id: 'd1-like-scheme-1',
                    name: 'D1 Like Matched Scheme',
                    short_description: 'Matched through safe LIKE fallback',
                    category: 'welfare',
                    jurisdiction: 'state',
                    state: 'Telangana',
                    rules_json: '[]',
                    documents_json: '[]',
                    steps_json: '[]',
                  },
                ],
                success: true,
              }),
              first: async () => ({ total: 1 }),
            }),
          };
        },
      };

      const res = await app.request('/api/v1/schemes/search?q=syntax-error-query', undefined, { DB: mockD1 as unknown as D1Database });
      expect(res.status).toBe(200);

      const data = await res.json();
      expect(ftsAttempted).toBe(true);
      expect(data.source).toBe('d1_like');
      expect(data.count).toBe(1);
      expect(data.data[0].id).toBe('d1-like-scheme-1');
    });
  });
});
