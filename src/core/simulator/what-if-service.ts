/**
 * What-If Simulator & Scheme Change Radar (P10)
 * Implements FR-SIM-01 through FR-SIM-06, FR-RAD-01 through FR-RAD-05.
 *
 * Guarantees:
 * 1. Simulations re-use the exact canonical P5 eligibility engine.
 * 2. Hypothetical modifications NEVER mutate the active saved profile without explicit user confirmation.
 * 3. Scheme Change Radar provides transparent version diffs and impact tracking.
 */

import { SchemeRecord } from '../data/schema';
import { CitizenProfile } from '../profile/citizen-profile';
import { evaluateSchemeEligibility, EligibilityResult } from '../engine/eligibility-engine';


export interface WhatIfScenario {
  parameter: keyof CitizenProfile;
  label: string;
  originalValue: unknown;
  hypotheticalValue: unknown;
}

export interface WhatIfSimulationResult {
  schemeId: string;
  schemeName: string;
  originalEligibility: EligibilityResult;
  simulatedEligibility: EligibilityResult;
  labelChanged: boolean;
  deltaSummary: string;
  affectedConditionNames: string[];
}

export interface SchemeChangeDiff {
  schemeId: string;
  schemeName: string;
  oldVersion: string;
  newVersion: string;
  effectiveDate: string;
  changeSummary: string;
  deltaDetails: string;
  impactOnApplicants: string;
}

export class WhatIfService {
  /**
   * Simulates a hypothetical change to one or more profile attributes.
   * Does NOT alter the user's actual profile object.
   */
  simulate(
    scheme: SchemeRecord,
    baseProfile: CitizenProfile,
    hypotheticalOverrides: Partial<CitizenProfile>
  ): WhatIfSimulationResult {
    // Clone base profile to protect immutability
    const simulatedProfile: CitizenProfile = {
      ...baseProfile,
      ...hypotheticalOverrides,
    };

    const originalEligibility = evaluateSchemeEligibility(scheme, baseProfile);
    const simulatedEligibility = evaluateSchemeEligibility(scheme, simulatedProfile);

    const labelChanged = originalEligibility.overallLabel !== simulatedEligibility.overallLabel;

    const affectedConditionNames: string[] = [];
    simulatedEligibility.predicateTraces.forEach((simTrace) => {
      const origTrace = originalEligibility.predicateTraces.find((t) => t.ruleId === simTrace.ruleId);
      if (origTrace && origTrace.result !== simTrace.result) {
        affectedConditionNames.push(simTrace.conditionName);
      }
    });

    let deltaSummary = '';
    if (labelChanged) {
      deltaSummary = `Status changes from "${originalEligibility.overallLabel}" to "${simulatedEligibility.overallLabel}"!`;
    } else if (affectedConditionNames.length > 0) {
      deltaSummary = `Condition state updated for: ${affectedConditionNames.join(', ')}.`;
    } else {
      deltaSummary = 'No change in eligibility outcome under this scenario.';
    }

    return {
      schemeId: scheme.id,
      schemeName: scheme.name,
      originalEligibility,
      simulatedEligibility,
      labelChanged,
      deltaSummary,
      affectedConditionNames,
    };
  }

  /**
   * Fetches controlled Government policy changes for the Scheme Change Radar
   */
  getSchemeChangeDiffs(schemeId?: string): SchemeChangeDiff[] {
    const controlledDiffs: SchemeChangeDiff[] = [
      {
        schemeId: 'ts-epass-rtf-2026',
        schemeName: 'Telangana ePASS Post-Matric Scholarship (RTF)',
        oldVersion: '2024-25.v2',
        newVersion: '2025-26.v1',
        effectiveDate: '2025-06-01',
        changeSummary: 'Income ceiling for BC Rural applicants relaxed from ₹1,00,000 to ₹1,50,000.',
        deltaDetails: 'Rule `ts-epass-income` ceiling adjusted to allow families earning up to ₹1.5 Lakhs in rural areas to qualify.',
        impactOnApplicants: 'Previously rejected or ineligible BC rural students between ₹1.0L and ₹1.5L can now qualify for 100% tuition reimbursement.',
      },
      {
        schemeId: 'central-nsp-csss-2026',
        schemeName: 'Central Sector Scheme of Scholarship (CSSS)',
        oldVersion: 'NSP-CSSS-2024-25',
        newVersion: 'NSP-CSSS-2025-26',
        effectiveDate: '2025-07-15',
        changeSummary: 'One Time Registration (OTR) face-authentication mandated.',
        deltaDetails: 'Step 1 application workflow updated to include mobile biometric face eKYC before application submission.',
        impactOnApplicants: 'Students must install the AadhaarFaceRD app to complete student verification.',
      },
    ];

    if (schemeId) {
      return controlledDiffs.filter((d) => d.schemeId === schemeId);
    }
    return controlledDiffs;
  }

  /**
   * Checks if any saved scheme in tracker has pending rule version updates
   */
  getReassessmentAlerts(trackedSchemeIds: string[]): SchemeChangeDiff[] {
    const diffs = this.getSchemeChangeDiffs();
    return diffs.filter((d) => trackedSchemeIds.includes(d.schemeId));
  }
}

export const defaultWhatIfService = new WhatIfService();
