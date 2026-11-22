/// Port of src/core/engine/eligibility-engine.ts: three-valued (Kleene) eligibility.
/// Pure Dart (no Flutter imports).
library;

import 'label_guard.dart';
import 'profile.dart';

/// Truth values: trueValue (satisfied), falseValue (failed), unknown (missing info).
/// Named trueValue/falseValue because `true`/`false` are reserved words in Dart.
enum TriState { trueValue, falseValue, unknown }

TriState kleeneAnd(TriState a, TriState b) {
  if (a == TriState.falseValue || b == TriState.falseValue) return TriState.falseValue;
  if (a == TriState.unknown || b == TriState.unknown) return TriState.unknown;
  return TriState.trueValue;
}

TriState kleeneOr(TriState a, TriState b) {
  if (a == TriState.trueValue || b == TriState.trueValue) return TriState.trueValue;
  if (a == TriState.unknown || b == TriState.unknown) return TriState.unknown;
  return TriState.falseValue;
}

// ---------------------------------------------------------------------------
// Scheme data types (subset of src/core/data/schema.ts used by the engine,
// tracker and what-if service).
// ---------------------------------------------------------------------------

class RulePredicate {
  const RulePredicate({
    required this.id,
    required this.parameter,
    required this.operator,
    required this.expectedValue,
    required this.isMandatory,
    required this.conditionName,
    required this.sourceClause,
  });

  final String id;
  final String parameter;
  /// 'EQUALS' | 'IN' | 'LESS_THAN_OR_EQUAL' | 'GREATER_THAN_OR_EQUAL' | 'BETWEEN' | 'BOOLEAN'
  final String operator;
  /// String, num, bool, or List of those.
  final Object? expectedValue;
  final bool isMandatory;
  final String conditionName;
  final String sourceClause;
}

class SchemeSource {
  const SchemeSource({required this.portalUrl});

  final String portalUrl;
}

class SchemeDocument {
  const SchemeDocument({
    required this.id,
    required this.name,
    required this.requirementType,
  });

  final String id;
  final String name;
  /// 'mandatory' | 'conditional' | 'optional'
  final String requirementType;
}

class SchemeRecord {
  const SchemeRecord({
    required this.id,
    required this.name,
    required this.version,
    required this.verificationStatus,
    required this.lastVerifiedDate,
    required this.sources,
    required this.feeStatus,
    required this.renewalSupported,
    this.renewalWindow,
    required this.documents,
    required this.rules,
  });

  final String id;
  final String name;
  final String version;
  /// 'verified' | 'draft' | 'pending_review' | 'stale'
  final String verificationStatus;
  final String lastVerifiedDate;
  final List<SchemeSource> sources;
  /// 'free_verified' | 'fee_verified' | 'unknown'
  final String feeStatus;
  final bool renewalSupported;
  final String? renewalWindow;
  final List<SchemeDocument> documents;
  final List<RulePredicate> rules;
}

// ---------------------------------------------------------------------------
// Results
// ---------------------------------------------------------------------------

class PredicateTrace {
  const PredicateTrace({
    required this.ruleId,
    required this.conditionName,
    required this.parameter,
    required this.userValue,
    required this.expectedValue,
    required this.operator,
    required this.result,
    required this.isMandatory,
    required this.sourceClause,
    required this.explanation,
  });

  final String ruleId;
  final String conditionName;
  final String parameter;
  final Object? userValue;
  final Object? expectedValue;
  final String operator;
  final TriState result;
  final bool isMandatory;
  final String sourceClause;
  final String explanation;
}

class EligibilityResult {
  const EligibilityResult({
    required this.schemeId,
    required this.schemeName,
    required this.overallLabel,
    required this.summaryExplanation,
    required this.predicateTraces,
    required this.missingAttributes,
    required this.failedAttributes,
    required this.verifiedSourceUrl,
    required this.lastVerifiedDate,
    required this.feeStatus,
  });

  final String schemeId;
  final String schemeName;
  final String overallLabel;
  final String summaryExplanation;
  final List<PredicateTrace> predicateTraces;
  final List<String> missingAttributes;
  final List<String> failedAttributes;
  final String verifiedSourceUrl;
  final String lastVerifiedDate;
  final String feeStatus;

  /// "Rules satisfied X of Y" (MatchesPage.tsx): traces whose result is true.
  int get satisfiedCount =>
      predicateTraces.where((t) => t.result == TriState.trueValue).length;

  /// "Rules satisfied X of Y": total number of traces.
  int get totalCount => predicateTraces.length;
}

// ---------------------------------------------------------------------------
// JS-compatible coercions (used so comparisons and text match the TS exactly)
// ---------------------------------------------------------------------------

/// JS String(value) for the value kinds that occur here.
String jsString(Object? v) {
  if (v == null) return 'null';
  if (v is bool) return v ? 'true' : 'false';
  if (v is num) {
    if (v.isNaN) return 'NaN';
    if (v.isFinite && v == v.truncateToDouble()) return v.toInt().toString();
    return v.toString();
  }
  if (v is List) return v.map(jsString).join(',');
  return v.toString();
}

/// JS Number(value): NaN when not parseable.
double jsNumber(Object? v) {
  if (v == null) return 0;
  if (v is bool) return v ? 1 : 0;
  if (v is num) return v.toDouble();
  if (v is String) {
    final t = v.trim();
    if (t.isEmpty) return 0;
    return double.tryParse(t) ?? double.nan;
  }
  return double.nan;
}

/// JS Boolean(value) truthiness.
bool jsTruthy(Object? v) {
  if (v == null) return false;
  if (v is bool) return v;
  if (v is num) return v != 0 && !v.isNaN;
  if (v is String) return v.isNotEmpty;
  return true;
}

/// Equivalent of JS toLocaleString('en-IN') (Indian digit grouping, max 3 fraction digits).
String formatInr(num value) {
  if (value.isNaN) return 'NaN';
  final negative = value < 0;
  final fixed = value.abs().toStringAsFixed(3);
  final parts = fixed.split('.');
  final intPart = parts[0];
  final frac = parts.length > 1 ? parts[1].replaceFirst(RegExp(r'0+$'), '') : '';

  String grouped;
  if (intPart.length <= 3) {
    grouped = intPart;
  } else {
    final last3 = intPart.substring(intPart.length - 3);
    var rest = intPart.substring(0, intPart.length - 3);
    final groups = <String>[];
    while (rest.length > 2) {
      groups.insert(0, rest.substring(rest.length - 2));
      rest = rest.substring(0, rest.length - 2);
    }
    if (rest.isNotEmpty) groups.insert(0, rest);
    grouped = '${groups.join(',')},$last3';
  }

  return '${negative ? '-' : ''}$grouped${frac.isEmpty ? '' : '.$frac'}';
}

// ---------------------------------------------------------------------------
// Predicate and scheme evaluation
// ---------------------------------------------------------------------------

/// Evaluates a single predicate against the citizen profile.
PredicateTrace evaluatePredicate(RulePredicate predicate, CitizenProfile profile) {
  final userVal = profile.fieldValue(predicate.parameter);

  // Missing user fact: UNKNOWN (unknown is not false).
  if (userVal == null) {
    return PredicateTrace(
      ruleId: predicate.id,
      conditionName: predicate.conditionName,
      parameter: predicate.parameter,
      userValue: null,
      expectedValue: predicate.expectedValue,
      operator: predicate.operator,
      result: TriState.unknown,
      isMandatory: predicate.isMandatory,
      sourceClause: predicate.sourceClause,
      explanation:
          'Information for "${predicate.conditionName}" is unknown. Please provide your ${predicate.parameter} to verify.',
    );
  }

  TriState result = TriState.falseValue;
  String explanation = '';

  switch (predicate.operator) {
    case 'EQUALS':
      {
        final match = jsString(userVal).toLowerCase() ==
            jsString(predicate.expectedValue).toLowerCase();
        result = match ? TriState.trueValue : TriState.falseValue;
        explanation = match
            ? 'Condition met: "${predicate.conditionName}" matches "${jsString(predicate.expectedValue)}".'
            : 'Condition not met: Required "${jsString(predicate.expectedValue)}", but your profile shows "${jsString(userVal)}".';
        break;
      }

    case 'IN':
      {
        final expected = predicate.expectedValue;
        final expectedArray = expected is List
            ? expected.map((v) => jsString(v).toLowerCase()).toList()
            : [jsString(expected).toLowerCase()];
        final match = expectedArray.contains(jsString(userVal).toLowerCase());
        result = match ? TriState.trueValue : TriState.falseValue;
        explanation = match
            ? 'Condition met: "${jsString(userVal)}" is included in the eligible list (${expectedArray.join(', ')}).'
            : 'Condition not met: "${jsString(userVal)}" is not in the eligible categories (${expectedArray.join(', ')}).';
        break;
      }

    case 'LESS_THAN_OR_EQUAL':
      {
        final numVal = jsNumber(userVal);
        final limit = jsNumber(predicate.expectedValue);
        if (numVal.isNaN) {
          result = TriState.unknown;
          explanation = 'Could not parse numerical value for ${predicate.parameter}.';
        } else {
          final pass = numVal <= limit;
          result = pass ? TriState.trueValue : TriState.falseValue;
          explanation = pass
              ? 'Condition met: ₹${formatInr(numVal)} is within ceiling of ₹${formatInr(limit)}.'
              : 'Income ceiling exceeded: ₹${formatInr(numVal)} exceeds maximum limit of ₹${formatInr(limit)}.';
        }
        break;
      }

    case 'GREATER_THAN_OR_EQUAL':
      {
        final numVal = jsNumber(userVal);
        final minReq = jsNumber(predicate.expectedValue);
        if (numVal.isNaN) {
          result = TriState.unknown;
          explanation = 'Could not parse numerical value for ${predicate.parameter}.';
        } else {
          final pass = numVal >= minReq;
          result = pass ? TriState.trueValue : TriState.falseValue;
          explanation = pass
              ? 'Requirement met: ${jsString(numVal)}% is at or above minimum requirement of ${jsString(minReq)}%.'
              : 'Below requirement: ${jsString(numVal)}% is below minimum required ${jsString(minReq)}%.';
        }
        break;
      }

    case 'BOOLEAN':
      {
        final boolUser = jsTruthy(userVal);
        final boolExpected = jsTruthy(predicate.expectedValue);
        result = boolUser == boolExpected ? TriState.trueValue : TriState.falseValue;
        explanation = result == TriState.trueValue
            ? 'Condition met: Requirement for ${predicate.conditionName} is satisfied.'
            : 'Condition not met: ${predicate.conditionName} is required.';
        break;
      }

    default:
      result = TriState.unknown;
      explanation = 'Unsupported rule operator: ${predicate.operator}';
  }

  return PredicateTrace(
    ruleId: predicate.id,
    conditionName: predicate.conditionName,
    parameter: predicate.parameter,
    userValue: userVal,
    expectedValue: predicate.expectedValue,
    operator: predicate.operator,
    result: result,
    isMandatory: predicate.isMandatory,
    sourceClause: predicate.sourceClause,
    explanation: explanation,
  );
}

/// Evaluates an entire scheme against a citizen profile (deterministic status mapping).
EligibilityResult evaluateSchemeEligibility(SchemeRecord scheme, CitizenProfile profile) {
  final verifiedSourceUrl = scheme.sources.isEmpty ? '' : scheme.sources.first.portalUrl;

  // Unreviewed, draft or stale scheme data: "Can't tell yet" (ADR-003).
  if (scheme.verificationStatus != 'verified') {
    return EligibilityResult(
      schemeId: scheme.id,
      schemeName: scheme.name,
      overallLabel: LikelihoodLabel.cantTellYet,
      summaryExplanation:
          'The official regulations or source for this scheme are currently ${scheme.verificationStatus}. We cannot provide guidance until rules are re-verified.',
      predicateTraces: const [],
      missingAttributes: const [],
      failedAttributes: const [],
      verifiedSourceUrl: verifiedSourceUrl,
      lastVerifiedDate: scheme.lastVerifiedDate,
      feeStatus: scheme.feeStatus,
    );
  }

  final traces =
      scheme.rules.map((rule) => evaluatePredicate(rule, profile)).toList();

  final mandatoryTraces = traces.where((t) => t.isMandatory).toList();
  final failedMandatory =
      mandatoryTraces.where((t) => t.result == TriState.falseValue).toList();
  final unknownMandatory =
      mandatoryTraces.where((t) => t.result == TriState.unknown).toList();

  String overallLabel;
  String summaryExplanation;

  if (failedMandatory.isNotEmpty) {
    overallLabel = LikelihoodLabel.unlikely;
    final failedNames = failedMandatory.map((t) => t.conditionName).join('; ');
    summaryExplanation =
        'Based on your profile, you do not meet one or more mandatory conditions: $failedNames.';
  } else if (unknownMandatory.isNotEmpty) {
    overallLabel = LikelihoodLabel.needToConfirm;
    final missingNames = unknownMandatory.map((t) => t.conditionName).join('; ');
    summaryExplanation = 'You may qualify, but need to confirm: $missingNames.';
  } else {
    overallLabel = LikelihoodLabel.likelyEligible;
    summaryExplanation =
        'All mandatory conditions published in official guidelines (${scheme.version}) are satisfied by your profile details.';
  }

  // Forbidden-language guardrail.
  assertValidLikelihoodLabel(overallLabel);

  return EligibilityResult(
    schemeId: scheme.id,
    schemeName: scheme.name,
    overallLabel: overallLabel,
    summaryExplanation: summaryExplanation,
    predicateTraces: traces,
    missingAttributes: unknownMandatory.map((t) => t.parameter).toList(),
    failedAttributes: failedMandatory.map((t) => t.parameter).toList(),
    verifiedSourceUrl: verifiedSourceUrl,
    lastVerifiedDate: scheme.lastVerifiedDate,
    feeStatus: scheme.feeStatus,
  );
}
