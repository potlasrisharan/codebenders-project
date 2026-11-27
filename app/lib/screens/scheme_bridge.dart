/// Glue shared by the scheme screens. The catalogue (data/schemes_dataset.dart)
/// uses the enum-typed models in models/models.dart, while the tracker, what-if
/// and eligibility cores use the string-typed records in core/eligibility.dart.
/// These helpers convert between the two and look up schemes and claims.
/// Not a port of any website file.
library;

import '../core/eligibility.dart' as engine;
import '../core/tracker.dart';
import '../data/schemes_dataset.dart';
import '../models/models.dart';

/// Converts a catalogue record into the string-typed record the cores expect.
engine.SchemeRecord toEngineScheme(SchemeRecord s) {
  return engine.SchemeRecord(
    id: s.id,
    name: s.name,
    version: s.version,
    verificationStatus: s.verificationStatus.wire,
    lastVerifiedDate: s.lastVerifiedDate,
    sources: [
      for (final src in s.sources) engine.SchemeSource(portalUrl: src.portalUrl),
    ],
    feeStatus: s.feeStatus.wire,
    renewalSupported: s.renewalSupported,
    renewalWindow: s.renewalWindow,
    documents: [
      for (final d in s.documents)
        engine.SchemeDocument(
          id: d.id,
          name: d.name,
          requirementType: d.requirementType.wire,
        ),
    ],
    rules: [
      for (final r in s.rules)
        engine.RulePredicate(
          id: r.id,
          parameter: r.parameter,
          operator: r.operator.wire,
          expectedValue: r.expectedValue,
          isMandatory: r.isMandatory,
          conditionName: r.conditionName,
          sourceClause: r.sourceClause,
        ),
    ],
  );
}

/// Looks up a scheme by id, then by slug, else returns the first catalogue scheme.
/// Returns null only when the catalogue is empty.
SchemeRecord? findSchemeByKey(String? key) {
  if (verifiedGovernmentSchemes.isEmpty) return null;
  if (key != null) {
    for (final s in verifiedGovernmentSchemes) {
      if (s.id == key) return s;
    }
    for (final s in verifiedGovernmentSchemes) {
      if (s.slug == key) return s;
    }
  }
  return verifiedGovernmentSchemes.first;
}

/// The saved claim for [schemeId], or null when that scheme is not saved.
TrackedClaim? findClaim(List<TrackedClaim> claims, String schemeId) {
  for (final c in claims) {
    if (c.schemeId == schemeId) return c;
  }
  return null;
}

/// Saves [scheme] as a new claim at stage "Preparing" and adds it to [claims].
TrackedClaim addClaim(List<TrackedClaim> claims, SchemeRecord scheme) {
  final claim = ClaimTracker().saveScheme(toEngineScheme(scheme));
  claims.add(claim);
  return claim;
}

/// Adds [docId] to the claim's completed list, or removes it if already present.
void toggleDocument(TrackedClaim claim, String docId) {
  if (!claim.completedDocumentIds.remove(docId)) {
    claim.completedDocumentIds.add(docId);
  }
}
