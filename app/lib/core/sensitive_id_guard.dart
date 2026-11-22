/// Port of src/core/privacy/sensitive-id-shield.ts (Sensitive-ID Shield).
/// Pattern-based detection and redaction only. Pure Dart (no Flutter imports).
library;

/// Aadhaar: 12 digits, optionally grouped 4-4-4 with a space or hyphen.
final RegExp aadhaarRegex = RegExp(r'\b(?:\d{4}[\s-]?\d{4}[\s-]?\d{4}|\d{12})\b');

/// PAN: 5 letters, 4 digits, 1 letter.
final RegExp panRegex = RegExp(r'\b[A-Za-z]{5}\d{4}[A-Za-z]\b');

/// EPIC / Voter ID: 3 letters followed by 7 digits.
final RegExp voterIdRegex = RegExp(r'\b[A-Za-z]{3}\d{7}\b');

const String aadhaarRedaction = '[REDACTED_AADHAAR_PATTERN]';
const String panRedaction = '[REDACTED_PAN_PATTERN]';
const String voterIdRedaction = '[REDACTED_VOTER_ID_PATTERN]';

const String sensitiveIdUserExplanation =
    'For your safety and privacy, LabhSaathi never collects Aadhaar numbers, PAN cards, or official identity numbers. '
    'Please describe your situation using eligibility details only (such as education level, family income range, and district).';

class SensitiveViolation {
  const SensitiveViolation({
    required this.type,
    required this.description,
    required this.startIndex,
    required this.endIndex,
  });

  /// 'AADHAAR_PATTERN' | 'PAN_PATTERN' | 'VOTER_ID_PATTERN'
  final String type;
  final String description;
  final int startIndex;
  final int endIndex;
}

class ShieldInspectionResult {
  const ShieldInspectionResult({
    required this.isClean,
    required this.violations,
    required this.safeText,
    this.userExplanation,
  });

  final bool isClean;
  final List<SensitiveViolation> violations;
  final String safeText;
  final String? userExplanation;
}

/// Inspects [rawInput] for sensitive government identifier patterns.
/// Does not retain or output the raw matched values.
ShieldInspectionResult inspectSensitiveIds(String rawInput) {
  if (rawInput.isEmpty) {
    return const ShieldInspectionResult(isClean: true, violations: [], safeText: '');
  }

  final violations = <SensitiveViolation>[];

  for (final m in aadhaarRegex.allMatches(rawInput)) {
    violations.add(SensitiveViolation(
      type: 'AADHAAR_PATTERN',
      description: 'Pattern resembles a 12-digit national identity number (Aadhaar).',
      startIndex: m.start,
      endIndex: m.end,
    ));
  }

  for (final m in panRegex.allMatches(rawInput)) {
    violations.add(SensitiveViolation(
      type: 'PAN_PATTERN',
      description: 'Pattern resembles a 10-character Permanent Account Number (PAN).',
      startIndex: m.start,
      endIndex: m.end,
    ));
  }

  for (final m in voterIdRegex.allMatches(rawInput)) {
    violations.add(SensitiveViolation(
      type: 'VOTER_ID_PATTERN',
      description: 'Pattern resembles an Election Commission Voter ID number.',
      startIndex: m.start,
      endIndex: m.end,
    ));
  }

  final isClean = violations.isEmpty;

  var safeText = rawInput;
  safeText = safeText.replaceAll(aadhaarRegex, aadhaarRedaction);
  safeText = safeText.replaceAll(panRegex, panRedaction);
  safeText = safeText.replaceAll(voterIdRegex, voterIdRedaction);

  return ShieldInspectionResult(
    isClean: isClean,
    violations: violations,
    safeText: safeText,
    userExplanation: isClean ? null : sensitiveIdUserExplanation,
  );
}

/// True when [text] contains any Aadhaar, PAN or Voter ID pattern.
bool containsSensitiveId(String text) => !inspectSensitiveIds(text).isClean;

/// Redacts any sensitive patterns from [rawInput].
String redactSensitiveIds(String rawInput) => inspectSensitiveIds(rawInput).safeText;

/// Builds a share payload (e.g. WhatsApp text) and redacts any accidental identifiers.
String sanitizeSharePayload({
  required String schemeName,
  required String officialPortalUrl,
  required List<String> checklistItems,
  String? notes,
}) {
  final lines = <String>[
    'Scheme: $schemeName',
    'Official Portal: $officialPortalUrl',
    'Required Documents:',
    for (var i = 0; i < checklistItems.length; i++) '  ${i + 1}. ${checklistItems[i]}',
    (notes != null && notes.isNotEmpty) ? 'Note: $notes' : '',
    '',
    'Guidance provided by LabhSaathi (Independent Beneficiary Navigation Platform). Free and non-official.',
  ].where((s) => s.isNotEmpty).toList();

  return redactSensitiveIds(lines.join('\n'));
}
