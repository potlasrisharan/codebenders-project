/// Port of the browser persistence in src/core/profile/ProfileContext.tsx and
/// src/core/tracker/claim-tracker.ts (localStorage) onto shared_preferences.
/// Values are stored as JSON strings under the same keys the website uses.
/// Load errors fall back to in-memory defaults (null / empty list).
library;

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../core/profile.dart';
import '../core/tracker.dart';

class AppStorage {
  AppStorage([SharedPreferences? prefs]) : _prefs = prefs;

  static const String activeProfileKey = 'labhsaathi_active_profile_v1';
  static const String trackedClaimsKey = 'labhsaathi_tracked_claims_v1';

  SharedPreferences? _prefs;

  Future<SharedPreferences> _store() async =>
      _prefs ??= await SharedPreferences.getInstance();

  /// Returns the saved active profile, or null if none or unreadable.
  Future<CitizenProfile?> loadProfile() async {
    try {
      final raw = (await _store()).getString(activeProfileKey);
      if (raw == null) return null;
      final decoded = jsonDecode(raw);
      if (decoded is! Map) return null;
      return CitizenProfile.fromJson(Map<String, Object?>.from(decoded));
    } catch (_) {
      return null;
    }
  }

  Future<void> saveProfile(CitizenProfile profile) async {
    final prefs = await _store();
    await prefs.setString(activeProfileKey, jsonEncode(profile.toJson()));
  }

  /// Returns the saved claims, or an empty list if none or unreadable.
  Future<List<TrackedClaim>> loadTrackedClaims() async {
    try {
      final raw = (await _store()).getString(trackedClaimsKey);
      if (raw == null) return [];
      final decoded = jsonDecode(raw);
      if (decoded is! List) return [];
      return decoded
          .map((e) => _claimFromJson(Map<String, Object?>.from(e as Map)))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> saveTrackedClaims(List<TrackedClaim> claims) async {
    final prefs = await _store();
    await prefs.setString(
      trackedClaimsKey,
      jsonEncode(claims.map(_claimToJson).toList()),
    );
  }

  static Map<String, Object?> _claimToJson(TrackedClaim c) => {
        'id': c.id,
        'schemeId': c.schemeId,
        'schemeName': c.schemeName,
        'officialPortalUrl': c.officialPortalUrl,
        'savedAt': c.savedAt,
        'stage': c.stage.wireValue,
        'completedDocumentIds': c.completedDocumentIds,
        'applicationReferenceNumber': c.applicationReferenceNumber,
        'notes': c.notes,
        'renewalWindow': c.renewalWindow,
        'academicYear': c.academicYear,
      };

  static TrackedClaim _claimFromJson(Map<String, Object?> json) => TrackedClaim(
        id: json['id'] as String,
        schemeId: json['schemeId'] as String,
        schemeName: json['schemeName'] as String,
        officialPortalUrl: json['officialPortalUrl'] as String,
        savedAt: json['savedAt'] as String,
        stage: ClaimStage.fromWire(json['stage'] as String),
        completedDocumentIds:
            List<String>.from(json['completedDocumentIds'] as List),
        applicationReferenceNumber: json['applicationReferenceNumber'] as String?,
        notes: json['notes'] as String?,
        renewalWindow: json['renewalWindow'] as String?,
        academicYear: json['academicYear'] as String?,
      );
}
