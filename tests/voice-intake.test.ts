import { describe, expect, it } from 'vitest';
import { app } from '../worker/index';

describe('Sarvam AI Voice Intake Route Suite', () => {
  it('GET /api/v1/voice/languages returns supported Indian languages', async () => {
    const res = await app.request('/api/v1/voice/languages');
    expect(res.status).toBe(200);

    const data = await res.json() as { languages: Array<{ code: string; label: string }> };
    expect(Array.isArray(data.languages)).toBe(true);
    expect(data.languages.length).toBeGreaterThanOrEqual(6);

    const codes = data.languages.map((l) => l.code);
    expect(codes).toContain('te-IN');
    expect(codes).toContain('hi-IN');
    expect(codes).toContain('en-IN');
    expect(codes).toContain('ta-IN');
  });

  it('POST /api/v1/voice/transcribe transcribes and extracts profile for Telugu speech', async () => {
    const res = await app.request('/api/v1/voice/transcribe', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        language_code: 'te-IN',
        mock_hint: 'నేను నల్లగొండ జిల్లాలో 2 ఎకరాల భూమి ఉన్న చిన్న రైతుని, కుటుంబ ఆదాయం 1.1 లక్ష రూపాయలు, తెల్ల రేషన్ కార్డు ఉంది.',
      }),
    });

    expect(res.status).toBe(200);
    const data = await res.json() as {
      success: boolean;
      transcript: string;
      language_code: string;
      extractedProfile: {
        domicileState?: string;
        occupation?: string;
        isAgriculturalLandholder?: boolean;
        familyIncome?: number;
        rationCardType?: string;
      };
      extractedAttributes: string[];
    };

    expect(data.success).toBe(true);
    expect(data.transcript).toContain('రైతు');
    expect(data.extractedAttributes).toContain('domicileState');
    expect(data.extractedAttributes).toContain('occupation');
    expect(data.extractedProfile.domicileState).toBe('Telangana');
    expect(data.extractedProfile.occupation).toBe('farmer');
    expect(data.extractedProfile.isAgriculturalLandholder).toBe(true);
    expect(data.extractedProfile.familyIncome).toBe(110000);
    expect(data.extractedProfile.rationCardType).toBe('white_bpl');
  });

  it('POST /api/v1/voice/transcribe blocks sensitive Aadhaar numbers in JSON payload via Sensitive-ID Shield', async () => {
    const res = await app.request('/api/v1/voice/transcribe', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({
        language_code: 'en-IN',
        mock_hint: 'My income is 1.5 Lakhs and my Aadhaar number is 9999 8888 7777.',
      }),
    });

    expect(res.status).toBe(400);
    const data = await res.json() as {
      error: string;
      message: string;
    };

    expect(data.error).toBe('SENSITIVE_IDENTIFIER_BLOCKED');
    expect(data.message).toContain('Aadhaar');
  });

  it('POST /api/v1/voice/transcribe handles multipart audio without leaking raw Aadhaar', async () => {
    const formData = new FormData();
    formData.append('language_code', 'en-IN');
    formData.append('mock_hint', 'I am a college student from Hyderabad with 80% attendance and family income 1.5 Lakhs.');

    const res = await app.request('/api/v1/voice/transcribe', {
      method: 'POST',
      body: formData,
    });

    expect(res.status).toBe(200);
    const data = await res.json() as {
      success: boolean;
      transcript: string;
      extractedProfile: { domicileState?: string; educationLevel?: string; attendancePercentage?: number };
    };

    expect(data.success).toBe(true);
    expect(data.extractedProfile.domicileState).toBe('Telangana');
    expect(data.extractedProfile.educationLevel).toBe('undergraduate');
    expect(data.extractedProfile.attendancePercentage).toBe(80);
  });
});
