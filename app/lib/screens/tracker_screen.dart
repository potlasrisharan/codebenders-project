import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/tracker.dart';
import '../core/what_if.dart';
import '../data/schemes_dataset.dart';
import '../models/models.dart';
import '../storage/app_storage.dart';
import '../theme/app_theme.dart';
import 'scheme_bridge.dart';

/// Claim tracker (port of src/routes/TrackerPage.tsx). Lists saved claims with a
/// five-stage stepper, the application reference, the renewal calendar and the
/// scheme-change banner. Claims persist through [AppStorage].
class TrackerScreen extends StatefulWidget {
  const TrackerScreen({super.key});

  @override
  State<TrackerScreen> createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  final AppStorage _storage = AppStorage();
  final ClaimTracker _tracker = ClaimTracker();
  final Map<String, TextEditingController> _refCtls = {};
  List<TrackedClaim> _claims = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    for (final c in _refCtls.values) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _load() async {
    final claims = await _storage.loadTrackedClaims();
    if (!mounted) return;
    setState(() {
      _claims = claims;
      for (final c in claims) {
        _refCtls[c.id] = TextEditingController(text: c.applicationReferenceNumber ?? '');
      }
      _loading = false;
    });
  }

  Future<void> _setStage(TrackedClaim claim, ClaimStage stage) async {
    setState(() => claim.stage = stage);
    await _storage.saveTrackedClaims(_claims);
  }

  /// Mirrors ClaimTracker.updateStage: the reference is only written when non-empty.
  Future<void> _setReference(TrackedClaim claim, String value) async {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;
    claim.applicationReferenceNumber = trimmed;
    await _storage.saveTrackedClaims(_claims);
  }

  Future<void> _remove(TrackedClaim claim) async {
    setState(() {
      _claims.remove(claim);
      _refCtls.remove(claim.id)?.dispose();
    });
    await _storage.saveTrackedClaims(_claims);
  }

  Future<void> _copy(String text, String message) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Application tracker')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(AppSpacing.space2),
              children: [
                ..._alertBanners(),
                if (_claims.isEmpty)
                  const Card(
                    child: Padding(
                      padding: EdgeInsets.all(AppSpacing.space2),
                      child: Text(
                        'No claims saved yet. Save a scheme from its detail page to track it here.',
                      ),
                    ),
                  ),
                for (final claim in List<TrackedClaim>.of(_claims)) ...[
                  _claimCard(context, claim),
                  const SizedBox(height: AppSpacing.space2),
                ],
                _renewalCalendar(context),
              ],
            ),
    );
  }

  /// Scheme-change banner for tracked schemes (getReassessmentAlerts).
  List<Widget> _alertBanners() {
    final alerts = getReassessmentAlerts([for (final c in _claims) c.schemeId]);
    return [
      for (final a in alerts) ...[
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.space2),
          decoration: BoxDecoration(
            color: const Color(0xFFFFFBEB),
            borderRadius: AppRadius.borderRadius,
            border: Border.all(color: const Color(0xFFFDE68A)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Scheme changed: ${a.schemeName}',
                  style: const TextStyle(fontWeight: FontWeight.w700)),
              Text('${a.oldVersion} → ${a.newVersion} (effective ${a.effectiveDate})'),
              Text(a.changeSummary),
              Text(a.impactOnApplicants),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.space2),
      ],
    ];
  }

  Widget _claimCard(BuildContext context, TrackedClaim claim) {
    final refCtl = _refCtls.putIfAbsent(
      claim.id,
      () => TextEditingController(text: claim.applicationReferenceNumber ?? ''),
    );
    final scheme = _schemeById(claim.schemeId);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(claim.schemeName, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.space2),
            _StageStepper(
              current: claim.stage,
              onSelect: (stage) => _setStage(claim, stage),
            ),
            const SizedBox(height: AppSpacing.space2),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: refCtl,
                    decoration: const InputDecoration(
                      labelText: 'Application reference number',
                    ),
                    onChanged: (v) => _setReference(claim, v),
                  ),
                ),
                IconButton(
                  tooltip: 'Copy reference',
                  icon: const Icon(Icons.copy),
                  onPressed: () => _copy(refCtl.text, 'Reference copied'),
                ),
              ],
            ),
            if (scheme != null) ...[
              const SizedBox(height: AppSpacing.space2),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppSpacing.space2),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBEB),
                  borderRadius: AppRadius.borderRadius,
                  border: Border.all(color: const Color(0xFFFDE68A)),
                ),
                child: Text.rich(TextSpan(children: [
                  const TextSpan(
                    text: 'Scam Warning: ',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(text: scheme.scamWarning),
                ])),
              ),
            ],
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => _remove(claim),
                icon: const Icon(Icons.delete_outline),
                label: const Text('Remove'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Renewal calendar: one entry per scheme with renewal support and a window.
  Widget _renewalCalendar(BuildContext context) {
    final events = _tracker.getRenewalCalendarEvents(
      [for (final s in verifiedGovernmentSchemes) toEngineScheme(s)],
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Renewal calendar', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.space1),
            if (events.isEmpty) const Text('No renewal windows recorded.'),
            for (final e in events)
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.event_outlined),
                title: Text(e.schemeName),
                subtitle: Text('${e.academicYear} • ${e.windowDescription}'),
                trailing: Text(e.status.replaceAll('_', ' ')),
              ),
          ],
        ),
      ),
    );
  }

  static SchemeRecord? _schemeById(String id) {
    for (final s in verifiedGovernmentSchemes) {
      if (s.id == id) return s;
    }
    return null;
  }
}

/// Five-stage stepper (Preparing, Ready, Applied, Verifying, Disbursed). Tapping a
/// stage sets the claim's stage.
class _StageStepper extends StatelessWidget {
  const _StageStepper({required this.current, required this.onSelect});

  final ClaimStage current;
  final ValueChanged<ClaimStage> onSelect;

  @override
  Widget build(BuildContext context) {
    final currentIndex = ClaimStage.values.indexOf(current);
    return Row(
      children: [
        for (var i = 0; i < ClaimStage.values.length; i++)
          Expanded(
            child: InkWell(
              onTap: () => onSelect(ClaimStage.values[i]),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor:
                        i <= currentIndex ? AppColors.colorAccent : AppColors.colorBorder,
                    foregroundColor: AppColors.colorSurface,
                    child: Text('${i + 1}', style: const TextStyle(fontSize: 11)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    ClaimStage.values[i].stepLabel,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: i == currentIndex ? FontWeight.w700 : FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
