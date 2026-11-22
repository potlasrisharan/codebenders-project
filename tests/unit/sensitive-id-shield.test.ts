import { describe, expect, it } from 'vitest';
import {
  inspectSensitiveIds,
  redactSensitiveIds,
  sanitizeSharePayload,
} from '../../src/core/privacy/sensitive-id-shield';

describe('Sensitive-ID Shield (P2 Privacy Boundary)', () => {
  it('allows safe, non-sensitive text to pass cleanly', () => {
    const input = 'I am a 2nd year B.Tech student in Hyderabad with family income around 1.5 Lakhs per year.';
    const result = inspectSensitiveIds(input);

    expect(result.isClean).toBe(true);
    expect(result.violations).toHaveLength(0);
    expect(result.safeText).toBe(input);
    expect(result.userExplanation).toBeUndefined();
  });

  it('detects and flags 12-digit space-separated Aadhaar patterns', () => {
    const input = 'My student id is 9876 and my number is 4455 6677 8899 for college.';
    const result = inspectSensitiveIds(input);

    expect(result.isClean).toBe(false);
    expect(result.violations).toHaveLength(1);
    expect(result.violations[0].type).toBe('AADHAAR_PATTERN');
    expect(result.safeText).toContain('[REDACTED_AADHAAR_PATTERN]');
    expect(result.safeText).not.toContain('4455 6677 8899');
    expect(result.userExplanation).toBeDefined();
  });

  it('detects continuous 12-digit Aadhaar-like numbers', () => {
    const input = 'Here is the number: 123456789012.';
    const result = inspectSensitiveIds(input);

    expect(result.isClean).toBe(false);
    expect(result.violations[0].type).toBe('AADHAAR_PATTERN');
    expect(result.safeText).toBe('Here is the number: [REDACTED_AADHAAR_PATTERN].');
  });

  it('detects PAN card pattern and redacts it', () => {
    const input = 'Income certificate attached with PAN ABCDE1234F for reference';
    const result = inspectSensitiveIds(input);

    expect(result.isClean).toBe(false);
    expect(result.violations.some((v) => v.type === 'PAN_PATTERN')).toBe(true);
    expect(result.safeText).toContain('[REDACTED_PAN_PATTERN]');
    expect(result.safeText).not.toContain('ABCDE1234F');
  });

  it('never stores or exposes the raw sensitive text in violations metadata', () => {
    const input = 'Do not save 1122 3344 5566 or BKZPK1234Q in logs!';
    const result = inspectSensitiveIds(input);

    const serialized = JSON.stringify(result.violations);
    expect(serialized).not.toContain('1122 3344 5566');
    expect(serialized).not.toContain('BKZPK1234Q');
  });

  it('redacts sensitive IDs with helper function', () => {
    const input = 'Student PAN: ABCDE9999Z, Aadhaar: 9999 8888 7777';
    const clean = redactSensitiveIds(input);

    expect(clean).toBe('Student PAN: [REDACTED_PAN_PATTERN], Aadhaar: [REDACTED_AADHAAR_PATTERN]');
  });

  it('sanitizes WhatsApp share payloads to only include public guidance and documents', () => {
    const payload = sanitizeSharePayload({
      schemeName: 'Telangana Post-Matric Scholarship (ePASS RTF/MTF)',
      officialPortalUrl: 'https://telanganaepass.cgg.gov.in',
      checklistItems: ['Income Certificate (MeeSeva)', 'Caste Certificate', 'Bonafide Certificate'],
      notes: 'Ensure 75% college attendance is certified.',
    });

    expect(payload).toContain('Telangana Post-Matric Scholarship');
    expect(payload).toContain('https://telanganaepass.cgg.gov.in');
    expect(payload).toContain('Income Certificate (MeeSeva)');
    expect(payload).not.toContain('Aadhaar number');
    expect(payload).toContain('LabhSaathi (Independent Beneficiary Navigation Platform)');
  });

  it('does not falsely flag 12-digit Indian mobile numbers with 91 country code as Aadhaar', () => {
    const input = 'Call me at 919876543210 regarding college admission.';
    const result = inspectSensitiveIds(input);
    expect(result.isClean).toBe(true);
    expect(result.violations).toHaveLength(0);
    expect(result.safeText).toContain('919876543210');
  });
});
