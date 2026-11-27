import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/eligibility.dart' as engine;
import '../core/profile.dart';
import '../core/tracker.dart';
import '../core/what_if.dart';
import '../models/models.dart';
import '../storage/app_storage.dart';
import '../theme/app_theme.dart';
import 'scheme_bridge.dart';

/// Scheme detail (port of src/routes/SchemeDetailPage.tsx). Looks the scheme up by
/// id, then slug, else shows the first catalogue scheme.
class SchemeDetailScreen extends StatefulWidget {
  const SchemeDetailScreen({super.key, this.schemeId});

  /// Scheme id or slug. Null or unknown values fall back to the first scheme.
  final String? schemeId;

  @override
  State<SchemeDetailScreen> createState() => _SchemeDetailScreenState();
}

class _SchemeDetailScreenState extends State<SchemeDetailScreen> {
  final AppStorage _storage = AppStorage();
  final ClaimTracker _tracker = ClaimTracker();
  final TextEditingController _incomeCtl =
      TextEditingController(text: engine.jsString(whatIfDefaultIncome));
  final TextEditingController _attendanceCtl =
      TextEditingController(text: engine.jsString(whatIfDefaultAttendance));

  late final SchemeRecord? _scheme = findSchemeByKey(widget.schemeId);
  CitizenProfile _profile = emptyCitizenProfile;
  List<TrackedClaim> _claims = [];
  num _income = whatIfDefaultIncome;
  num _attendance = whatIfDefaultAttendance;
  bool _loading = true;
  bool _showShare = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    _incomeCtl.dispose();
    _attendanceCtl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final profile = await _storage.loadProfile();
    final claims = await _storage.loadTrackedClaims();
    if (!mounted) return;
    setState(() {
      _profile = profile ?? emptyCitizenProfile;
      _claims = claims;
      _income = whatIfStartingIncome(_profile);
      _attendance = whatIfStartingAttendance(_profile);
      _incomeCtl.text = engine.jsString(_income);
      _attendanceCtl.text = engine.jsString(_attendance);
      _loading = false;
    });
  }

  void _onWhatIfChanged() {
    setState(() {
      _income = num.tryParse(_incomeCtl.text.trim()) ?? _income;
      _attendance = num.tryParse(_attendanceCtl.text.trim()) ?? _attendance;
    });
  }

  /// Ticking a document saves the scheme to the tracker if it is not saved yet.
  Future<void> _toggleDocument(SchemeRecord scheme, SchemeDocument doc) async {
    setState(() {
      final claim = findClaim(_claims, scheme.id) ?? addClaim(_claims, scheme);
      toggleDocument(claim, doc.id);
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
    final scheme = _scheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Scheme details')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : scheme == null
              ? const Center(child: Text('No schemes available.'))
              : ListView(
                  padding: const EdgeInsets.all(AppSpacing.space2),
                  children: [
                    _header(context, scheme),
                    const SizedBox(height: AppSpacing.space2),
                    _MiddlemanShieldCard(scheme: scheme),
                    const SizedBox(height: AppSpacing.space2),
                    _sectionCard(
                      context,
                      title: 'How to apply',
                      children: [_applicationFlow(scheme)],
                    ),
                    const SizedBox(height: AppSpacing.space2),
                    _sectionCard(
                      context,
                      title: 'Document checklist',
                      children: [
                        const Text(
                          'Ticking a document saves this scheme to your tracker.',
                          style: TextStyle(color: AppColors.colorTextSecondary),
                        ),
                        for (final doc in scheme.documents) _documentTile(scheme, doc),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.space2),
                    _sectionCard(
                      context,
                      title: 'What-if simulator',
                      children: _whatIfChildren(scheme),
                    ),
                    const SizedBox(height: AppSpacing.space2),
                    _sectionCard(
                      context,
                      title: 'Share checklist on WhatsApp',
                      children: _shareChildren(scheme),
                    ),
                  ],
                ),
    );
  }

  Widget _header(BuildContext context, SchemeRecord scheme) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(scheme.name, style: textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.space1),
        Text(scheme.shortDescription),
        const SizedBox(height: AppSpacing.space1),
        Wrap(
          spacing: AppSpacing.space1,
          runSpacing: AppSpacing.space1,
          children: [
            Chip(label: Text(scheme.state)),
            Chip(label: Text('v${scheme.version}')),
            Chip(label: Text(scheme.verificationStatus.wire)),
          ],
        ),
      ],
    );
  }

  Widget _sectionCard(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: AppSpacing.space1),
            ...children,
          ],
        ),
      ),
    );
  }

  /// Application steps as a vertical flow: numbered nodes joined by a connector.
  Widget _applicationFlow(SchemeRecord scheme) {
    final steps = scheme.applicationSteps;
    if (steps.isEmpty) return const Text('No application steps recorded.');
    return Column(
      children: [
        for (var i = 0; i < steps.length; i++)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: AppColors.colorAccent,
                      foregroundColor: AppColors.colorSurface,
                      child: Text('${steps[i].stepNumber}',
                          style: const TextStyle(fontSize: 12)),
                    ),
                    if (i < steps.length - 1)
                      Expanded(
                        child: Container(width: 2, color: AppColors.colorBorder),
                      ),
                  ],
                ),
                const SizedBox(width: AppSpacing.space2),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.space2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(steps[i].title,
                            style: const TextStyle(fontWeight: FontWeight.w700)),
                        Text(steps[i].description),
                        Text(
                          'Channel: ${_channelLabel(steps[i].channel)}',
                          style: const TextStyle(color: AppColors.colorTextSecondary),
                        ),
                        if (steps[i].portalUrl != null)
                          SelectableText(steps[i].portalUrl!),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _documentTile(SchemeRecord scheme, SchemeDocument doc) {
    final ticked =
        findClaim(_claims, scheme.id)?.completedDocumentIds.contains(doc.id) ?? false;
    return CheckboxListTile(
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      value: ticked,
      title: Text(doc.name),
      subtitle: Text(
        [
          '${doc.requirementType.wire} • ${doc.description}',
          if (doc.conditionExplanation != null) doc.conditionExplanation!,
          'Issued by: ${doc.issuingAuthority}',
        ].join('\n'),
      ),
      onChanged: (_) => _toggleDocument(scheme, doc),
    );
  }

  List<Widget> _whatIfChildren(SchemeRecord scheme) {
    final result = simulateWhatIf(
      toEngineScheme(scheme),
      _profile,
      {'familyIncome': _income, 'attendancePercentage': _attendance},
    );
    return [
      TextField(
        controller: _incomeCtl,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(labelText: 'Family income (₹ per year)'),
        onChanged: (_) => _onWhatIfChanged(),
      ),
      const SizedBox(height: AppSpacing.space1),
      TextField(
        controller: _attendanceCtl,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(labelText: 'Attendance (%)'),
        onChanged: (_) => _onWhatIfChanged(),
      ),
      const SizedBox(height: AppSpacing.space1),
      Text(
        'Current: ${result.originalEligibility.overallLabel}  →  '
        'Simulated: ${result.simulatedEligibility.overallLabel}',
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      Text(result.deltaSummary),
      if (result.affectedConditionNames.isNotEmpty)
        Text('Conditions changed: ${result.affectedConditionNames.join(', ')}'),
      const SizedBox(height: AppSpacing.space1),
      const Text(
        'Simulation only. Your saved profile is not changed.',
        style: TextStyle(color: AppColors.colorTextSecondary),
      ),
    ];
  }

  /// WhatsApp share preview. The link is built by the core but is not opened here
  /// (url_launcher is not a dependency); the user copies the text instead.
  List<Widget> _shareChildren(SchemeRecord scheme) {
    final share = _tracker.generateWhatsAppShareUrl(toEngineScheme(scheme));
    return [
      OutlinedButton.icon(
        onPressed: () => setState(() => _showShare = !_showShare),
        icon: const Icon(Icons.preview_outlined),
        label: Text(_showShare ? 'Hide preview' : 'Preview WhatsApp message'),
      ),
      if (_showShare) ...[
        const SizedBox(height: AppSpacing.space1),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.space2),
          decoration: BoxDecoration(
            color: AppColors.colorSurfaceMuted,
            borderRadius: AppRadius.borderRadius,
            border: Border.all(color: AppColors.colorBorder),
          ),
          child: SelectableText(share.text),
        ),
        const SizedBox(height: AppSpacing.space1),
        Wrap(
          spacing: AppSpacing.space1,
          children: [
            FilledButton.icon(
              onPressed: () => _copy(share.text, 'Message copied'),
              icon: const Icon(Icons.copy),
              label: const Text('Copy message'),
            ),
            OutlinedButton.icon(
              onPressed: () => _copy(share.url, 'Link copied'),
              icon: const Icon(Icons.link),
              label: const Text('Copy wa.me link'),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.space1),
        const Text(
          'Paste the copied message into WhatsApp. Opening WhatsApp directly from '
          'this screen is not wired in this build.',
          style: TextStyle(color: AppColors.colorTextSecondary),
        ),
      ],
    ];
  }

  static String _channelLabel(ApplicationChannel channel) => switch (channel) {
        ApplicationChannel.onlinePortal => 'Online portal',
        ApplicationChannel.meesevaCsc => 'MeeSeva / CSC',
        ApplicationChannel.collegeCell => 'College cell',
        ApplicationChannel.districtOffice => 'District office',
      };
}

/// Middleman Shield & Fee Transparency card (MiddlemanShieldCard.tsx).
class _MiddlemanShieldCard extends StatelessWidget {
  const _MiddlemanShieldCard({required this.scheme});

  final SchemeRecord scheme;

  @override
  Widget build(BuildContext context) {
    final hasSource = scheme.sources.isNotEmpty;
    final department = hasSource ? scheme.sources.first.department : 'Not recorded';
    final portal = hasSource ? scheme.sources.first.portalUrl : '';
    final (dotColor, feeText) = switch (scheme.feeStatus) {
      FeeStatus.freeVerified =>
        (Colors.green.shade700, 'Official application is 100% FREE'),
      FeeStatus.feeVerified => (Colors.amber.shade700, 'Official fee required'),
      FeeStatus.unknown =>
        (Colors.grey.shade500, 'Fee information not verified with department'),
    };

    return Card(
      color: const Color(0xFFEFF6FF),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.verified_user_outlined, color: Color(0xFF1D4ED8)),
                const SizedBox(width: AppSpacing.space1),
                Expanded(
                  child: Text(
                    'Middleman Shield & Fee Transparency',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.space2),
            Text('Official Cost',
                style: const TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w700, color: AppColors.colorTextSecondary)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6, right: 8),
                  child: CircleAvatar(radius: 5, backgroundColor: dotColor),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(feeText, style: const TextStyle(fontWeight: FontWeight.w600)),
                      if (scheme.feeDetails != null) Text(scheme.feeDetails!),
                    ],
                  ),
                ),
              ],
            ),
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
            const SizedBox(height: AppSpacing.space2),
            Text('Verified from: $department (Verified on ${scheme.lastVerifiedDate})'),
            if (portal.isNotEmpty) SelectableText('Official portal: $portal'),
            const SizedBox(height: AppSpacing.space1),
            const Text(
              'Notice: LabhSaathi is an independent public service platform. We do not '
              'approve, process, or guarantee government benefits.',
              style: TextStyle(
                  fontSize: 12, fontStyle: FontStyle.italic, color: AppColors.colorTextSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
