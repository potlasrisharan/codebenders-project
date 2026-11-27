import { Hono } from 'hono';
import { defaultSchemeRepository } from '../../src/core/data/repository';
import { evaluateSchemeEligibility } from '../../src/core/engine/eligibility-engine';
import { defaultDiscoveryService } from '../../src/core/discovery/discovery-service';
import { CitizenProfile } from '../../src/core/profile/citizen-profile';
import { mapDbRowToScheme } from './schemes';
import type { Env, SchemeDbRow } from '../types';

export const eligibilityRouter = new Hono<{ Bindings: Env }>();

// POST /api/v1/eligibility/evaluate
eligibilityRouter.post('/evaluate', async (c) => {
  const body = await c.req.json().catch(() => ({}));
  const { schemeId, profile } = body as { schemeId: string; profile: CitizenProfile };

  if (!schemeId || !profile) {
    return c.json({ error: 'INVALID_INPUT', message: 'Both "schemeId" and "profile" are required.' }, 400);
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

  const result = evaluateSchemeEligibility(scheme, profile);
  return c.json({ result });
});

// POST /api/v1/eligibility/discover
eligibilityRouter.post('/discover', async (c) => {
  const body = await c.req.json().catch(() => ({}));
  const { profile, query } = body as { profile: CitizenProfile; query?: { state?: string; category?: string; keyword?: string } };

  if (!profile) {
    return c.json({ error: 'INVALID_INPUT', message: 'Field "profile" is required.' }, 400);
  }

  const discovery = defaultDiscoveryService.discover(profile, query);
  return c.json(discovery);
});
