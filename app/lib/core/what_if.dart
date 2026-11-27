/// Port of src/core/simulator/what-if-service.ts (What-If Simulator & Scheme Change Radar).
/// Pure Dart (no Flutter imports).
library;

import 'eligibility.dart';
import 'profile.dart';

/// Starting values used by the What-If screen (SchemeDetailPage.tsx):
/// `profile.familyIncome || 150000` and `profile.attendancePercentage || 75`.
/// JS `||` also falls back on 0, so 0 and null both use the default here.
const num whatIfDefaultIncome = 150000;
const num whatIfDefaultAttendance = 75;

num whatIfStartingIncome(CitizenProfile profile) {
  final v = profile.familyIncome;
  return (v == null || v == 0) ? whatIfDefaultIncome : v;
}

num whatIfStartingAttendance(CitizenProfile profile) {
  final v = profile.attendancePercentage;
  return (v == null || v == 0) ? whatIfDefaultAttendance : v;
}

class WhatIfSimulationResult {
  const WhatIfSimulationResult({
    required this.schemeId,
    required this.schemeName,
    required this.originalEligibility,
    required this.simulatedEligibility,
    required this.labelChanged,
    required this.deltaSummary,
    required this.affectedConditionNames,
  });

  final String schemeId;
  final String schemeName;
  final EligibilityResult originalEligibility;
  final EligibilityResult simulatedEligibility;
  final bool labelChanged;
  final String deltaSummary;
  final List<String> affectedConditionNames;
}

/// Simulates a hypothetical change to one or more profile attributes.
/// [hypotheticalOverrides] is keyed by TS profile key (e.g. 'familyIncome').
/// The base profile is never mutated.
WhatIfSimulationResult simulateWhatIf(
  SchemeRecord scheme,
  CitizenProfile baseProfile,
  Map<String, Object?> hypotheticalOverrides,
) {
  final simulatedProfile = baseProfile.withOverrides(hypotheticalOverrides);

  final originalEligibility = evaluateSchemeEligibility(scheme, baseProfile);
  final simulatedEligibility = evaluateSchemeEligibility(scheme, simulatedProfile);

  final labelChanged = originalEligibility.overallLabel != simulatedEligibility.overallLabel;

  final affectedConditionNames = <String>[];
  for (final simTrace in simulatedEligibility.predicateTraces) {
    PredicateTrace? origTrace;
    for (final t in originalEligibility.predicateTraces) {
      if (t.ruleId == simTrace.ruleId) {
        origTrace = t;
        break;
      }
    }
    if (origTrace != null && origTrace.result != simTrace.result) {
      affectedConditionNames.add(simTrace.conditionName);
    }
  }

  String deltaSummary;
  if (labelChanged) {
    deltaSummary =
        'Status changes from "${originalEligibility.overallLabel}" to "${simulatedEligibility.overallLabel}"!';
  } else if (affectedConditionNames.isNotEmpty) {
    deltaSummary = 'Condition state updated for: ${affectedConditionNames.join(', ')}.';
  } else {
    deltaSummary = 'No change in eligibility outcome under this scenario.';
  }

  return WhatIfSimulationResult(
    schemeId: scheme.id,
    schemeName: scheme.name,
    originalEligibility: originalEligibility,
    simulatedEligibility: simulatedEligibility,
    labelChanged: labelChanged,
    deltaSummary: deltaSummary,
    affectedConditionNames: affectedConditionNames,
  );
}

class SchemeChangeDiff {
  const SchemeChangeDiff({
    required this.schemeId,
    required this.schemeName,
    required this.oldVersion,
    required this.newVersion,
    required this.effectiveDate,
    required this.changeSummary,
    required this.deltaDetails,
    required this.impactOnApplicants,
  });

  final String schemeId;
  final String schemeName;
  final String oldVersion;
  final String newVersion;
  final String effectiveDate;
  final String changeSummary;
  final String deltaDetails;
  final String impactOnApplicants;
}

/// Controlled Government policy changes for the Scheme Change Radar.
const List<SchemeChangeDiff> _controlledSchemeChangeDiffs = [
  SchemeChangeDiff(
    schemeId: 'ts-epass-rtf-2026',
    schemeName: 'Telangana ePASS Post-Matric Scholarship (RTF)',
    oldVersion: '2024-25.v2',
    newVersion: '2025-26.v1',
    effectiveDate: '2025-06-01',
    changeSummary: 'Income ceiling for BC Rural applicants relaxed from ₹1,00,000 to ₹1,50,000.',
    deltaDetails:
        'Rule `ts-epass-income` ceiling adjusted to allow families earning up to ₹1.5 Lakhs in rural areas to qualify.',
    impactOnApplicants:
        'Previously rejected or ineligible BC rural students between ₹1.0L and ₹1.5L can now qualify for 100% tuition reimbursement.',
  ),
  SchemeChangeDiff(
    schemeId: 'central-nsp-csss-2026',
    schemeName: 'Central Sector Scheme of Scholarship (CSSS)',
    oldVersion: 'NSP-CSSS-2024-25',
    newVersion: 'NSP-CSSS-2025-26',
    effectiveDate: '2025-07-15',
    changeSummary: 'One Time Registration (OTR) face-authentication mandated.',
    deltaDetails:
        'Step 1 application workflow updated to include mobile biometric face eKYC before application submission.',
    impactOnApplicants: 'Students must install the AadhaarFaceRD app to complete student verification.',
  ),
];

/// Returns all change diffs, or only those for [schemeId] when given.
List<SchemeChangeDiff> getSchemeChangeDiffs([String? schemeId]) {
  if (schemeId != null) {
    return _controlledSchemeChangeDiffs.where((d) => d.schemeId == schemeId).toList();
  }
  return List<SchemeChangeDiff>.of(_controlledSchemeChangeDiffs);
}

/// Change diffs that affect any of the tracked scheme ids.
List<SchemeChangeDiff> getReassessmentAlerts(List<String> trackedSchemeIds) {
  return getSchemeChangeDiffs()
      .where((d) => trackedSchemeIds.contains(d.schemeId))
      .toList();
}
