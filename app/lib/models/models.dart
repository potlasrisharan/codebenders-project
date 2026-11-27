/// Dart models mirroring the TypeScript types in src/core/data/schema.ts.
///
/// All classes are immutable with const constructors. Plain construction only
/// (no JSON serialization). String-literal unions are enums; each enum value
/// keeps the exact TypeScript wire string in its `wire` field.
library;

enum JurisdictionType {
  central('central'),
  state('state'),
  district('district');

  const JurisdictionType(this.wire);

  /// Exact TypeScript string literal.
  final String wire;
}

enum VerificationStatus {
  verified('verified'),
  draft('draft'),
  pendingReview('pending_review'),
  stale('stale');

  const VerificationStatus(this.wire);

  /// Exact TypeScript string literal.
  final String wire;
}

enum FeeStatus {
  freeVerified('free_verified'),
  feeVerified('fee_verified'),
  unknown('unknown');

  const FeeStatus(this.wire);

  /// Exact TypeScript string literal.
  final String wire;
}

enum CoverageStatus {
  covered('covered'),
  partial('partial'),
  notYetVerified('not_yet_verified');

  const CoverageStatus(this.wire);

  /// Exact TypeScript string literal.
  final String wire;
}

enum LikelihoodLabel {
  likelyEligible('Likely eligible'),
  needToConfirm('Need to confirm'),
  unlikely('Unlikely'),
  cantTellYet("Can't tell yet");

  const LikelihoodLabel(this.wire);

  /// Exact TypeScript string literal.
  final String wire;
}

enum DocumentRequirementType {
  mandatory('mandatory'),
  conditional('conditional'),
  optional('optional');

  const DocumentRequirementType(this.wire);

  /// Exact TypeScript string literal.
  final String wire;
}

enum SchemeCategory {
  scholarship('scholarship'),
  educationAid('education_aid'),
  fellowship('fellowship'),
  welfare('welfare');

  const SchemeCategory(this.wire);

  /// Exact TypeScript string literal.
  final String wire;
}

enum ApplicationChannel {
  onlinePortal('online_portal'),
  meesevaCsc('meeseva_csc'),
  collegeCell('college_cell'),
  districtOffice('district_office');

  const ApplicationChannel(this.wire);

  /// Exact TypeScript string literal.
  final String wire;
}

enum RuleOperator {
  equals('EQUALS'),
  inList('IN'),
  lessThanOrEqual('LESS_THAN_OR_EQUAL'),
  greaterThanOrEqual('GREATER_THAN_OR_EQUAL'),
  between('BETWEEN'),
  boolean('BOOLEAN');

  const RuleOperator(this.wire);

  /// Exact TypeScript string literal.
  final String wire;
}

/// Mirrors `SchemeSourceSchema`.
class SchemeSource {
  const SchemeSource({
    required this.id,
    required this.name,
    required this.department,
    required this.portalUrl,
    required this.lastVerifiedDate,
    required this.verifiedBy,
    this.documentReference,
  });

  final String id;
  final String name;
  final String department;
  final String portalUrl;

  /// ISO format YYYY-MM-DD.
  final String lastVerifiedDate;
  final String verifiedBy;
  final String? documentReference;
}

/// Mirrors `SchemeDocumentSchema`.
class SchemeDocument {
  const SchemeDocument({
    required this.id,
    required this.name,
    required this.description,
    required this.requirementType,
    this.conditionExplanation,
    required this.issuingAuthority,
    required this.sourceEvidence,
  });

  final String id;
  final String name;
  final String description;
  final DocumentRequirementType requirementType;
  final String? conditionExplanation;
  final String issuingAuthority;
  final String sourceEvidence;
}

/// Mirrors `ApplicationStepSchema`.
class ApplicationStep {
  const ApplicationStep({
    required this.stepNumber,
    required this.title,
    required this.description,
    this.portalUrl,
    required this.channel,
  });

  /// Positive integer.
  final int stepNumber;
  final String title;
  final String description;
  final String? portalUrl;
  final ApplicationChannel channel;
}

/// Mirrors `RulePredicateSchema`.
///
/// `expectedValue` mirrors the TS union
/// `string | number | boolean | string[] | number[]`, typed as [Object].
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

  /// e.g. "state", "educationLevel", "familyIncome", "attendance".
  final String parameter;
  final RuleOperator operator;

  /// One of: String, num, bool, List<String>, List<num>.
  final Object expectedValue;
  final bool isMandatory;
  final String conditionName;
  final String sourceClause;
}

/// Mirrors `SchemeRecordSchema`.
class SchemeRecord {
  const SchemeRecord({
    required this.id,
    required this.slug,
    required this.name,
    required this.shortDescription,
    required this.category,
    required this.jurisdiction,
    required this.state,
    required this.version,
    required this.verificationStatus,
    required this.lastVerifiedDate,
    required this.sources,
    required this.feeStatus,
    this.feeDetails,
    required this.renewalSupported,
    this.renewalWindow,
    required this.documents,
    required this.applicationSteps,
    required this.rules,
    required this.scamWarning,
  });

  final String id;
  final String slug;
  final String name;
  final String shortDescription;
  final SchemeCategory category;
  final JurisdictionType jurisdiction;

  /// e.g. "Telangana", "All India", "North Eastern States".
  final String state;
  final String version;
  final VerificationStatus verificationStatus;
  final String lastVerifiedDate;
  final List<SchemeSource> sources;
  final FeeStatus feeStatus;
  final String? feeDetails;
  final bool renewalSupported;

  /// e.g. "August to November (Academic Year)".
  final String? renewalWindow;
  final List<SchemeDocument> documents;
  final List<ApplicationStep> applicationSteps;
  final List<RulePredicate> rules;
  final String scamWarning;
}

/// Mirrors `StateCoverageItemSchema`.
class StateCoverageItem {
  const StateCoverageItem({
    required this.stateCode,
    required this.stateName,
    required this.coverageStatus,
    required this.schemeCount,
    required this.lastAuditDate,
    required this.notes,
  });

  final String stateCode;
  final String stateName;
  final CoverageStatus coverageStatus;

  /// Non-negative integer.
  final int schemeCount;
  final String lastAuditDate;
  final String notes;
}
