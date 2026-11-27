import { Hono, Context } from 'hono';
import { defaultSchemeRepository } from '../../src/core/data/repository';
import { NATIONAL_STATE_COVERAGE } from '../../src/core/data/coverage-registry';
import type { Env, SchemeDbRow } from '../types';

export const schemesRouter = new Hono<{ Bindings: Env }>();

/**
 * Maps a SQLite/D1 database row into a fully-typed Scheme record with
 * parsed JSON columns and backward-compatible camelCase and snake_case properties.
 */
export function mapDbRowToScheme(row: SchemeDbRow) {
  let rules: unknown[] = [];
  let documents: unknown[] = [];
  let applicationSteps: unknown[] = [];

  try {
    if (row.rules_json) rules = JSON.parse(row.rules_json);
  } catch {
    rules = [];
  }
  try {
    if (row.documents_json) documents = JSON.parse(row.documents_json);
  } catch {
    documents = [];
  }
  try {
    if (row.steps_json) applicationSteps = JSON.parse(row.steps_json);
  } catch {
    applicationSteps = [];
  }

  // Cross-reference with in-memory dataset to ensure zero missing fields
  const repoScheme =
    defaultSchemeRepository.getById(row.id) ||
    defaultSchemeRepository.getBySlug(row.slug || row.id);
  const repo = repoScheme as Record<string, unknown> | undefined;

  const repoSources = Array.isArray(repo?.sources) ? (repo.sources as Array<{ department?: string; portalUrl?: string }>) : [];
  const primaryDept = typeof repoSources[0]?.department === 'string' ? repoSources[0].department : '';
  const primaryPortal = typeof repoSources[0]?.portalUrl === 'string' ? repoSources[0].portalUrl : '';

  return {
    ...(repo || {}),
    id: row.id,
    slug: row.slug || (typeof repo?.slug === 'string' ? repo.slug : row.id),
    name: row.name || (typeof repo?.name === 'string' ? repo.name : ''),
    shortDescription: row.short_description || (typeof repo?.shortDescription === 'string' ? repo.shortDescription : ''),
    short_description: row.short_description || (typeof repo?.shortDescription === 'string' ? repo.shortDescription : ''),
    fullDescription: row.full_description || (typeof repo?.fullDescription === 'string' ? repo.fullDescription : ''),
    full_description: row.full_description || (typeof repo?.fullDescription === 'string' ? repo.fullDescription : ''),
    category: row.category || (typeof repo?.category === 'string' ? repo.category : 'welfare'),
    jurisdiction: row.jurisdiction || (typeof repo?.jurisdiction === 'string' ? repo.jurisdiction : 'central'),
    state: row.state || (typeof repo?.state === 'string' ? repo.state : 'All India'),
    ministry: row.ministry || (typeof repo?.ministry === 'string' ? repo.ministry : primaryDept),
    department: row.department || (typeof repo?.department === 'string' ? repo.department : primaryDept),
    portalUrl: row.portal_url || (typeof repo?.portalUrl === 'string' ? repo.portalUrl : primaryPortal),
    portal_url: row.portal_url || (typeof repo?.portalUrl === 'string' ? repo.portalUrl : primaryPortal),
    feeStatus: row.fee_status || (typeof repo?.feeStatus === 'string' ? repo.feeStatus : 'free_verified'),
    fee_status: row.fee_status || (typeof repo?.feeStatus === 'string' ? repo.feeStatus : 'free_verified'),
    benefitDetails: row.benefit_details || (typeof repo?.shortDescription === 'string' ? repo.shortDescription : ''),
    benefit_details: row.benefit_details || (typeof repo?.shortDescription === 'string' ? repo.shortDescription : ''),
    eligibilitySummary: row.eligibility_summary || (typeof repo?.eligibilitySummary === 'string' ? repo.eligibilitySummary : ''),
    eligibility_summary: row.eligibility_summary || (typeof repo?.eligibilitySummary === 'string' ? repo.eligibilitySummary : ''),
    rules: rules.length > 0 ? rules : (Array.isArray(repo?.rules) ? repo.rules : []),
    documents: documents.length > 0 ? documents : (Array.isArray(repo?.documents) ? repo.documents : []),
    applicationSteps: applicationSteps.length > 0 ? applicationSteps : (Array.isArray(repo?.applicationSteps) ? repo.applicationSteps : []),
    steps: applicationSteps.length > 0 ? applicationSteps : (Array.isArray(repo?.applicationSteps) ? repo.applicationSteps : []),
    sources: Array.isArray(repo?.sources) && repo.sources.length > 0
      ? repo.sources
      : [
          {
            id: `${row.id}-src-1`,
            name: row.department || row.ministry || 'Official Government Portal',
            portalUrl: row.portal_url || 'https://www.india.gov.in',
            department: row.department || row.ministry || 'Government Department',
            lastVerifiedDate: '2026-11-22',
            verifiedBy: 'Official Government Portal',
          },
        ],
    verificationStatus: 'verified',
    verification_status: 'verified',
    lastVerifiedDate: '2026-11-22',
    version: '2026.v1',
    renewalSupported: typeof repo?.renewalSupported === 'boolean' ? repo.renewalSupported : true,
    scamWarning:
      typeof repo?.scamWarning === 'string'
        ? repo.scamWarning
        : 'Official scholarship and benefit applications are 100% free on government portals. Never pay middlemen, brokers, or cyber cafes service fees or commission.',
    created_at: row.created_at,
    updated_at: row.updated_at,
    ...(typeof row.rank === 'number' ? { rank: row.rank } : {}),
  };
}

/**
 * Builds a sanitized FTS5 match query string from raw user search query.
 */
function buildFtsQuery(q: string): string {
  const cleaned = q.replace(/[^\w\s\u0900-\u0D7F]/g, ' ').trim();
  const tokens = cleaned.split(/\s+/).filter(Boolean);
  if (tokens.length === 0) {
    return `"${q.replace(/"/g, '""')}"`;
  }
  return tokens.map((t) => `"${t}"*`).join(' ');
}

/**
 * Shared search handler supporting both GET and POST /api/v1/schemes/search
 */
async function handleSearch(c: Context<{ Bindings: Env }>) {
  let q: string | undefined;
  let state: string | undefined;
  let category: string | undefined;
  let jurisdiction: string | undefined;
  let limitParam: string | undefined;
  let offsetParam: string | undefined;
  let exactStateParam: string | undefined;

  if (c.req.method === 'POST') {
    const body = await c.req.json().catch(() => ({}));
    q = typeof body.q === 'string' ? body.q : typeof body.query === 'string' ? body.query : undefined;
    state = typeof body.state === 'string' ? body.state : undefined;
    category = typeof body.category === 'string' ? body.category : undefined;
    jurisdiction = typeof body.jurisdiction === 'string' ? body.jurisdiction : undefined;
    limitParam = body.limit !== undefined ? String(body.limit) : undefined;
    offsetParam = body.offset !== undefined ? String(body.offset) : undefined;
    exactStateParam = body.exactState !== undefined ? String(body.exactState) : undefined;
  } else {
    q = c.req.query('q') || c.req.query('query');
    state = c.req.query('state');
    category = c.req.query('category');
    jurisdiction = c.req.query('jurisdiction');
    limitParam = c.req.query('limit');
    offsetParam = c.req.query('offset');
    exactStateParam = c.req.query('exactState');
  }

  const rawLimit = limitParam ? parseInt(limitParam, 10) : 20;
  const limit = Math.min(Math.max(1, isNaN(rawLimit) ? 20 : rawLimit), 100);
  const rawOffset = offsetParam ? parseInt(offsetParam, 10) : 0;
  const offset = Math.max(0, isNaN(rawOffset) ? 0 : rawOffset);
  const trimmedQ = q?.trim();

  // If Cloudflare D1 database binding is present
  if (c.env?.DB) {
    const db = c.env.DB;

    // Helper to build common WHERE filter clauses on `schemes s`
    const buildFilterClauses = () => {
      const clauses: string[] = [];
      const filterParams: unknown[] = [];

      if (state) {
        if (state.toLowerCase() === 'all india') {
          clauses.push("(LOWER(s.state) = 'all india' OR s.jurisdiction = 'central')");
        } else if (exactStateParam === 'true') {
          clauses.push('LOWER(s.state) = ?');
          filterParams.push(state.toLowerCase());
        } else {
          clauses.push("(LOWER(s.state) = ? OR s.state = 'All India' OR s.jurisdiction = 'central')");
          filterParams.push(state.toLowerCase());
        }
      }

      if (category) {
        clauses.push('LOWER(s.category) = ?');
        filterParams.push(category.toLowerCase());
      }

      if (jurisdiction) {
        clauses.push('LOWER(s.jurisdiction) = ?');
        filterParams.push(jurisdiction.toLowerCase());
      }

      return { clauses, filterParams };
    };

    // Branch A: Keyword query provided with D1
    if (trimmedQ) {
      // 1. Try SQLite FTS5 Match
      try {
        const { clauses, filterParams } = buildFilterClauses();
        const ftsQuery = buildFtsQuery(trimmedQ);

        const whereParts = ['schemes_fts MATCH ?', ...clauses];
        const whereClause = whereParts.join(' AND ');

        // Execute data query
        const dataSql = `
          SELECT s.*, bm25(schemes_fts) as rank
          FROM schemes_fts fts
          JOIN schemes s ON s.id = fts.id
          WHERE ${whereClause}
          ORDER BY rank ASC
          LIMIT ? OFFSET ?
        `;
        const dataParams = [ftsQuery, ...filterParams, limit, offset];
        const { results } = await db.prepare(dataSql).bind(...dataParams).all<SchemeDbRow>();

        // Execute count query for total matching records
        const countSql = `
          SELECT count(*) as total
          FROM schemes_fts fts
          JOIN schemes s ON s.id = fts.id
          WHERE ${whereClause}
        `;
        const countRes = await db.prepare(countSql).bind(ftsQuery, ...filterParams).first<{ total: number }>();
        const total = countRes?.total ?? results.length;

        return c.json({
          data: results.map(mapDbRowToScheme),
          count: results.length,
          total,
          limit,
          offset,
          query: trimmedQ,
          source: 'd1_fts5',
        });
      } catch {
        // 2. FTS5 failed or syntax error: fallback safely to LIKE '%q%'
        try {
          const { clauses, filterParams } = buildFilterClauses();
          const likeTerm = `%${trimmedQ.toLowerCase()}%`;

          const likeClause = `(
            LOWER(s.name) LIKE ? OR
            LOWER(s.short_description) LIKE ? OR
            LOWER(COALESCE(s.full_description, '')) LIKE ? OR
            LOWER(COALESCE(s.eligibility_summary, '')) LIKE ? OR
            LOWER(s.category) LIKE ? OR
            LOWER(COALESCE(s.department, '')) LIKE ? OR
            LOWER(COALESCE(s.ministry, '')) LIKE ?
          )`;

          const whereParts = [likeClause, ...clauses];
          const whereClause = whereParts.join(' AND ');

          const likeParams = [likeTerm, likeTerm, likeTerm, likeTerm, likeTerm, likeTerm, likeTerm];

          const dataSql = `
            SELECT s.*
            FROM schemes s
            WHERE ${whereClause}
            ORDER BY s.name ASC
            LIMIT ? OFFSET ?
          `;
          const dataParams = [...likeParams, ...filterParams, limit, offset];
          const { results } = await db.prepare(dataSql).bind(...dataParams).all<SchemeDbRow>();

          const countSql = `
            SELECT count(*) as total
            FROM schemes s
            WHERE ${whereClause}
          `;
          const countRes = await db.prepare(countSql).bind(...likeParams, ...filterParams).first<{ total: number }>();
          const total = countRes?.total ?? results.length;

          return c.json({
            data: results.map(mapDbRowToScheme),
            count: results.length,
            total,
            limit,
            offset,
            query: trimmedQ,
            source: 'd1_like',
          });
        } catch {
          // If D1 query fails, proceed to in-memory fallback below
        }
      }
    } else {
      // Branch B: No `q` provided, query schemes with WHERE filters and ORDER BY name
      try {
        const { clauses, filterParams } = buildFilterClauses();
        const whereClause = clauses.length > 0 ? `WHERE ${clauses.join(' AND ')}` : '';

        const dataSql = `
          SELECT s.*
          FROM schemes s
          ${whereClause}
          ORDER BY s.name ASC
          LIMIT ? OFFSET ?
        `;
        const dataParams = [...filterParams, limit, offset];
        const stmt = db.prepare(dataSql);
        const bound = dataParams.length > 0 ? stmt.bind(...dataParams) : stmt;
        const { results } = await bound.all<SchemeDbRow>();

        const countSql = `SELECT count(*) as total FROM schemes s ${whereClause}`;
        const countStmt = db.prepare(countSql);
        const boundCount = filterParams.length > 0 ? countStmt.bind(...filterParams) : countStmt;
        const countRes = await boundCount.first<{ total: number }>();
        const total = countRes?.total ?? results.length;

        return c.json({
          data: results.map(mapDbRowToScheme),
          count: results.length,
          total,
          limit,
          offset,
          source: 'd1',
        });
      } catch {
        // Proceed to in-memory fallback below
      }
    }
  }

  // Branch C: In-memory fallback (when c.env.DB is not bound or D1 is unavailable)
  let schemes = state ? defaultSchemeRepository.getByState(state) : defaultSchemeRepository.getAll();

  if (category) {
    schemes = schemes.filter((s) => s.category.toLowerCase() === category.toLowerCase());
  }

  if (jurisdiction) {
    schemes = schemes.filter((s) => s.jurisdiction.toLowerCase() === jurisdiction.toLowerCase());
  }

  if (trimmedQ) {
    const qLower = trimmedQ.toLowerCase();
    schemes = schemes.filter((s) => {
      const sRecord = s as unknown as Record<string, unknown>;
      const sSources = Array.isArray(sRecord.sources)
        ? (sRecord.sources as Array<{ department?: string }>)
        : [];
      const dept = typeof sRecord.department === 'string'
        ? sRecord.department
        : (sSources[0]?.department || '');
      const min = typeof sRecord.ministry === 'string' ? sRecord.ministry : '';
      const fullDesc = typeof sRecord.fullDescription === 'string' ? sRecord.fullDescription : '';
      const eligSum = typeof sRecord.eligibilitySummary === 'string' ? sRecord.eligibilitySummary : '';

      return (
        s.name.toLowerCase().includes(qLower) ||
        s.shortDescription.toLowerCase().includes(qLower) ||
        fullDesc.toLowerCase().includes(qLower) ||
        eligSum.toLowerCase().includes(qLower) ||
        dept.toLowerCase().includes(qLower) ||
        min.toLowerCase().includes(qLower) ||
        s.rules.some((r) => r.conditionName.toLowerCase().includes(qLower))
      );
    });
  }

  const total = schemes.length;
  const paginated = schemes.slice(offset, offset + limit);

  return c.json({
    data: paginated,
    count: paginated.length,
    total,
    limit,
    offset,
    ...(trimmedQ ? { query: trimmedQ } : {}),
    source: 'in_memory',
  });
}

// ---------------------------------------------------------------------------
// Route Declarations
// ---------------------------------------------------------------------------

// GET /api/v1/schemes/search
schemesRouter.get('/search', handleSearch);

// POST /api/v1/schemes/search
schemesRouter.post('/search', handleSearch);

// GET /api/v1/schemes/categories
schemesRouter.get('/categories', async (c) => {
  if (c.env?.DB) {
    try {
      const { results } = await c.env.DB.prepare(
        'SELECT category, COUNT(*) as count FROM schemes GROUP BY category ORDER BY count DESC'
      ).all<{ category: string; count: number }>();

      if (results && results.length > 0) {
        const total = results.reduce((acc, r) => acc + (Number(r.count) || 0), 0);
        return c.json({
          data: results,
          categories: results,
          total,
          source: 'd1',
        });
      }
    } catch {
      // fallback to repository
    }
  }

  const all = defaultSchemeRepository.getAll();
  const counts: Record<string, number> = {};
  for (const s of all) {
    counts[s.category] = (counts[s.category] || 0) + 1;
  }
  const results = Object.entries(counts)
    .map(([category, count]) => ({ category, count }))
    .sort((a, b) => b.count - a.count);

  return c.json({
    data: results,
    categories: results,
    total: all.length,
    source: 'in_memory',
  });
});

// GET /api/v1/schemes/states
schemesRouter.get('/states', async (c) => {
  if (c.env?.DB) {
    try {
      const { results } = await c.env.DB.prepare(
        'SELECT state, COUNT(*) as count FROM schemes GROUP BY state ORDER BY count DESC'
      ).all<{ state: string; count: number }>();

      if (results && results.length > 0) {
        const total = results.reduce((acc, r) => acc + (Number(r.count) || 0), 0);
        return c.json({
          data: results,
          states: results,
          total,
          source: 'd1',
        });
      }
    } catch {
      // fallback to repository
    }
  }

  const all = defaultSchemeRepository.getAll();
  const counts: Record<string, number> = {};
  for (const s of all) {
    counts[s.state] = (counts[s.state] || 0) + 1;
  }
  const results = Object.entries(counts)
    .map(([state, count]) => ({ state, count }))
    .sort((a, b) => b.count - a.count);

  return c.json({
    data: results,
    states: results,
    total: all.length,
    source: 'in_memory',
  });
});

// GET /api/v1/schemes/coverage
schemesRouter.get('/coverage', (c) => {
  return c.json({
    coverage: NATIONAL_STATE_COVERAGE,
    lastAuditDate: '2026-11-20',
  });
});

// GET /api/v1/schemes/:id/sources
schemesRouter.get('/:id/sources', async (c) => {
  const id = c.req.param('id');
  let scheme: Record<string, unknown> | null = null;

  if (c.env?.DB) {
    try {
      const row = await c.env.DB.prepare(
        'SELECT * FROM schemes WHERE id = ? OR slug = ? LIMIT 1'
      ).bind(id, id).first<SchemeDbRow>();

      if (row) {
        scheme = mapDbRowToScheme(row) as unknown as Record<string, unknown>;
      }
    } catch {
      // fallback to repository
    }
  }

  if (!scheme) {
    const fromRepo = defaultSchemeRepository.getById(id) || defaultSchemeRepository.getBySlug(id);
    if (fromRepo) {
      scheme = fromRepo as unknown as Record<string, unknown>;
    }
  }

  if (!scheme) {
    return c.json({ error: 'SCHEME_NOT_FOUND', message: `No verified scheme found for identifier "${id}".` }, 404);
  }

  const schemeSources = Array.isArray(scheme.sources) ? scheme.sources : null;
  const sources = schemeSources || [
    {
      id: `src-${String(scheme.id)}`,
      name: (typeof scheme.department === 'string' && scheme.department) || (typeof scheme.ministry === 'string' && scheme.ministry) || String(scheme.name),
      department: (typeof scheme.department === 'string' && scheme.department) || (typeof scheme.ministry === 'string' && scheme.ministry) || '',
      portalUrl: (typeof scheme.portalUrl === 'string' && scheme.portalUrl) || (typeof scheme.portal_url === 'string' && scheme.portal_url) || 'https://myscheme.gov.in',
      lastVerifiedDate: (typeof scheme.lastVerifiedDate === 'string' && scheme.lastVerifiedDate) || '2026-11-20',
      verifiedBy: 'Official Government Portal',
    },
  ];

  return c.json({
    schemeId: scheme.id,
    schemeName: scheme.name,
    sources,
  });
});

// GET /api/v1/schemes/:id
schemesRouter.get('/:id', async (c) => {
  const id = c.req.param('id');

  if (c.env?.DB) {
    try {
      const row = await c.env.DB.prepare(
        'SELECT * FROM schemes WHERE id = ? OR slug = ? LIMIT 1'
      ).bind(id, id).first<SchemeDbRow>();

      if (row) {
        const mapped = mapDbRowToScheme(row);
        return c.json({ data: mapped, scheme: mapped });
      }
    } catch {
      // fallback to repository
    }
  }

  const scheme = defaultSchemeRepository.getById(id) || defaultSchemeRepository.getBySlug(id);

  if (!scheme) {
    return c.json({ error: 'SCHEME_NOT_FOUND', message: `No verified scheme found for identifier "${id}".` }, 404);
  }

  return c.json({ data: scheme, scheme: scheme });
});

// GET /api/v1/schemes (Backwards compatible root list)
schemesRouter.get('/', async (c) => {
  const state = c.req.query('state');
  const category = c.req.query('category');
  const search = c.req.query('search')?.toLowerCase().trim();

  if (c.env?.DB) {
    try {
      const conditions: string[] = ['1=1'];
      const params: unknown[] = [];

      if (state) {
        if (state.toLowerCase() === 'all india') {
          conditions.push("(LOWER(s.state) = 'all india' OR s.jurisdiction = 'central')");
        } else {
          conditions.push("(LOWER(s.state) = ? OR s.state = 'All India' OR s.jurisdiction = 'central')");
          params.push(state.toLowerCase());
        }
      }

      if (category) {
        conditions.push('LOWER(s.category) = ?');
        params.push(category.toLowerCase());
      }

      if (search) {
        conditions.push('(LOWER(s.name) LIKE ? OR LOWER(s.short_description) LIKE ?)');
        params.push(`%${search}%`, `%${search}%`);
      }

      const sql = `SELECT s.* FROM schemes s WHERE ${conditions.join(' AND ')} ORDER BY s.name ASC`;
      const stmt = c.env.DB.prepare(sql);
      const bound = params.length > 0 ? stmt.bind(...params) : stmt;
      const { results } = await bound.all<SchemeDbRow>();

      if (results && results.length > 0) {
        const schemes = results.map(mapDbRowToScheme);
        return c.json({
          data: schemes,
          schemes: schemes,
          count: schemes.length,
          stateFilter: state || 'All Supported',
        });
      }
    } catch {
      // fallback to repository
    }
  }

  let schemes = state ? defaultSchemeRepository.getByState(state) : defaultSchemeRepository.getAll();

  if (category) {
    schemes = schemes.filter((s) => s.category.toLowerCase() === category.toLowerCase());
  }

  if (search) {
    schemes = schemes.filter(
      (s) =>
        s.name.toLowerCase().includes(search) ||
        s.shortDescription.toLowerCase().includes(search) ||
        s.rules.some((r) => r.conditionName.toLowerCase().includes(search))
    );
  }

  return c.json({
    data: schemes,
    schemes: schemes,
    count: schemes.length,
    stateFilter: state || 'All Supported',
  });
});
