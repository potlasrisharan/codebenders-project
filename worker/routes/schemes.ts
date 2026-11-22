import { Hono } from 'hono';
import { defaultSchemeRepository } from '../../src/core/data/repository';
import { NATIONAL_STATE_COVERAGE } from '../../src/core/data/coverage-registry';

export const schemesRouter = new Hono();

// GET /api/v1/schemes
schemesRouter.get('/', (c) => {
  const state = c.req.query('state');
  const category = c.req.query('category');
  const search = c.req.query('search')?.toLowerCase().trim();

  let schemes = state ? defaultSchemeRepository.getByState(state) : defaultSchemeRepository.getAll();

  if (category) {
    schemes = schemes.filter((s) => s.category === category);
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
    count: schemes.length,
    stateFilter: state || 'All Supported',
  });
});

// GET /api/v1/schemes/coverage
schemesRouter.get('/coverage', (c) => {
  return c.json({
    coverage: NATIONAL_STATE_COVERAGE,
    lastAuditDate: '2026-11-20',
  });
});

// GET /api/v1/schemes/:id
schemesRouter.get('/:id', (c) => {
  const id = c.req.param('id');
  const scheme = defaultSchemeRepository.getById(id) || defaultSchemeRepository.getBySlug(id);

  if (!scheme) {
    return c.json({ error: 'SCHEME_NOT_FOUND', message: `No verified scheme found for identifier "${id}".` }, 404);
  }

  return c.json({ data: scheme });
});
