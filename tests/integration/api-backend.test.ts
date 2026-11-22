import { describe, expect, it } from 'vitest';
import { app } from '../../worker/index';
import { GOLDEN_PERSONAS } from '../../src/core/profile/citizen-profile';

describe('Hono API Backend (/api/v1)', () => {
  it('GET /api/v1/health returns status ok', async () => {
    const res = await app.request('/api/v1/health');
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.status).toBe('ok');
    expect(data.product).toBe('LabhSaathi API');
  });

  it('GET /api/v1/schemes returns verified government schemes', async () => {
    const res = await app.request('/api/v1/schemes?state=Telangana');
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.count).toBeGreaterThanOrEqual(4);
    expect(data.data.some((s: { id: string }) => s.id === 'ts-epass-rtf-2026')).toBe(true);
  });

  it('GET /api/v1/schemes/coverage returns national coverage registry', async () => {
    const res = await app.request('/api/v1/schemes/coverage');
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.coverage.length).toBeGreaterThan(5);
    expect(data.coverage.some((c: { stateCode: string }) => c.stateCode === 'TS')).toBe(true);
  });

  it('GET /api/v1/schemes/:id returns scheme details', async () => {
    const res = await app.request('/api/v1/schemes/ts-epass-rtf-2026');
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.data.name).toContain('Telangana ePASS');
    expect(data.data.feeStatus).toBe('free_verified');
    expect(data.data.documents.length).toBeGreaterThan(0);
  });

  it('POST /api/v1/intake/parse extracts profile facts from natural text', async () => {
    const res = await app.request('/api/v1/intake/parse', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        text: 'I am a 2nd year B.Tech student in Hyderabad, BC-B, income 1.5 Lakhs.',
      }),
    });
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.extractedProfile.domicileState).toBe('Telangana');
    expect(data.extractedProfile.educationLevel).toBe('undergraduate');
    expect(data.extractedProfile.socialCategory).toBe('BC-B');
    expect(data.extractedProfile.familyIncome).toBe(150000);
  });

  it('POST /api/v1/intake/parse blocks sensitive Aadhaar/PAN identifiers (FR-SEC-02)', async () => {
    const res = await app.request('/api/v1/intake/parse', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        text: 'My Aadhaar is 1234 5678 9012 and student id is 5566.',
      }),
    });
    expect(res.status).toBe(400);

    const data = await res.json();
    expect(data.error).toBe('SENSITIVE_IDENTIFIER_BLOCKED');
    expect(data.message).toBeDefined();
    // Raw identifier must never appear in response
    expect(JSON.stringify(data)).not.toContain('1234 5678 9012');
  });

  it('POST /api/v1/eligibility/evaluate returns canonical three-valued trace', async () => {
    const priya = GOLDEN_PERSONAS[0].profile;
    const res = await app.request('/api/v1/eligibility/evaluate', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        schemeId: 'ts-epass-rtf-2026',
        profile: priya,
      }),
    });
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.result.overallLabel).toBe('Likely eligible');
    expect(data.result.predicateTraces.length).toBeGreaterThan(0);
    expect(data.result.feeStatus).toBe('free_verified');
  });

  it('POST /api/v1/simulator/what-if runs simulation and returns delta', async () => {
    const vikram = GOLDEN_PERSONAS[4].profile;
    const res = await app.request('/api/v1/simulator/what-if', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        schemeId: 'ts-epass-rtf-2026',
        baseProfile: vikram,
        hypotheticalOverrides: {
          familyIncome: 150000,
          socialCategory: 'BC-B',
        },
      }),
    });
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.simulation.originalEligibility.overallLabel).toBe('Unlikely');
    expect(data.simulation.simulatedEligibility.overallLabel).toBe('Likely eligible');
    expect(data.simulation.labelChanged).toBe(true);
  });

  it('GET /api/v1/simulator/radar returns policy change diffs', async () => {
    const res = await app.request('/api/v1/simulator/radar?schemeId=ts-epass-rtf-2026');
    expect(res.status).toBe(200);

    const data = await res.json();
    expect(data.diffs.length).toBeGreaterThan(0);
    expect(data.diffs[0].newVersion).toBe('2025-26.v1');
    expect(data.diffs[0].changeSummary).toContain('Income ceiling');
  });
});
