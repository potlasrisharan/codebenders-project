import { describe, expect, it } from 'vitest';
import fs from 'node:fs';
import path from 'node:path';
import { app } from '../worker/index';
import type { D1Database, D1PreparedStatement, SchemeDbRow } from '../worker/types';

describe('D1 Database & FTS5 Search Suite', () => {
  // -------------------------------------------------------------------------
  // 1. Data File Integrity & Schema Verification
  // -------------------------------------------------------------------------
  describe('Dataset Files Integrity', () => {
    const rootDir = process.cwd();
    const centralFile = path.join(rootDir, 'scripts/data/central-schemes.json');
    const stateFile = path.join(rootDir, 'scripts/data/state-schemes.json');

    it('scripts/data/central-schemes.json exists and contains valid central schemes', () => {
      expect(fs.existsSync(centralFile)).toBe(true);
      const raw = fs.readFileSync(centralFile, 'utf8');
      const data = JSON.parse(raw);

      expect(Array.isArray(data)).toBe(true);
      expect(data.length).toBeGreaterThanOrEqual(25);

      for (const scheme of data) {
        expect(scheme.id).toBeDefined();
        expect(scheme.slug).toBeDefined();
        expect(scheme.name).toBeDefined();
        expect(scheme.category).toBeDefined();
        expect(scheme.jurisdiction).toBe('central');
        expect(scheme.state).toBe('All India');
        expect(Array.isArray(scheme.rules)).toBe(true);
        expect(scheme.rules.length).toBeGreaterThan(0);
        expect(Array.isArray(scheme.documents)).toBe(true);
        expect(Array.isArray(scheme.applicationSteps)).toBe(true);
      }
    });

    it('scripts/data/state-schemes.json exists and covers key Indian states', () => {
      expect(fs.existsSync(stateFile)).toBe(true);
      const raw = fs.readFileSync(stateFile, 'utf8');
      const data = JSON.parse(raw);

      expect(Array.isArray(data)).toBe(true);
      expect(data.length).toBeGreaterThanOrEqual(30);

      const states = new Set(data.map((s: { state: string }) => s.state));
      expect(states.has('Telangana')).toBe(true);
      expect(states.has('Andhra Pradesh')).toBe(true);
      expect(states.has('Karnataka')).toBe(true);
      expect(states.has('Maharashtra')).toBe(true);
      expect(states.has('Tamil Nadu')).toBe(true);

      for (const scheme of data) {
        expect(scheme.id).toBeDefined();
        expect(scheme.name).toBeDefined();
        expect(scheme.category).toBeDefined();
        expect(scheme.jurisdiction).toBe('state');
        expect(Array.isArray(scheme.rules)).toBe(true);
        expect(Array.isArray(scheme.documents)).toBe(true);
        expect(Array.isArray(scheme.applicationSteps)).toBe(true);
      }
    });

    it('migrations/0001_create_schemes_table.sql exists with FTS5 virtual table and triggers', () => {
      const migrationFile = path.join(rootDir, 'migrations/0001_create_schemes_table.sql');
      expect(fs.existsSync(migrationFile)).toBe(true);
      const sql = fs.readFileSync(migrationFile, 'utf8');

      expect(sql).toContain('CREATE TABLE IF NOT EXISTS schemes');
      expect(sql).toContain('CREATE VIRTUAL TABLE IF NOT EXISTS schemes_fts USING fts5');
      expect(sql).toContain("tokenize = 'porter unicode61'");
      expect(sql).toContain('CREATE TRIGGER IF NOT EXISTS schemes_ai');
      expect(sql).toContain('CREATE TRIGGER IF NOT EXISTS schemes_ad');
      expect(sql).toContain('CREATE TRIGGER IF NOT EXISTS schemes_au');
    });

    it('scripts/seed-d1.mjs exists and generates seed SQL statements', () => {
      const seedScript = path.join(rootDir, 'scripts/seed-d1.mjs');
      expect(fs.existsSync(seedScript)).toBe(true);
      const script = fs.readFileSync(seedScript, 'utf8');
      expect(script).toContain('labhsaathi-schemes-db');
      expect(script).toContain('INSERT OR REPLACE INTO schemes');
    });
  });

  // -------------------------------------------------------------------------
  // 2. In-Memory Search Fallback
  // -------------------------------------------------------------------------
  describe('In-Memory Scheme Search (Without DB Binding)', () => {
    it('GET /api/v1/schemes/search returns filtered results with metadata', async () => {
      const res = await app.request('/api/v1/schemes/search?q=scholarship');
      expect(res.status).toBe(200);

      const json = await res.json();
      expect(json.source).toBe('in_memory');
      expect(json.count).toBeGreaterThan(0);
      expect(json.total).toBeGreaterThanOrEqual(json.count);
      expect(json.limit).toBe(20);
      expect(json.offset).toBe(0);
      expect(json.query).toBe('scholarship');

      const names = json.data.map((s: { name: string }) => s.name.toLowerCase());
      const descs = json.data.map((s: { shortDescription: string }) => s.shortDescription.toLowerCase());
      const hasTerm = names.some((n: string) => n.includes('scholarship')) || descs.some((d: string) => d.includes('scholarship'));
      expect(hasTerm).toBe(true);
    });

    it('GET /api/v1/schemes/search supports category, state, and jurisdiction filters', async () => {
      const res = await app.request('/api/v1/schemes/search?category=scholarship&state=Telangana&jurisdiction=state');
      expect(res.status).toBe(200);

      const json = await res.json();
      expect(json.count).toBeGreaterThan(0);
      for (const scheme of json.data) {
        expect(scheme.category.toLowerCase()).toBe('scholarship');
        expect(scheme.state.toLowerCase()).toBe('telangana');
        expect(scheme.jurisdiction.toLowerCase()).toBe('state');
      }
    });

    it('GET /api/v1/schemes/search handles pagination parameters correctly', async () => {
      const res = await app.request('/api/v1/schemes/search?limit=2&offset=1');
      expect(res.status).toBe(200);

      const json = await res.json();
      expect(json.limit).toBe(2);
      expect(json.offset).toBe(1);
      expect(json.data.length).toBeLessThanOrEqual(2);
    });

    it('POST /api/v1/schemes/search handles request body queries', async () => {
      const res = await app.request('/api/v1/schemes/search', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          q: 'reimbursement',
          state: 'Telangana',
          limit: 5,
          offset: 0,
        }),
      });
      expect(res.status).toBe(200);

      const json = await res.json();
      expect(json.count).toBeGreaterThan(0);
      expect(json.data.some((s: { id: string }) => s.id === 'ts-epass-rtf-2026')).toBe(true);
    });

    it('GET /api/v1/schemes/:id returns 404 for unknown identifier', async () => {
      const res = await app.request('/api/v1/schemes/non-existent-scheme-999');
      expect(res.status).toBe(404);

      const json = await res.json();
      expect(json.error).toBe('SCHEME_NOT_FOUND');
    });
  });

  // -------------------------------------------------------------------------
  // 3. D1-Bound Search with SQLite FTS5 and BM25 Ranking
  // -------------------------------------------------------------------------
  describe('D1 Database Binding & FTS5 BM25 Engine', () => {
    const sampleDbRows: SchemeDbRow[] = [
      {
        id: 'central-pm-kisan',
        slug: 'central-pm-kisan',
        name: 'PM-KISAN (Pradhan Mantri Kisan Samman Nidhi)',
        short_description: 'Income support of Rs. 6,000 per year for farmer families',
        full_description: 'Financial assistance of Rs. 6,000 per year in three equal installments to farmer families across India.',
        category: 'agriculture',
        jurisdiction: 'central',
        state: 'All India',
        ministry: 'Ministry of Agriculture and Farmers Welfare',
        department: 'Department of Agriculture and Farmers Welfare',
        portal_url: 'https://pmkisan.gov.in',
        fee_status: 'free_verified',
        benefit_details: 'Rs. 6000 per annum',
        eligibility_summary: 'Small and marginal farmers holding cultivable land',
        rules_json: JSON.stringify([
          { parameter: 'occupation', operator: 'EQUALS', expectedValue: 'farmer', isMandatory: true, conditionName: 'Farmer' },
        ]),
        documents_json: JSON.stringify([
          { name: 'Aadhaar Card', requirementType: 'mandatory' },
          { name: 'Land Record', requirementType: 'mandatory' },
        ]),
        steps_json: JSON.stringify([
          { stepNumber: 1, title: 'Portal registration', channel: 'online_portal' },
        ]),
        rank: -3.85,
      },
      {
        id: 'ts-epass-rtf-2026',
        slug: 'ts-epass-rtf-2026',
        name: 'Telangana ePASS Post-Matric Scholarship (RTF)',
        short_description: 'Full tuition fee reimbursement for SC, ST, BC, EBC, Minority students in Telangana',
        full_description: 'Post-matric scholarship reimbursement for eligible students.',
        category: 'scholarship',
        jurisdiction: 'state',
        state: 'Telangana',
        ministry: 'BC Welfare Department',
        department: 'BC Welfare Department',
        portal_url: 'https://telanganaepass.cgg.gov.in',
        fee_status: 'free_verified',
        benefit_details: '100% Tuition Fee Reimbursement',
        eligibility_summary: 'Annual family income <= Rs. 2,00,000 (rural) or <= Rs. 2,00,000 (urban)',
        rules_json: JSON.stringify([
          { parameter: 'income', operator: 'LESS_THAN_OR_EQUAL', expectedValue: 200000, isMandatory: true, conditionName: 'Income limit' },
        ]),
        documents_json: JSON.stringify([
          { name: 'Income Certificate', requirementType: 'mandatory' },
        ]),
        steps_json: JSON.stringify([
          { stepNumber: 1, title: 'Online Application', channel: 'online_portal' },
        ]),
        rank: -4.12,
      },
    ];

    function createMockD1(options?: { failFts?: boolean; failLike?: boolean; emptyResults?: boolean }): D1Database {
      return {
        prepare: (query: string): D1PreparedStatement => {
          let boundParams: unknown[] = [];

          const stmt: D1PreparedStatement = {
            bind: (...values: unknown[]) => {
              boundParams = values;
              return stmt;
            },
            first: async <T = unknown>() => {
              if (options?.failFts && query.includes('schemes_fts MATCH')) {
                throw new Error('SQLite FTS5 syntax error');
              }
              if (options?.failLike && query.includes('LIKE')) {
                throw new Error('D1 connection failure');
              }
              if (query.includes('count(*)')) {
                return { total: options?.emptyResults ? 0 : sampleDbRows.length } as T;
              }
              if (query.includes('WHERE id = ? OR slug = ?')) {
                const targetId = boundParams[0];
                const found = sampleDbRows.find((r) => r.id === targetId || r.slug === targetId);
                return (found || null) as T;
              }
              return null;
            },
            all: async <T = unknown>() => {
              if (options?.failFts && query.includes('schemes_fts MATCH')) {
                throw new Error('SQLite FTS5 syntax error');
              }
              if (options?.failLike && query.includes('LIKE')) {
                throw new Error('D1 connection failure');
              }
              if (query.includes('GROUP BY category')) {
                return {
                  results: [
                    { category: 'scholarship', count: 18 },
                    { category: 'agriculture', count: 12 },
                    { category: 'healthcare', count: 10 },
                  ] as T[],
                  success: true,
                };
              }
              if (query.includes('GROUP BY state')) {
                return {
                  results: [
                    { state: 'All India', count: 30 },
                    { state: 'Telangana', count: 10 },
                    { state: 'Andhra Pradesh', count: 6 },
                  ] as T[],
                  success: true,
                };
              }
              if (options?.emptyResults) {
                return { results: [] as T[], success: true };
              }
              return { results: sampleDbRows as T[], success: true };
            },
            run: async <T = unknown>() => ({ results: [] as T[], success: true }),
            raw: async <T = unknown>() => [] as T[],
          };

          return stmt;
        },
        dump: async () => new ArrayBuffer(0),
        batch: async () => [],
        exec: async () => ({ count: 1, duration: 0 }),
      };
    }

    it('GET /api/v1/schemes/search uses FTS5 and BM25 rank when D1 is bound', async () => {
      const mockDb = createMockD1();
      const res = await app.request('/api/v1/schemes/search?q=farmer', undefined, { DB: mockDb });
      expect(res.status).toBe(200);

      const json = await res.json();
      expect(json.source).toBe('d1_fts5');
      expect(json.count).toBe(2);
      expect(json.data[0].id).toBe('central-pm-kisan');
      expect(json.data[0].rank).toBe(-3.85);
      expect(json.data[0].rules.length).toBe(1);
      expect(json.data[0].documents.length).toBe(2);
      expect(json.data[0].applicationSteps.length).toBe(1);
    });

    it('falls back to LIKE when FTS5 syntax error occurs in D1', async () => {
      const mockDb = createMockD1({ failFts: true });
      const res = await app.request('/api/v1/schemes/search?q=farmer%20OR%20NOT%20invalid', undefined, { DB: mockDb });
      expect(res.status).toBe(200);

      const json = await res.json();
      expect(json.source).toBe('d1_like');
      expect(json.count).toBe(2);
    });

    it('falls back to in-memory repository when both FTS5 and LIKE fail in D1', async () => {
      const mockDb = createMockD1({ failFts: true, failLike: true });
      const res = await app.request('/api/v1/schemes/search?q=scholarship', undefined, { DB: mockDb });
      expect(res.status).toBe(200);

      const json = await res.json();
      expect(json.source).toBe('in_memory');
      expect(json.count).toBeGreaterThan(0);
    });

    it('GET /api/v1/schemes/:id fetches scheme from D1 and decodes JSON fields', async () => {
      const mockDb = createMockD1();
      const res = await app.request('/api/v1/schemes/central-pm-kisan', undefined, { DB: mockDb });
      expect(res.status).toBe(200);

      const json = await res.json();
      expect(json.data.id).toBe('central-pm-kisan');
      expect(json.data.name).toContain('PM-KISAN');
      expect(json.data.rules).toBeInstanceOf(Array);
      expect(json.data.rules[0].parameter).toBe('occupation');
      expect(json.data.documents[0].name).toBe('Aadhaar Card');
      expect(json.data.applicationSteps[0].title).toBe('Portal registration');
    });

    it('GET /api/v1/schemes/categories returns D1 grouped counts', async () => {
      const mockDb = createMockD1();
      const res = await app.request('/api/v1/schemes/categories', undefined, { DB: mockDb });
      expect(res.status).toBe(200);

      const json = await res.json();
      expect(json.source).toBe('d1');
      expect(json.total).toBe(40);
      expect(json.data[0].category).toBe('scholarship');
      expect(json.data[0].count).toBe(18);
    });

    it('GET /api/v1/schemes/states returns D1 grouped states', async () => {
      const mockDb = createMockD1();
      const res = await app.request('/api/v1/schemes/states', undefined, { DB: mockDb });
      expect(res.status).toBe(200);

      const json = await res.json();
      expect(json.source).toBe('d1');
      expect(json.total).toBe(46);
      expect(json.data[0].state).toBe('All India');
      expect(json.data[0].count).toBe(30);
    });

    it('GET /api/v1/schemes/:id/sources returns verified provenance sources for scheme', async () => {
      const mockDb = createMockD1();
      const res = await app.request('/api/v1/schemes/central-pm-kisan/sources', undefined, { DB: mockDb });
      expect(res.status).toBe(200);

      const json = await res.json();
      expect(json.schemeId).toBe('central-pm-kisan');
      expect(json.sources.length).toBeGreaterThan(0);
      expect(json.sources[0].portalUrl).toContain('pmkisan.gov.in');
    });
  });
});
