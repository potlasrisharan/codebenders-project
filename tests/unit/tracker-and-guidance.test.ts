import { describe, expect, it } from 'vitest';
import { defaultClaimTrackerService } from '../../src/core/tracker/claim-tracker';
import { defaultSchemeRepository } from '../../src/core/data/repository';

describe('Documents Guidance, Middleman Shield & Tracker (P7 & P8)', () => {
  const tsEpass = defaultSchemeRepository.getById('ts-epass-rtf-2026')!;

  describe('P7 — Document Checklist & Application Guidance', () => {
    it('provides categorized documents with issuing authorities and source clauses', () => {
      expect(tsEpass.documents.length).toBeGreaterThanOrEqual(4);

      const mandatoryDocs = tsEpass.documents.filter((d) => d.requirementType === 'mandatory');
      expect(mandatoryDocs.length).toBeGreaterThan(0);
      expect(mandatoryDocs.some((d) => d.name.includes('Income Certificate'))).toBe(true);

      for (const doc of tsEpass.documents) {
        expect(doc.issuingAuthority).toBeDefined();
        expect(doc.sourceEvidence).toBeDefined();
      }
    });

    it('provides ordered application steps with channels and official portal links', () => {
      expect(tsEpass.applicationSteps.length).toBeGreaterThanOrEqual(3);
      expect(tsEpass.applicationSteps[0].stepNumber).toBe(1);
      expect(tsEpass.applicationSteps[0].channel).toBeDefined();
    });

    it('verifies free fee state and Middleman Shield scam warning', () => {
      expect(tsEpass.feeStatus).toBe('free_verified');
      expect(tsEpass.feeDetails).toContain('free');
      expect(tsEpass.scamWarning).toContain('middlemen');
    });
  });

  describe('P8 — Claim Tracker & Renewal Calendar', () => {
    it('saves a scheme to tracker and manages document completion state', () => {
      const claim = defaultClaimTrackerService.saveScheme(tsEpass);
      expect(claim.schemeId).toBe(tsEpass.id);
      expect(claim.stage).toBe('preparing');

      // Toggle document completion
      defaultClaimTrackerService.toggleDocumentCompletion(tsEpass.id, 'doc-income-meeseva');
      const updated = defaultClaimTrackerService.getClaim(tsEpass.id);
      expect(updated?.completedDocumentIds).toContain('doc-income-meeseva');

      // Update stage
      defaultClaimTrackerService.updateStage(tsEpass.id, 'applied', 'EPASS-2026-9988');
      const appliedClaim = defaultClaimTrackerService.getClaim(tsEpass.id);
      expect(appliedClaim?.stage).toBe('applied');
      expect(appliedClaim?.applicationReferenceNumber).toBe('EPASS-2026-9988');
    });

    it('extracts academic-year renewal calendar events from schemes with renewal support', () => {
      const schemes = defaultSchemeRepository.getAll();
      const events = defaultClaimTrackerService.getRenewalCalendarEvents(schemes);

      expect(events.length).toBeGreaterThan(0);
      const epassRenewal = events.find((e) => e.schemeId === 'ts-epass-rtf-2026');
      expect(epassRenewal).toBeDefined();
      expect(epassRenewal?.academicYear).toBe('2026-27');
      expect(epassRenewal?.windowDescription).toContain('August to November');
    });

    it('generates preview-first WhatsApp share URL without personal data', () => {
      const share = defaultClaimTrackerService.generateWhatsAppShareUrl(tsEpass, 'Checked for college admissions');

      expect(share.url).toContain('https://wa.me/?text=');
      expect(share.text).toContain(tsEpass.name);
      expect(share.text).toContain('Required Documents:');
      expect(share.text).toContain(tsEpass.sources[0].portalUrl);

      // Verify no sensitive personal identifiers or numbers exist
      expect(share.text).not.toMatch(/\b\d{4}\s?\d{4}\s?\d{4}\b/);
      expect(share.text).not.toMatch(/\b[A-Z]{5}\d{4}[A-Z]\b/);
      expect(share.text).not.toContain('₹');
      expect(share.text).not.toContain('Family Income');
    });
  });
});
