import { Hono } from 'hono';
import { cors } from 'hono/cors';
import { sensitiveIdShieldMiddleware } from './middleware/sensitive-shield';
import { schemesRouter } from './routes/schemes';
import { intakeRouter } from './routes/intake';
import { eligibilityRouter } from './routes/eligibility';
import { simulatorRouter } from './routes/simulator';

export const app = new Hono();

// Global middleware
app.use('*', cors());
app.use('*', sensitiveIdShieldMiddleware);

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
app.route('/api/v1/intake', intakeRouter);
app.route('/api/v1/eligibility', eligibilityRouter);
app.route('/api/v1/simulator', simulatorRouter);

export default app;
