import { describe, expect, it } from 'vitest';
import { defaultSchemeRepository } from '../../src/core/data/repository';
import { evaluateSchemeEligibility } from '../../src/core/engine/eligibility-engine';
import { defaultDiscoveryService } from '../../src/core/discovery/discovery-service';
import { defaultClaimTrackerService } from '../../src/core/tracker/claim-tracker';
import { defaultWhatIfService } from '../../src/core/simulator/what-if-service';
import { inspectSensitiveIds } from '../../src/core/privacy/sensitive-id-shield';
import { GOLDEN_PERSONAS, extractProfileFromText } from '../../src/core/profile/citizen-profile';
import { NATIONAL_STATE_COVERAGE } from '../../src/core/data/coverage-registry';

describe('ACE BUILDERS PS5 — End-to-End Acceptance Matrix (P11)', () => {
  const tsEpass = defaultSchemeRepository.getById('ts-epass-rtf-2026')!;
  const csss = defaultSchemeRepository.getById('central-nsp-csss-2026')!;

  describe('Capability 1: Plain-Language Input & Regional Support', () => {
    it('accepts and extracts attributes from Telugu transliteration and English natural language', () => {
      const teluguInput = 'నేను బీసీ విద్యార్థిని హైదరాబాద్ లో ఇంజనీరింగ్ చదువుతున్నాను. హాజరు 80 శాతం, కుటుంబ ఆదాయం 1.5 లక్ష.';
      const { profile, extractedAttributes } = extractProfileFromText(teluguInput);

      expect(extractedAttributes).toContain('domicileState');
      expect(profile.domicileState).toBe('Telangana');
      expect(profile.educationLevel).toBe('undergraduate');
      expect(profile.socialCategory).toBe('BC-B');
      expect(profile.attendancePercentage).toBe(80);
      expect(profile.familyIncome).toBe(150000);
    });
  });

  describe('Capability 2: Three-Valued Eligibility Matching with Transparent Reasoning', () => {
    it('evaluates all 6 golden personas to expected canonical statuses without AI guesswork', () => {
      // 1. Priya -> Likely eligible
      expect(evaluateSchemeEligibility(tsEpass, GOLDEN_PERSONAS[0].profile).overallLabel).toBe('Likely eligible');

      // 2. Rajesh -> Likely eligible for merit CSSS
      expect(evaluateSchemeEligibility(csss, GOLDEN_PERSONAS[1].profile).overallLabel).toBe('Likely eligible');

      // 3. Ananya -> Likely eligible for Pragati
      const pragati = defaultSchemeRepository.getById('central-aicte-pragati-2026')!;
      expect(evaluateSchemeEligibility(pragati, GOLDEN_PERSONAS[2].profile).overallLabel).toBe('Likely eligible');

      // 4. Suresh -> Missing fact maps to "Need to confirm"
      expect(evaluateSchemeEligibility(tsEpass, GOLDEN_PERSONAS[3].profile).overallLabel).toBe('Need to confirm');

      // 5. Vikram -> High income maps to "Unlikely"
      expect(evaluateSchemeEligibility(tsEpass, GOLDEN_PERSONAS[4].profile).overallLabel).toBe('Unlikely');

      // 6. Sneha -> Out of state domicile maps to "Unlikely" for state scheme
      expect(evaluateSchemeEligibility(tsEpass, GOLDEN_PERSONAS[5].profile).overallLabel).toBe('Unlikely');
    });

    it('identifies Near-Match when 1 condition is unmet', () => {
      const nearMatchProfile = {
        ...GOLDEN_PERSONAS[0].profile,
        attendancePercentage: 70, // Needs 75%
      };
      const discovery = defaultDiscoveryService.discover(nearMatchProfile, { state: 'Telangana' });
      const epass = discovery.items.find((i) => i.scheme.id === 'ts-epass-rtf-2026');

      expect(epass?.nearMatch.isNearMatch).toBe(true);
      expect(epass?.nearMatch.advice).toContain('attendance');
    });
  });

  describe('Capability 3: Document Checklist & Sourced Step-by-Step Guidance', () => {
    it('provides mandatory, conditional, and optional documents with issuing authority evidence', () => {
      expect(tsEpass.documents.length).toBeGreaterThanOrEqual(4);
      for (const doc of tsEpass.documents) {
        expect(['mandatory', 'conditional', 'optional']).toContain(doc.requirementType);
        expect(doc.issuingAuthority).toBeDefined();
        expect(doc.sourceEvidence).toBeDefined();
      }
    });

    it('enforces Middleman Shield fee transparency and scam warnings', () => {
      expect(tsEpass.feeStatus).toBe('free_verified');
      expect(tsEpass.feeDetails).toContain('free');
      expect(tsEpass.scamWarning).toContain('middlemen');
    });
  });

  describe('Capability 4: Application Tracking & Academic-Year Renewal Calendar', () => {
    it('manages claim lifecycle and renewal cycles without fake deadlines', () => {
      const claim = defaultClaimTrackerService.saveScheme(tsEpass);
      expect(claim.stage).toBe('preparing');

      defaultClaimTrackerService.updateStage(tsEpass.id, 'ready_to_apply');
      expect(defaultClaimTrackerService.getClaim(tsEpass.id)?.stage).toBe('ready_to_apply');

      const renewalEvents = defaultClaimTrackerService.getRenewalCalendarEvents([tsEpass]);
      expect(renewalEvents.length).toBe(1);
      expect(renewalEvents[0].windowDescription).toContain('August to November');
    });
  });

  describe('Capability 5: Authoritative Sources & Provenance Governance', () => {
    it('every active scheme has a verified department source, portal link, and verification date', () => {
      const all = defaultSchemeRepository.getAll();
      for (const s of all) {
        expect(s.sources.length).toBeGreaterThan(0);
        expect(s.sources[0].portalUrl).toMatch(/^https?:\/\//);
        expect(s.sources[0].lastVerifiedDate).toBeDefined();
        expect(s.verificationStatus).toBe('verified');
      }
    });

    it('provides a national state coverage registry distinguishing covered vs partial states', () => {
      expect(NATIONAL_STATE_COVERAGE.length).toBeGreaterThan(5);
      const ts = NATIONAL_STATE_COVERAGE.find((c) => c.stateCode === 'TS');
      expect(ts?.coverageStatus).toBe('covered');
    });
  });

  describe('PS5 Guardrails Compliance', () => {
    it('Guardrail 1: Says "Likely eligible", never "guaranteed" or standalone "eligible"', () => {
      const result = evaluateSchemeEligibility(tsEpass, GOLDEN_PERSONAS[0].profile);
      expect(result.overallLabel).toBe('Likely eligible');
      expect(result.overallLabel).not.toBe('Eligible');
      expect(result.overallLabel).not.toBe('Guaranteed');
    });

    it('Guardrail 2: Sensitive-ID Shield prevents Aadhaar/PAN collection and removes raw data', () => {
      const dangerousInput = 'My Aadhaar number is 1234 5678 9012 and PAN is ABCDE1234F';
      const inspection = inspectSensitiveIds(dangerousInput);

      expect(inspection.isClean).toBe(false);
      expect(inspection.safeText).not.toContain('1234 5678 9012');
      expect(inspection.safeText).not.toContain('ABCDE1234F');
    });

    it('Guardrail 3: Publicly available official information only', () => {
      expect(tsEpass.sources[0].portalUrl).toContain('gov.in');
      expect(csss.sources[0].portalUrl).toContain('gov.in');
    });

    it('Guardrail 4: Scheme rules stored as editable versioned data', () => {
      expect(tsEpass.rules.length).toBeGreaterThanOrEqual(4);
      expect(tsEpass.version).toBeDefined();
    });

    it('Guardrail 5: What-If simulation re-evaluates without mutating saved citizen profile', () => {
      // Suresh lacks income
      const suresh = GOLDEN_PERSONAS[3].profile;
      const originalIncome = suresh.familyIncome;

      const sim = defaultWhatIfService.simulate(tsEpass, suresh, {
        familyIncome: 140000,
      });

      expect(sim.originalEligibility.overallLabel).toBe('Need to confirm');
      expect(sim.simulatedEligibility.overallLabel).toBe('Likely eligible');
      expect(suresh.familyIncome).toBe(originalIncome);
    });
  });
});
