import { describe, expect, it } from 'vitest';
import {
  evaluateSchemeEligibility,
  evaluatePredicate,
  kleeneAnd,
  kleeneOr,
  assertValidLikelihoodLabel,
} from '../../src/core/engine/eligibility-engine';
import { defaultSchemeRepository } from '../../src/core/data/repository';
import { GOLDEN_PERSONAS, extractProfileFromText } from '../../src/core/profile/citizen-profile';
import { SchemeRecord } from '../../src/core/data/schema';

describe('Three-Valued Eligibility Engine & Golden Tests (P5)', () => {
  const tsEpass = defaultSchemeRepository.getById('ts-epass-rtf-2026')!;
  const centralCsss = defaultSchemeRepository.getById('central-nsp-csss-2026')!;
  const aictePragati = defaultSchemeRepository.getById('central-aicte-pragati-2026')!;

  describe('Kleene 3-Valued Logic Truth Table', () => {
    it('implements kleene AND correctly', () => {
      expect(kleeneAnd('true', 'true')).toBe('true');
      expect(kleeneAnd('true', 'false')).toBe('false');
      expect(kleeneAnd('false', 'unknown')).toBe('false');
      expect(kleeneAnd('true', 'unknown')).toBe('unknown');
      expect(kleeneAnd('unknown', 'unknown')).toBe('unknown');
    });

    it('implements kleene OR correctly', () => {
      expect(kleeneOr('true', 'false')).toBe('true');
      expect(kleeneOr('true', 'unknown')).toBe('true');
      expect(kleeneOr('false', 'false')).toBe('false');
      expect(kleeneOr('false', 'unknown')).toBe('unknown');
      expect(kleeneOr('unknown', 'unknown')).toBe('unknown');
    });
  });

  describe('6 Golden Synthetic Personas Evaluation', () => {
    it('Persona 1 (Priya): Likely eligible for Telangana ePASS RTF', () => {
      const priya = GOLDEN_PERSONAS[0].profile;
      const result = evaluateSchemeEligibility(tsEpass, priya);

      expect(result.overallLabel).toBe('Likely eligible');
      expect(result.missingAttributes).toHaveLength(0);
      expect(result.failedAttributes).toHaveLength(0);
      expect(result.predicateTraces.every((t) => t.result === 'true')).toBe(true);
    });

    it('Persona 2 (Rajesh): Likely eligible for both ePASS and CSSS (merit)', () => {
      const rajesh = GOLDEN_PERSONAS[1].profile;
      const epassRes = evaluateSchemeEligibility(tsEpass, rajesh);
      const csssRes = evaluateSchemeEligibility(centralCsss, rajesh);

      expect(epassRes.overallLabel).toBe('Likely eligible');
      expect(csssRes.overallLabel).toBe('Likely eligible');
      expect(csssRes.predicateTraces.find((t) => t.parameter === 'twelfthPercentile')?.result).toBe('true');
    });

    it('Persona 3 (Ananya): Likely eligible for AICTE Pragati Scholarship for Girls', () => {
      const ananya = GOLDEN_PERSONAS[2].profile;
      const pragatiRes = evaluateSchemeEligibility(aictePragati, ananya);

      expect(pragatiRes.overallLabel).toBe('Likely eligible');
      expect(pragatiRes.predicateTraces.find((t) => t.parameter === 'gender')?.result).toBe('true');
    });

    it('Persona 4 (Suresh): Missing income fact maps to "Need to confirm" (Unknown != False)', () => {
      const suresh = GOLDEN_PERSONAS[3].profile;
      const result = evaluateSchemeEligibility(tsEpass, suresh);

      expect(result.overallLabel).toBe('Need to confirm');
      expect(result.missingAttributes).toContain('familyIncome');
      // Income predicate must be unknown, not false
      const incomeTrace = result.predicateTraces.find((t) => t.parameter === 'familyIncome');
      expect(incomeTrace?.result).toBe('unknown');
    });

    it('Persona 5 (Vikram): High income maps to "Unlikely"', () => {
      const vikram = GOLDEN_PERSONAS[4].profile;
      const result = evaluateSchemeEligibility(tsEpass, vikram);

      expect(result.overallLabel).toBe('Unlikely');
      expect(result.failedAttributes).toContain('familyIncome');
      const incomeTrace = result.predicateTraces.find((t) => t.parameter === 'familyIncome');
      expect(incomeTrace?.result).toBe('false');
    });

    it('Persona 6 (Sneha): Out-of-state domicile maps to "Unlikely" for state scheme', () => {
      const sneha = GOLDEN_PERSONAS[5].profile;
      const result = evaluateSchemeEligibility(tsEpass, sneha);

      expect(result.overallLabel).toBe('Unlikely');
      expect(result.failedAttributes).toContain('domicileState');
    });
  });

  describe('Unreviewed and Stale Schemes', () => {
    it('maps draft or unreviewed scheme to "Can\'t tell yet" (ADR-003)', () => {
      const draftScheme: SchemeRecord = {
        ...tsEpass,
        id: 'draft-test-scheme',
        verificationStatus: 'draft',
      };
      const priya = GOLDEN_PERSONAS[0].profile;
      const result = evaluateSchemeEligibility(draftScheme, priya);

      expect(result.overallLabel).toBe("Can't tell yet");
      expect(result.summaryExplanation).toContain('draft');
    });
  });

  describe('Guardrail & Forbidden Language Tests', () => {
    it('accepts only the standard four likelihood labels', () => {
      expect(() => assertValidLikelihoodLabel('Likely eligible')).not.toThrow();
      expect(() => assertValidLikelihoodLabel('Need to confirm')).not.toThrow();
      expect(() => assertValidLikelihoodLabel('Unlikely')).not.toThrow();
      expect(() => assertValidLikelihoodLabel("Can't tell yet")).not.toThrow();
    });

    it('throws error on forbidden standalone terms ("Eligible", "Guaranteed", "Approved")', () => {
      expect(() => assertValidLikelihoodLabel('Eligible')).toThrow();
      expect(() => assertValidLikelihoodLabel('Guaranteed')).toThrow();
      expect(() => assertValidLikelihoodLabel('Approved')).toThrow();
      expect(() => assertValidLikelihoodLabel('Entitled')).toThrow();
    });
  });

  describe('Conversational Natural Language Profile Parsing (P4)', () => {
    it('extracts non-sensitive attributes from plain English text', () => {
      const text = 'I am studying B.Tech 2nd year in Hyderabad, Telangana. My category is BC-B, attendance is 80%, and family income is 1.5 lakhs.';
      const { profile, extractedAttributes } = extractProfileFromText(text);

      expect(profile.domicileState).toBe('Telangana');
      expect(profile.educationLevel).toBe('undergraduate');
      expect(profile.courseStream).toBe('engineering');
      expect(profile.socialCategory).toBe('BC-B');
      expect(profile.familyIncome).toBe(150000);
      expect(profile.attendancePercentage).toBe(80);
      expect(extractedAttributes).toContain('domicileState');
      expect(extractedAttributes).toContain('familyIncome');
    });

    it('handles Telugu keywords gracefully', () => {
      const teluguText = 'నేను ఇంజనీరింగ్ చదువుతున్నాను తెలంగాణ లో. వార్షిక ఆదాయం 2 లక్ష.';
      const { profile } = extractProfileFromText(teluguText);

      expect(profile.domicileState).toBe('Telangana');
      expect(profile.educationLevel).toBe('undergraduate');
      expect(profile.familyIncome).toBe(200000);
    });

    it('evaluates BETWEEN operator for age ranges correctly', () => {
      const studentWithAge = { ...GOLDEN_PERSONAS[0].profile, age: 19 };
      const rule = {
        id: 'rule-apy-age',
        parameter: 'age',
        operator: 'BETWEEN' as const,
        expectedValue: [18, 40],
        isMandatory: true,
        conditionName: 'Age between 18 and 40',
        sourceClause: 'PFRDA Act Clause 3.1',
      };
      const trace = evaluatePredicate(rule, studentWithAge);
      expect(trace.result).toBe('true');
      expect(trace.explanation).toContain('is within the required range');

      // Test out of range
      const olderProfile = { ...studentWithAge, age: 55 };
      const failTrace = evaluatePredicate(rule, olderProfile);
      expect(failTrace.result).toBe('false');
      expect(failTrace.explanation).toContain('is outside the allowed range');
    });
  });
});
