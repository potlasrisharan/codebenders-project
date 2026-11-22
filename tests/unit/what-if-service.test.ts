import { describe, expect, it } from 'vitest';
import { defaultWhatIfService } from '../../src/core/simulator/what-if-service';
import { defaultSchemeRepository } from '../../src/core/data/repository';
import { GOLDEN_PERSONAS, CitizenProfile } from '../../src/core/profile/citizen-profile';

describe('What-If Simulator & Scheme Change Radar (P10)', () => {
  const tsEpass = defaultSchemeRepository.getById('ts-epass-rtf-2026')!;

  describe('What-If Simulation', () => {
    it('simulates attendance improvement turning Unlikely into Likely eligible', () => {
      // Persona with 70% attendance (< 75%)
      const lowAttendanceProfile: CitizenProfile = {
        ...GOLDEN_PERSONAS[0].profile,
        attendancePercentage: 70,
      };

      const result = defaultWhatIfService.simulate(tsEpass, lowAttendanceProfile, {
        attendancePercentage: 80, // What if attendance increases to 80%?
      });

      expect(result.originalEligibility.overallLabel).toBe('Unlikely');
      expect(result.simulatedEligibility.overallLabel).toBe('Likely eligible');
      expect(result.labelChanged).toBe(true);
      expect(result.affectedConditionNames).toContain('Minimum 75% College Attendance');
      expect(result.deltaSummary).toContain('Likely eligible');

      // Crucial: Base profile must remain completely untouched
      expect(lowAttendanceProfile.attendancePercentage).toBe(70);
    });

    it('simulates clarifying an unknown fact turning Need to confirm into Likely eligible', () => {
      // Suresh has unknown income
      const suresh = GOLDEN_PERSONAS[3].profile;

      const result = defaultWhatIfService.simulate(tsEpass, suresh, {
        familyIncome: 140000, // What if income is clarified at 1.4 Lakhs?
      });

      expect(result.originalEligibility.overallLabel).toBe('Need to confirm');
      expect(result.simulatedEligibility.overallLabel).toBe('Likely eligible');
      expect(result.labelChanged).toBe(true);
      expect(suresh.familyIncome).toBeNull();
    });
  });

  describe('Scheme Change Radar', () => {
    it('retrieves controlled government policy version diffs with old vs new rules', () => {
      const diffs = defaultWhatIfService.getSchemeChangeDiffs('ts-epass-rtf-2026');

      expect(diffs.length).toBeGreaterThan(0);
      const diff = diffs[0];
      expect(diff.oldVersion).toBe('2024-25.v2');
      expect(diff.newVersion).toBe('2025-26.v1');
      expect(diff.changeSummary).toContain('Income ceiling');
      expect(diff.impactOnApplicants).toBeDefined();
    });

    it('identifies reassessment alerts for tracked schemes affected by policy updates', () => {
      const alerts = defaultWhatIfService.getReassessmentAlerts(['ts-epass-rtf-2026', 'unrelated-scheme']);

      expect(alerts.length).toBe(1);
      expect(alerts[0].schemeId).toBe('ts-epass-rtf-2026');
    });
  });
});
