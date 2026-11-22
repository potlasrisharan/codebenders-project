import { Context, Next } from 'hono';
import { inspectSensitiveIds } from '../../src/core/privacy/sensitive-id-shield';

/**
 * Server Boundary Middleware: Sensitive-ID Shield (FR-SEC-02, ADR-004)
 * Inspects incoming request bodies before reaching handlers, logging, or storage.
 * If sensitive identifier patterns (Aadhaar, PAN) are found, rejects immediately with a friendly explanation.
 */
export async function sensitiveIdShieldMiddleware(c: Context, next: Next) {
  // Only inspect POST / PUT / PATCH with JSON content
  if (['POST', 'PUT', 'PATCH'].includes(c.req.method)) {
    const contentType = c.req.header('content-type') || '';
    if (contentType.includes('application/json')) {
      try {
        const bodyText = await c.req.raw.clone().text();
        const inspection = inspectSensitiveIds(bodyText);

        if (!inspection.isClean) {
          return c.json(
            {
              error: 'SENSITIVE_IDENTIFIER_BLOCKED',
              message: inspection.userExplanation,
              guidance:
                'For your safety and privacy, LabhSaathi never collects Aadhaar, PAN, or government identity numbers. Please provide eligibility facts only.',
            },
            400
          );
        }
      } catch {
        // Safe continue if body cannot be cloned
      }
    }
  }

  await next();
}
