import { Hono } from 'hono';
import { extractProfileFromText, GOLDEN_PERSONAS, ADAPTIVE_QUESTIONS } from '../../src/core/profile/citizen-profile';
import { inspectSensitiveIds } from '../../src/core/privacy/sensitive-id-shield';

export const intakeRouter = new Hono();

// POST /api/v1/intake/parse
intakeRouter.post('/parse', async (c) => {
  const body = await c.req.json().catch(() => ({}));
  const rawText = body.text;

  if (!rawText || typeof rawText !== 'string') {
    return c.json({ error: 'INVALID_INPUT', message: 'Field "text" is required.' }, 400);
  }

  // Double check privacy boundary
  const inspection = inspectSensitiveIds(rawText);
  if (!inspection.isClean) {
    return c.json(
      {
        error: 'SENSITIVE_IDENTIFIER_BLOCKED',
        message: inspection.userExplanation,
      },
      400
    );
  }

  const { profile, extractedAttributes } = extractProfileFromText(rawText);

  return c.json({
    extractedProfile: profile,
    extractedAttributes,
    safeText: inspection.safeText,
  });
});

// GET /api/v1/intake/personas
intakeRouter.get('/personas', (c) => {
  return c.json({
    personas: GOLDEN_PERSONAS.map((p, idx) => ({
      id: idx,
      name: p.name,
      description: p.description,
      profile: p.profile,
    })),
  });
});

// GET /api/v1/intake/adaptive-questions
intakeRouter.get('/adaptive-questions', (c) => {
  return c.json({ questions: ADAPTIVE_QUESTIONS });
});
