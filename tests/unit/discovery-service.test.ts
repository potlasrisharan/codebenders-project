import { describe, expect, it } from 'vitest';
import { defaultDiscoveryService } from '../../src/core/discovery/discovery-service';
import { GOLDEN_PERSONAS, CitizenProfile } from '../../src/core/profile/citizen-profile';

describe('Scheme Discovery, Fixed Labels & Near-Match (P6)', () => {
  it('discovers schemes filtered by state jurisdiction and ranks Likely Eligible highest', () => {
    const priya = GOLDEN_PERSONAS[0].profile;
    const result = defaultDiscoveryService.discover(priya, { state: 'Telangana' });

    expect(result.items.length).toBeGreaterThan(0);
    expect(result.items[0].eligibility.overallLabel).toBe('Likely eligible');
    expect(result.items[0].scheme.id).toBe('ts-epass-rtf-2026');
  });

  it('detects Near-Match when exactly 1 condition is unmet (e.g. attendance 70% instead of 75%)', () => {
    // Modify Priya's attendance to 70%
    const nearMissProfile: CitizenProfile = {
      ...GOLDEN_PERSONAS[0].profile,
      attendancePercentage: 70, // Below 75%
    };

    const result = defaultDiscoveryService.discover(nearMissProfile, { state: 'Telangana' });
    const epassItem = result.items.find((i) => i.scheme.id === 'ts-epass-rtf-2026');

    expect(epassItem).toBeDefined();
    expect(epassItem?.eligibility.overallLabel).toBe('Unlikely');
    expect(epassItem?.nearMatch.isNearMatch).toBe(true);
    expect(epassItem?.nearMatch.deltaCondition).toContain('Attendance');
    expect(epassItem?.nearMatch.advice).toContain('attendance');
  });

  it('preserves deterministic eligibility trace regardless of keyword or search ranking', () => {
    const vikram = GOLDEN_PERSONAS[4].profile; // Ineligible due to high income
    const result = defaultDiscoveryService.discover(vikram, { keyword: 'ePASS' });
    const epassItem = result.items.find((i) => i.scheme.id === 'ts-epass-rtf-2026');

    expect(epassItem).toBeDefined();
    expect(epassItem?.eligibility.overallLabel).toBe('Unlikely');
    expect(epassItem?.eligibility.failedAttributes).toContain('familyIncome');
  });

  it('reports transparent coverage status when searching partially covered or unverified states', () => {
    const karnatakaStudent = GOLDEN_PERSONAS[5].profile;
    const result = defaultDiscoveryService.discover(karnatakaStudent, { state: 'Karnataka' });

    expect(result.coverageNotice).toBeDefined();
    expect(result.coverageNotice).toContain('partially verified');
  });
});
