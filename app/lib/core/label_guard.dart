/// Port of assertValidLikelihoodLabel in src/core/engine/eligibility-engine.ts.
/// Pure Dart (no Flutter imports).
library;

/// Canonical likelihood labels (fixed outcome labels from the TS engine).
class LikelihoodLabel {
  LikelihoodLabel._();

  static const String likelyEligible = 'Likely eligible';
  static const String needToConfirm = 'Need to confirm';
  static const String unlikely = 'Unlikely';
  static const String cantTellYet = "Can't tell yet";
}

const List<String> allowedLikelihoodLabels = [
  LikelihoodLabel.likelyEligible,
  LikelihoodLabel.needToConfirm,
  LikelihoodLabel.unlikely,
  LikelihoodLabel.cantTellYet,
];

/// Standalone terms that must never be shown as a likelihood label.
const List<String> forbiddenNakedTerms = [
  'eligible',
  'guaranteed',
  'approved',
  'entitled',
];

/// Throws [ArgumentError] if [label] is not one of the four canonical labels,
/// or if it is a bare forbidden term (checked case-insensitively, trimmed).
void assertValidLikelihoodLabel(String label) {
  if (!allowedLikelihoodLabels.contains(label)) {
    throw ArgumentError(
      'Forbidden or invalid likelihood label detected: "$label". Only standard four labels are permitted.',
    );
  }

  if (forbiddenNakedTerms.contains(label.toLowerCase().trim())) {
    throw ArgumentError(
      'Violation of PS5 Guardrails: Standalone term "$label" is forbidden!',
    );
  }
}
