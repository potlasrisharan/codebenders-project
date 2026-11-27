/**
 * Sensitive-ID Shield — Privacy Boundary Detection & Redaction
 * Enforces FR-SEC-01 through FR-SEC-08 and ADR-004.
 *
 * Rules:
 * 1. Pattern-based prevention, not identity verification.
 * 2. Never retain or log raw matched sensitive values.
 * 3. Client & boundary evaluation must produce identical safety guarantees.
 */

export type SensitivePatternType = 'AADHAAR_PATTERN' | 'PAN_PATTERN' | 'VOTER_ID_PATTERN';

export interface SensitiveViolation {
  type: SensitivePatternType;
  description: string;
  startIndex: number;
  endIndex: number;
}

export interface ShieldInspectionResult {
  isClean: boolean;
  violations: SensitiveViolation[];
  safeText: string;
  userExplanation?: string;
}

// Regex definitions:
// Aadhaar: 12 digits, often formatted as 4-4-4 with space or hyphen, or 12 continuous digits.
// Note: exclude standard dates (e.g., 20261122 is 8 digits, phone numbers are 10 digits).
const AADHAAR_REGEX = /\b(?:\d{4}[\s-]?\d{4}[\s-]?\d{4}|\d{12})\b/g;

// PAN: 5 uppercase letters, 4 digits, 1 uppercase letter. Case-insensitive in input detection.
const PAN_REGEX = /\b[A-Za-z]{5}\d{4}[A-Za-z]\b/g;

// EPIC / Voter ID: typically 3 letters followed by 7 digits.
const VOTER_ID_REGEX = /\b[A-Za-z]{3}\d{7}\b/g;

/**
 * Inspects a string for sensitive government identifier patterns.
 * Does NOT retain or output the raw matched sensitive values.
 */
export function inspectSensitiveIds(rawInput: string): ShieldInspectionResult {
  if (!rawInput || typeof rawInput !== 'string') {
    return { isClean: true, violations: [], safeText: '' };
  }

  const violations: SensitiveViolation[] = [];

  // Match Aadhaar-like patterns
  let match: RegExpExecArray | null;
  const aadhaarRegex = new RegExp(AADHAAR_REGEX);
  while ((match = aadhaarRegex.exec(rawInput)) !== null) {
    const digitsOnly = match[0].replace(/[\s-]/g, '');
    // Ignore if it's a 12-digit Indian mobile number with 91 country code prefix (91 + 10 digits starting with 6, 7, 8, or 9)
    if (/^91[6-9]\d{9}$/.test(digitsOnly)) {
      continue;
    }
    violations.push({
      type: 'AADHAAR_PATTERN',
      description: 'Pattern resembles a 12-digit national identity number (Aadhaar).',
      startIndex: match.index,
      endIndex: match.index + match[0].length,
    });
  }

  // Match PAN-like patterns
  const panRegex = new RegExp(PAN_REGEX);
  while ((match = panRegex.exec(rawInput)) !== null) {
    violations.push({
      type: 'PAN_PATTERN',
      description: 'Pattern resembles a 10-character Permanent Account Number (PAN).',
      startIndex: match.index,
      endIndex: match.index + match[0].length,
    });
  }

  // Match Voter ID patterns
  const voterRegex = new RegExp(VOTER_ID_REGEX);
  while ((match = voterRegex.exec(rawInput)) !== null) {
    violations.push({
      type: 'VOTER_ID_PATTERN',
      description: 'Pattern resembles an Election Commission Voter ID number.',
      startIndex: match.index,
      endIndex: match.index + match[0].length,
    });
  }

  const isClean = violations.length === 0;

  // Redact matches from safeText
  let safeText = rawInput;
  safeText = safeText.replace(AADHAAR_REGEX, (m) => {
    const digitsOnly = m.replace(/[\s-]/g, '');
    if (/^91[6-9]\d{9}$/.test(digitsOnly)) return m;
    return '[REDACTED_AADHAAR_PATTERN]';
  });
  safeText = safeText.replace(PAN_REGEX, '[REDACTED_PAN_PATTERN]');
  safeText = safeText.replace(VOTER_ID_REGEX, '[REDACTED_VOTER_ID_PATTERN]');

  let userExplanation: string | undefined;
  if (!isClean) {
    userExplanation =
      'For your safety and privacy, LabhSaathi never collects Aadhaar numbers, PAN cards, or official identity numbers. ' +
      'Please describe your situation using eligibility details only (such as education level, family income range, and district).';
  }

  return {
    isClean,
    violations,
    safeText,
    userExplanation,
  };
}

/**
 * Redacts any sensitive patterns from text before transmission or storage.
 * Ensures zero sensitive identifiers reach downstream consumers.
 */
export function redactSensitiveIds(rawInput: string): string {
  return inspectSensitiveIds(rawInput).safeText;
}

/**
 * Sanitizes share payloads (e.g. for WhatsApp or URL sharing).
 * Guarantees that only public, non-personal checklist & scheme details are allowed.
 */
export function sanitizeSharePayload(params: {
  schemeName: string;
  officialPortalUrl: string;
  checklistItems: string[];
  notes?: string;
}): string {
  // Check that no personal profile info was mistakenly inserted
  const rawContent = [
    `Scheme: ${params.schemeName}`,
    `Official Portal: ${params.officialPortalUrl}`,
    'Required Documents:',
    ...params.checklistItems.map((item, idx) => `  ${idx + 1}. ${item}`),
    params.notes ? `Note: ${params.notes}` : '',
    '',
    'Guidance provided by LabhSaathi (Independent Beneficiary Navigation Platform). Free and non-official.',
  ]
    .filter(Boolean)
    .join('\n');

  // Redact any accidental identifier patterns
  return redactSensitiveIds(rawContent);
}
