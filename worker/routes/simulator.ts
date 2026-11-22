import { Hono } from 'hono';
import { defaultSchemeRepository } from '../../src/core/data/repository';
import { defaultWhatIfService } from '../../src/core/simulator/what-if-service';
import { CitizenProfile } from '../../src/core/profile/citizen-profile';

export const simulatorRouter = new Hono();

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

  const scheme = defaultSchemeRepository.getById(schemeId) || defaultSchemeRepository.getBySlug(schemeId);
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
