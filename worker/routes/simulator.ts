import { Hono } from 'hono';
import { defaultSchemeRepository } from '../../src/core/data/repository';
import { defaultWhatIfService } from '../../src/core/simulator/what-if-service';
import { CitizenProfile } from '../../src/core/profile/citizen-profile';
import { mapDbRowToScheme } from './schemes';
import type { Env, SchemeDbRow } from '../types';

export const simulatorRouter = new Hono<{ Bindings: Env }>();

// POST /api/v1/simulator/what-if
simulatorRouter.post('/what-if', async (c) => {
  const body = await c.req.json().catch(() => ({}));
  const { schemeId, baseProfile, hypotheticalOverrides } = body as {
    schemeId: string;
    baseProfile: CitizenProfile;
    hypotheticalOverrides: Partial<CitizenProfile>;
  };

  if (!schemeId || !baseProfile || !hypotheticalOverrides) {
    return c.json(
      {
        error: 'INVALID_INPUT',
        message: 'Fields "schemeId", "baseProfile", and "hypotheticalOverrides" are required.',
      },
      400
    );
  }

  let scheme = defaultSchemeRepository.getById(schemeId) || defaultSchemeRepository.getBySlug(schemeId);

  if (!scheme && c.env?.DB) {
    try {
      const row = await c.env.DB.prepare(
        'SELECT * FROM schemes WHERE id = ? OR slug = ? LIMIT 1'
      ).bind(schemeId, schemeId).first<SchemeDbRow>();
      if (row) {
        scheme = mapDbRowToScheme(row) as unknown as typeof scheme;
      }
    } catch {
      // safe fallback
    }
  }

  if (!scheme) {
    return c.json({ error: 'SCHEME_NOT_FOUND', message: `No verified scheme found with ID "${schemeId}".` }, 404);
  }

  const simulation = defaultWhatIfService.simulate(scheme, baseProfile, hypotheticalOverrides);
  return c.json({ simulation });
});

// GET /api/v1/simulator/radar
simulatorRouter.get('/radar', (c) => {
  const schemeId = c.req.query('schemeId');
  const diffs = defaultWhatIfService.getSchemeChangeDiffs(schemeId);
  return c.json({ diffs });
});
