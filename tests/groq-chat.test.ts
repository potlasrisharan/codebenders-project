import { describe, expect, it } from 'vitest';
import { app } from '../worker/index';

describe('Groq Scheme Q&A Assistant Route Suite', () => {
  it('POST /api/v1/schemes/:id/chat answers fee queries with 100% Free verification and middleman warning', async () => {
    const res = await app.request('/api/v1/schemes/ts-epass-rtf-2026/chat', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        message: 'How much fee do I need to pay to apply?',
      }),
    });

    expect(res.status).toBe(200);
    const data = await res.json() as {
      success: boolean;
      schemeId: string;
      reply: string;
      portalUrl: string;
      feeStatus: string;
    };

    expect(data.success).toBe(true);
    expect(data.schemeId).toBe('ts-epass-rtf-2026');
    expect(data.reply.toLowerCase()).toContain('100% free');
    expect(data.reply.toLowerCase()).toContain('middlemen');
  });

  it('POST /api/v1/schemes/:id/chat lists required MeeSeva documents for student scholarship', async () => {
    const res = await app.request('/api/v1/schemes/ts-epass-rtf-2026/chat', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        message: 'What certificates and documents are required from MeeSeva?',
      }),
    });

    expect(res.status).toBe(200);
    const data = await res.json() as {
      success: boolean;
      reply: string;
    };

    expect(data.success).toBe(true);
    expect(data.reply).toContain('Income Certificate');
    expect(data.reply).toContain('MeeSeva');
  });

  it('POST /api/v1/schemes/:id/chat returns 404 for nonexistent scheme', async () => {
    const res = await app.request('/api/v1/schemes/nonexistent-scheme-999/chat', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        message: 'Can I apply?',
      }),
    });

    expect(res.status).toBe(404);
  });
});
