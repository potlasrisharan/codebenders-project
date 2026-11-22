import { Hono } from 'hono';
import { cors } from 'hono/cors';
import { sensitiveIdShieldMiddleware } from './middleware/sensitive-shield';
import { schemesRouter } from './routes/schemes';
import { intakeRouter } from './routes/intake';
import { eligibilityRouter } from './routes/eligibility';
import { simulatorRouter } from './routes/simulator';
import { voiceRouter } from './routes/voice';
import { chatRouter } from './routes/chat';
import type { Env } from './types';

export const app = new Hono<{ Bindings: Env }>();

// Global middleware
app.use('*', cors());
app.use('*', sensitiveIdShieldMiddleware);

// Global error handler
app.onError((err, c) => {
  return c.json(
    {
      error: 'INTERNAL_SERVER_ERROR',
      message: err.message || 'An unexpected error occurred in the service.',
      timestamp: new Date().toISOString(),
    },
    500
  );
});

// Health check
app.get('/api/v1/health', (c) => {
  return c.json({
    status: 'ok',
    product: 'LabhSaathi API',
    version: '1.0.0',
    environment: 'local-first',
    timestamp: new Date().toISOString(),
  });
});

// Mount modular sub-routers under /api/v1
app.route('/api/v1/schemes', schemesRouter);
app.route('/api/v1/schemes', chatRouter);
app.route('/api/v1/chat', chatRouter);
app.route('/api/v1/voice', voiceRouter);
app.route('/api/v1/intake', intakeRouter);
app.route('/api/v1/eligibility', eligibilityRouter);
app.route('/api/v1/simulator', simulatorRouter);

// Static assets fallback for Cloudflare Workers Static Assets
app.notFound(async (c) => {
  if (c.env?.ASSETS) {
    return c.env.ASSETS.fetch(c.req.raw);
  }
  return c.text('Not Found', 404);
});

export default app;
