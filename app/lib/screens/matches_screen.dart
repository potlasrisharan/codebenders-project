import 'package:flutter/material.dart';

import '../core/eligibility.dart' as engine;
import '../core/profile.dart';
import '../core/tracker.dart';
import '../data/schemes_dataset.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';
import 'scheme_bridge.dart';
import 'scheme_detail_screen.dart';

/// Matches (port of src/routes/MatchesPage.tsx). Runs the eligibility engine over
/// the verified catalogue for the current profile. Changes to the tracker are
/// reported through [onClaimsChanged] so the caller can persist them.
class MatchesScreen extends StatefulWidget {
  const MatchesScreen({
    super.key,
    required this.profile,
    required this.claims,
    required this.onClaimsChanged,
  });

  final CitizenProfile profile;
  final List<TrackedClaim> claims;
  final ValueChanged<List<TrackedClaim>> onClaimsChanged;

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

const String _allStates = 'All states';

class _MatchesScreenState extends State<MatchesScreen> {
  late String _state = widget.profile.domicileState ?? _allStates;
  SchemeCategory? _category;
  String _keyword = '';
  bool _showUnlikely = false;

  @override
  Widget build(BuildContext context) {
    final states = <String>{
      for (final s in verifiedGovernmentSchemes) s.state,
      if (_state != _allStates) _state,
    }.toList()
      ..sort();

    final matches = <_Match>[];
    for (final s in verifiedGovernmentSchemes) {
      if (!_passesFilters(s)) continue;
      final result = engine.evaluateSchemeEligibility(toEngineScheme(s), widget.profile);
      if (!_showUnlikely && result.overallLabel == LikelihoodLabel.unlikely.wire) {
        continue;
      }
      matches.add(_Match(s, result));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Matches')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space2),
        children: [
          DropdownButtonFormField<String>(
            initialValue: _state,
            isExpanded: true,
            decoration: const InputDecoration(labelText: 'State'),
            items: [
              for (final st in [_allStates, ...states])
                DropdownMenuItem<String>(value: st, child: Text(st)),
            ],
            onChanged: (v) => setState(() => _state = v ?? _allStates),
          ),
          const SizedBox(height: AppSpacing.space2),
          DropdownButtonFormField<SchemeCategory?>(
            initialValue: _category,
            isExpanded: true,
            decoration: const InputDecoration(labelText: 'Category'),
            items: [
              const DropdownMenuItem<SchemeCategory?>(
                value: null,
                child: Text('All categories'),
              ),
              for (final c in SchemeCategory.values)
                DropdownMenuItem<SchemeCategory?>(
                  value: c,
                  child: Text(_categoryLabel(c)),
                ),
            ],
            onChanged: (v) => setState(() => _category = v),
          ),
          const SizedBox(height: AppSpacing.space2),
          TextField(
            decoration: const InputDecoration(
              labelText: 'Keyword',
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (v) => setState(() => _keyword = v),
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Show Unlikely results'),
            value: _showUnlikely,
            onChanged: (v) => setState(() => _showUnlikely = v),
          ),
          const SizedBox(height: AppSpacing.space1),
          if (matches.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.space2),
                child: Text('No schemes match these filters.'),
              ),
            ),
          for (final m in matches) ...[
            _schemeCard(m),
            const SizedBox(height: AppSpacing.space2),
          ],
        ],
      ),
    );
  }

  bool _passesFilters(SchemeRecord s) {
    if (_state != _allStates &&
        s.state != _state &&
        s.jurisdiction != JurisdictionType.central) {
      return false;
    }
    if (_category != null && s.category != _category) return false;
    final q = _keyword.trim().toLowerCase();
    if (q.isNotEmpty &&
        !s.name.toLowerCase().contains(q) &&
        !s.shortDescription.toLowerCase().contains(q)) {
      return false;
    }
    return true;
  }

  Widget _schemeCard(_Match m) {
    final s = m.scheme;
    final result = m.result;
    final saved = findClaim(widget.claims, s.id) != null;

    return Card(
      child: InkWell(
        borderRadius: AppRadius.borderRadius,
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (_) => SchemeDetailScreen(schemeId: s.id),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(s.name, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: AppSpacing.space1),
              StatusChip(
                label: result.overallLabel,
                color: _labelColor(result.overallLabel),
              ),
              const SizedBox(height: AppSpacing.space1),
              Text('Rules satisfied ${result.satisfiedCount} of ${result.totalCount}'),
              const SizedBox(height: 4),
              Text(_feeText(s),
                  style: const TextStyle(
                      fontSize: 13, color: AppColors.colorTextSecondary)),
              Row(
                children: [
                  const Expanded(child: Text('Save to tracker')),
                  Switch(
                    value: saved,
                    onChanged: (v) => _toggleSave(s, v),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleSave(SchemeRecord scheme, bool save) {
    final next = List<TrackedClaim>.of(widget.claims);
    if (save) {
      if (findClaim(next, scheme.id) == null) addClaim(next, scheme);
    } else {
      next.removeWhere((c) => c.schemeId == scheme.id);
    }
    widget.onClaimsChanged(next);
  }

  static String _feeText(SchemeRecord s) {
    switch (s.feeStatus) {
      case FeeStatus.freeVerified:
        return 'Fee: 100% free on the official portal';
      case FeeStatus.feeVerified:
        return 'Fee: ${s.feeDetails ?? 'see the official portal'}';
      case FeeStatus.unknown:
        return 'Fee: unknown, check the official portal';
    }
  }

  static String _categoryLabel(SchemeCategory c) {
    switch (c) {
      case SchemeCategory.scholarship:
        return 'Scholarship';
      case SchemeCategory.educationAid:
        return 'Education aid';
      case SchemeCategory.fellowship:
        return 'Fellowship';
      case SchemeCategory.welfare:
        return 'Welfare';
    }
  }

  static Color _labelColor(String label) {
    if (label == LikelihoodLabel.likelyEligible.wire) return const Color(0xFF047857);
    if (label == LikelihoodLabel.needToConfirm.wire) return const Color(0xFFB45309);
    return AppColors.colorTextSecondary;
  }
}

class _Match {
  const _Match(this.scheme, this.result);

  final SchemeRecord scheme;
  final engine.EligibilityResult result;
}
