import 'package:flutter/material.dart';

import '../core/tracker.dart';
import '../models/models.dart';
import '../storage/app_storage.dart';
import '../theme/app_theme.dart';
import 'scheme_bridge.dart';

/// Document checklist (port of src/routes/ChecklistPage.tsx). The active scheme is
/// the first saved claim's scheme, else the first catalogue scheme.
class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  final AppStorage _storage = AppStorage();
  List<TrackedClaim> _claims = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final claims = await _storage.loadTrackedClaims();
    if (!mounted) return;
    setState(() {
      _claims = claims;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final claim = _claims.isEmpty ? null : _claims.first;
    final scheme = findSchemeByKey(claim?.schemeId);

    return Scaffold(
      appBar: AppBar(title: const Text('Document checklist')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : scheme == null
              ? const Center(child: Text('No schemes available.'))
              : ListView(
                  padding: const EdgeInsets.all(AppSpacing.space2),
                  children: [
                    Text(scheme.name, style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: AppSpacing.space2),
                    _readinessCard(context, scheme),
                    const SizedBox(height: AppSpacing.space2),
                    _documentsCard(context, scheme),
                    const SizedBox(height: AppSpacing.space2),
                    _adviceCard(context),
                  ],
                ),
    );
  }

  Widget _readinessCard(BuildContext context, SchemeRecord scheme) {
    final completed =
        findClaim(_claims, scheme.id)?.completedDocumentIds ?? const <String>[];
    final total = scheme.documents.length;
    final ready = scheme.documents.where((d) => completed.contains(d.id)).length;
    final fraction = total == 0 ? 0.0 : ready / total;

    return _sectionCard(
      context,
      title: 'Readiness',
      children: [
        LinearProgressIndicator(value: fraction),
        const SizedBox(height: AppSpacing.space1),
        Text('$ready of $total documents ready (${(fraction * 100).round()}%)'),
        if (_claims.isEmpty)
          const Padding(
            padding: EdgeInsets.only(top: AppSpacing.space1),
            child: Text(
              'Save this scheme from its detail page to track your documents.',
              style: TextStyle(color: AppColors.colorTextSecondary),
            ),
          ),
      ],
    );
  }

  Widget _documentsCard(BuildContext context, SchemeRecord scheme) {
    final completed =
        findClaim(_claims, scheme.id)?.completedDocumentIds ?? const <String>[];
    return _sectionCard(
      context,
      title: 'Documents',
      children: [
        if (scheme.documents.isEmpty)
          const Text('No documents recorded for this scheme.'),
        for (final doc in scheme.documents)
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              completed.contains(doc.id)
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: completed.contains(doc.id)
                  ? AppColors.colorAccent
                  : AppColors.colorTextSecondary,
            ),
            title: Text(doc.name),
            subtitle: Text('${doc.requirementType.wire} • ${doc.issuingAuthority}'),
          ),
      ],
    );
  }

  Widget _adviceCard(BuildContext context) {
    return _sectionCard(
      context,
      title: 'Where to get your certificates',
      children: const [
        _AdviceRow(
          icon: Icons.storefront_outlined,
          text: 'Income and caste certificates: apply through MeeSeva at Rs 45.',
        ),
        SizedBox(height: AppSpacing.space1),
        _AdviceRow(
          icon: Icons.school_outlined,
          text: 'Bonafide certificate: obtain from your college at no cost.',
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
}

class _AdviceRow extends StatelessWidget {
  const _AdviceRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.colorAccent),
        const SizedBox(width: AppSpacing.space1),
        Expanded(child: Text(text)),
      ],
    );
  }
}
