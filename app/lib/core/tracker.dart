/// Port of src/core/tracker/claim-tracker.ts (Claim Tracker, Renewal Calendar, WhatsApp share).
/// Pure Dart (no Flutter imports). In-memory only: the TS localStorage persistence
/// is not ported here and belongs in the app layer.
library;

import 'eligibility.dart';
import 'sensitive_id_guard.dart';

/// Stage values use the TS wire strings. [stepLabel] is the stepper label shown in the app.
enum ClaimStage {
  preparing('preparing', 'Preparing'),
  readyToApply('ready_to_apply', 'Ready'),
  applied('applied', 'Applied'),
  underVerification('under_verification', 'Verifying'),
  disbursed('disbursed', 'Disbursed');

  const ClaimStage(this.wireValue, this.stepLabel);

  final String wireValue;
  final String stepLabel;

  static ClaimStage fromWire(String value) =>
      ClaimStage.values.firstWhere((s) => s.wireValue == value);
}

class TrackedClaim {
  TrackedClaim({
    required this.id,
    required this.schemeId,
    required this.schemeName,
    required this.officialPortalUrl,
    required this.savedAt,
    required this.stage,
    required this.completedDocumentIds,
    this.applicationReferenceNumber,
    this.notes,
    this.renewalWindow,
    this.academicYear,
  });

  final String id;
  final String schemeId;
  final String schemeName;
  final String officialPortalUrl;
  /// ISO date string.
  final String savedAt;
  ClaimStage stage;
  final List<String> completedDocumentIds;
  String? applicationReferenceNumber;
  String? notes;
  String? renewalWindow;
  String? academicYear;
}

class RenewalCalendarEvent {
  const RenewalCalendarEvent({
    required this.schemeId,
    required this.schemeName,
    required this.academicYear,
    required this.windowDescription,
    required this.status,
    required this.officialSourceUrl,
    required this.mandatoryRequirements,
  });

  final String schemeId;
  final String schemeName;
  final String academicYear;
  final String windowDescription;
  /// 'upcoming' | 'open_now' | 'closing_soon' | 'completed'
  final String status;
  final String officialSourceUrl;
  final List<String> mandatoryRequirements;
}

class WhatsAppShare {
  const WhatsAppShare({required this.url, required this.text});

  final String url;
  final String text;
}

class ClaimTracker {
  final Map<String, TrackedClaim> _claims = {};

  List<TrackedClaim> get claims => _claims.values.toList();

  TrackedClaim? getClaim(String schemeId) => _claims[schemeId];

  bool isSaved(String schemeId) => _claims.containsKey(schemeId);

  /// Adds a claim for [scheme]. Returns the existing claim if already saved.
  TrackedClaim saveScheme(SchemeRecord scheme, {String academicYear = '2026-27'}) {
    final existing = _claims[scheme.id];
    if (existing != null) return existing;

    final claim = TrackedClaim(
      id: 'claim_${scheme.id}_${DateTime.now().millisecondsSinceEpoch}',
      schemeId: scheme.id,
      schemeName: scheme.name,
      officialPortalUrl: scheme.sources.isEmpty ? '' : scheme.sources.first.portalUrl,
      savedAt: DateTime.now().toUtc().toIso8601String(),
      stage: ClaimStage.preparing,
      completedDocumentIds: [],
      renewalWindow: scheme.renewalWindow,
      academicYear: academicYear,
    );

    _claims[scheme.id] = claim;
    return claim;
  }

  /// Sets the stage. The reference number is only written when non-empty.
  TrackedClaim? updateStage(String schemeId, ClaimStage stage,
      {String? applicationReferenceNumber}) {
    final claim = _claims[schemeId];
    if (claim == null) return null;

    claim.stage = stage;
    if (applicationReferenceNumber != null && applicationReferenceNumber.isNotEmpty) {
      claim.applicationReferenceNumber = applicationReferenceNumber;
    }
    return claim;
  }

  /// Adds [docId] to the completed list, or removes it if already present.
  TrackedClaim? toggleDocumentCompletion(String schemeId, String docId) {
    final claim = _claims[schemeId];
    if (claim == null) return null;

    final index = claim.completedDocumentIds.indexOf(docId);
    if (index >= 0) {
      claim.completedDocumentIds.removeAt(index);
    } else {
      claim.completedDocumentIds.add(docId);
    }
    return claim;
  }

  bool removeClaim(String schemeId) => _claims.remove(schemeId) != null;

  /// Renewal calendar: one event per scheme with renewal supported and a window.
  List<RenewalCalendarEvent> getRenewalCalendarEvents(List<SchemeRecord> schemes) {
    final events = <RenewalCalendarEvent>[];

    for (final scheme in schemes) {
      final window = scheme.renewalWindow;
      if (scheme.renewalSupported && window != null && window.isNotEmpty) {
        events.add(RenewalCalendarEvent(
          schemeId: scheme.id,
          schemeName: scheme.name,
          academicYear: '2026-27',
          windowDescription: window,
          status: 'open_now',
          officialSourceUrl: scheme.sources.isEmpty ? '' : scheme.sources.first.portalUrl,
          mandatoryRequirements: scheme.documents
              .where((d) => d.requirementType == 'mandatory')
              .map((d) => d.name)
              .toList(),
        ));
      }
    }

    return events;
  }

  /// WhatsApp share link with a sanitised text payload.
  WhatsAppShare generateWhatsAppShareUrl(SchemeRecord scheme, {String? customNote}) {
    final sanitizedText = sanitizeSharePayload(
      schemeName: scheme.name,
      officialPortalUrl: scheme.sources.isEmpty ? '' : scheme.sources.first.portalUrl,
      checklistItems:
          scheme.documents.map((d) => '${d.name} (${d.requirementType})').toList(),
      notes: customNote,
    );

    final encoded = Uri.encodeComponent(sanitizedText);
    return WhatsAppShare(
      url: 'https://wa.me/?text=$encoded',
      text: sanitizedText,
    );
  }
}
