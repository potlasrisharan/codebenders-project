/**
 * Three-Valued Deterministic Eligibility Engine (P5)
 * Enforces ADR-002, ADR-003, ADR-005, and FR-ELG-01 through FR-ELG-08.
 *
 * Truth values:
 * - 'true' (Satisfied)
 * - 'false' (Failed)
 * - 'unknown' (Missing citizen attribute or incomplete information)
 *
 * Fixed outcome labels:
 * - 'Likely eligible'
 * - 'Need to confirm'
 * - 'Unlikely'
 * - 'Can\'t tell yet'
 */

import { SchemeRecord, LikelihoodLabel, RulePredicate } from '../data/schema';
import { CitizenProfile } from '../profile/citizen-profile';

export type TriState = 'true' | 'false' | 'unknown';

export interface PredicateTrace {
  ruleId: string;
  conditionName: string;
  parameter: string;
  userValue: unknown;
  expectedValue: unknown;
  operator: string;
  result: TriState;
  isMandatory: boolean;
  sourceClause: string;
  explanation: string;
}

export interface EligibilityResult {
  schemeId: string;
  schemeName: string;
  overallLabel: LikelihoodLabel;
  summaryExplanation: string;
  predicateTraces: PredicateTrace[];
  missingAttributes: string[];
  failedAttributes: string[];
  verifiedSourceUrl: string;
  lastVerifiedDate: string;
  feeStatus: string;
}

/**
 * Three-valued Kleene AND operator
 */
export function kleeneAnd(a: TriState, b: TriState): TriState {
  if (a === 'false' || b === 'false') return 'false';
  if (a === 'unknown' || b === 'unknown') return 'unknown';
  return 'true';
}

/**
 * Three-valued Kleene OR operator
 */
export function kleeneOr(a: TriState, b: TriState): TriState {
  if (a === 'true' || b === 'true') return 'true';
  if (a === 'unknown' || b === 'unknown') return 'unknown';
  return 'false';
}

/**
 * Evaluates a single predicate against the citizen profile
 */
export function evaluatePredicate(predicate: RulePredicate, profile: CitizenProfile): PredicateTrace {
  const userVal = profile[predicate.parameter as keyof CitizenProfile];

  // If user fact is missing/null, predicate is UNKNOWN (Unknown is not False!)
  if (userVal === null || userVal === undefined) {
    return {
      ruleId: predicate.id,
      conditionName: predicate.conditionName,
      parameter: predicate.parameter,
      userValue: null,
      expectedValue: predicate.expectedValue,
      operator: predicate.operator,
      result: 'unknown',
      isMandatory: predicate.isMandatory,
      sourceClause: predicate.sourceClause,
      explanation: `Information for "${predicate.conditionName}" is unknown. Please provide your ${predicate.parameter} to verify.`,
    };
  }

  let result: TriState = 'false';
  let explanation = '';

  switch (predicate.operator) {
    case 'EQUALS': {
      const match = String(userVal).toLowerCase() === String(predicate.expectedValue).toLowerCase();
      result = match ? 'true' : 'false';
      explanation = match
        ? `Condition met: "${predicate.conditionName}" matches "${predicate.expectedValue}".`
        : `Condition not met: Required "${predicate.expectedValue}", but your profile shows "${userVal}".`;
      break;
    }

    case 'IN': {
      const expectedArray = Array.isArray(predicate.expectedValue)
        ? predicate.expectedValue.map((v) => String(v).toLowerCase())
        : [String(predicate.expectedValue).toLowerCase()];
      const match = expectedArray.includes(String(userVal).toLowerCase());
      result = match ? 'true' : 'false';
      explanation = match
        ? `Condition met: "${userVal}" is included in the eligible list (${expectedArray.join(', ')}).`
        : `Condition not met: "${userVal}" is not in the eligible categories (${expectedArray.join(', ')}).`;
      break;
    }

    case 'LESS_THAN_OR_EQUAL': {
      const numVal = Number(userVal);
      const limit = Number(predicate.expectedValue);
      if (isNaN(numVal)) {
        result = 'unknown';
        explanation = `Could not parse numerical value for ${predicate.parameter}.`;
      } else {
        const pass = numVal <= limit;
        result = pass ? 'true' : 'false';
        explanation = pass
          ? `Condition met: ₹${numVal.toLocaleString('en-IN')} is within ceiling of ₹${limit.toLocaleString('en-IN')}.`
          : `Income ceiling exceeded: ₹${numVal.toLocaleString('en-IN')} exceeds maximum limit of ₹${limit.toLocaleString('en-IN')}.`;
      }
      break;
    }

    case 'GREATER_THAN_OR_EQUAL': {
      const numVal = Number(userVal);
      const minReq = Number(predicate.expectedValue);
      if (isNaN(numVal)) {
        result = 'unknown';
        explanation = `Could not parse numerical value for ${predicate.parameter}.`;
      } else {
        const pass = numVal >= minReq;
        result = pass ? 'true' : 'false';
        explanation = pass
          ? `Requirement met: ${numVal}% is at or above minimum requirement of ${minReq}%.`
          : `Below requirement: ${numVal}% is below minimum required ${minReq}%.`;
      }
      break;
    }

    case 'BOOLEAN': {
      const boolUser = Boolean(userVal);
      const boolExpected = Boolean(predicate.expectedValue);
      result = boolUser === boolExpected ? 'true' : 'false';
      explanation = result === 'true'
        ? `Condition met: Requirement for ${predicate.conditionName} is satisfied.`
        : `Condition not met: ${predicate.conditionName} is required.`;
      break;
    }

    default:
      result = 'unknown';
      explanation = `Unsupported rule operator: ${predicate.operator}`;
  }

  return {
    ruleId: predicate.id,
    conditionName: predicate.conditionName,
    parameter: predicate.parameter,
    userValue: userVal,
    expectedValue: predicate.expectedValue,
    operator: predicate.operator,
    result,
    isMandatory: predicate.isMandatory,
    sourceClause: predicate.sourceClause,
    explanation,
  };
}

/**
 * Evaluates an entire scheme against a citizen profile.
 * Implements strict Kleene logic and deterministic status mapping.
 */
export function evaluateSchemeEligibility(
  scheme: SchemeRecord,
  profile: CitizenProfile
): EligibilityResult {
  // If scheme data itself is unreviewed, draft, or stale, output "Can't tell yet" (ADR-003)
  if (scheme.verificationStatus !== 'verified') {
    return {
      schemeId: scheme.id,
      schemeName: scheme.name,
      overallLabel: "Can't tell yet",
      summaryExplanation: `The official regulations or source for this scheme are currently ${scheme.verificationStatus}. We cannot provide guidance until rules are re-verified.`,
      predicateTraces: [],
      missingAttributes: [],
      failedAttributes: [],
      verifiedSourceUrl: scheme.sources[0]?.portalUrl || '',
      lastVerifiedDate: scheme.lastVerifiedDate,
      feeStatus: scheme.feeStatus,
    };
  }

  const traces: PredicateTrace[] = scheme.rules.map((rule) => evaluatePredicate(rule, profile));

  const mandatoryTraces = traces.filter((t) => t.isMandatory);
  const failedMandatory = mandatoryTraces.filter((t) => t.result === 'false');
  const unknownMandatory = mandatoryTraces.filter((t) => t.result === 'unknown');

  let overallLabel: LikelihoodLabel;
  let summaryExplanation: string;

  if (failedMandatory.length > 0) {
    overallLabel = 'Unlikely';
    const failedNames = failedMandatory.map((t) => t.conditionName).join('; ');
    summaryExplanation = `Based on your profile, you do not meet one or more mandatory conditions: ${failedNames}.`;
  } else if (unknownMandatory.length > 0) {
    overallLabel = 'Need to confirm';
    const missingNames = unknownMandatory.map((t) => t.conditionName).join('; ');
    summaryExplanation = `You may qualify, but need to confirm: ${missingNames}.`;
  } else {
    overallLabel = 'Likely eligible';
    summaryExplanation = `All mandatory conditions published in official guidelines (${scheme.version}) are satisfied by your profile details.`;
  }

  // Forbidden language assertion check (guardrail)
  assertValidLikelihoodLabel(overallLabel);

  return {
    schemeId: scheme.id,
    schemeName: scheme.name,
    overallLabel,
    summaryExplanation,
    predicateTraces: traces,
    missingAttributes: unknownMandatory.map((t) => t.parameter),
    failedAttributes: failedMandatory.map((t) => t.parameter),
    verifiedSourceUrl: scheme.sources[0]?.portalUrl || '',
    lastVerifiedDate: scheme.lastVerifiedDate,
    feeStatus: scheme.feeStatus,
  };
}

/**
 * Validates that no forbidden standalone words ('Eligible', 'Guaranteed', 'Approved') are used.
 */
export function assertValidLikelihoodLabel(label: string): void {
  const allowedLabels: LikelihoodLabel[] = [
    'Likely eligible',
    'Need to confirm',
    'Unlikely',
    "Can't tell yet",
  ];

  if (!allowedLabels.includes(label as LikelihoodLabel)) {
    throw new Error(`Forbidden or invalid likelihood label detected: "${label}". Only standard four labels are permitted.`);
  }

  // Explicit check against standalone forbidden terms
  const forbiddenNakedTerms = ['eligible', 'guaranteed', 'approved', 'entitled'];
  if (forbiddenNakedTerms.includes(label.toLowerCase().trim())) {
    throw new Error(`Violation of PS5 Guardrails: Standalone term "${label}" is forbidden!`);
  }
}
