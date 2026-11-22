import 'package:flutter/material.dart';

import '../data/schemes_dataset.dart';
import '../models/models.dart';
import '../theme/app_theme.dart';

/// Admin review (port of src/routes/AdminReviewPage.tsx): provenance table, state
/// coverage registry, audit trail and rule version history, and the policy card.
class AdminReviewScreen extends StatefulWidget {
  const AdminReviewScreen({super.key});

  @override
  State<AdminReviewScreen> createState() => _AdminReviewScreenState();
}

class _AdminReviewScreenState extends State<AdminReviewScreen> {
  late String _selectedId =
      verifiedGovernmentSchemes.isEmpty ? '' : verifiedGovernmentSchemes.first.id;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final selected = _selectedScheme();
    final versionHistory =
        _versionHistory.where((v) => v.schemeId == _selectedId).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Admin review')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space2),
        children: [
          Text('Admin review', style: textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.space1),
          const Text(
            'Source governance, authoritative provenance, rule version auditing, and '
            'national jurisdiction coverage registry.',
            style: TextStyle(color: AppColors.colorTextSecondary),
          ),
          const SizedBox(height: AppSpacing.space3),

          // Section 1: provenance table.
          _sectionTitle(
            '1. Sourced Scheme Records (${verifiedGovernmentSchemes.length} Cataloged)',
          ),
          const Text(
            'Tap any row to inspect its version history.',
            style: TextStyle(fontSize: 12, color: AppColors.colorTextSecondary),
          ),
          const SizedBox(height: AppSpacing.space1),
          _provenanceTable(),
          const SizedBox(height: AppSpacing.space3),

          // Section 2: state coverage registry.
          _sectionTitle('2. National State Coverage Registry (FR-DATA-11)'),
          const Text(
            'Transparent status of state-level data readiness. Non-verified jurisdictions '
            'trigger explicit data disclosures rather than silent failure.',
            style: TextStyle(fontSize: 12, color: AppColors.colorTextSecondary),
          ),
          const SizedBox(height: AppSpacing.space1),
          for (final item in _stateCoverage) _coverageCard(item),
          const SizedBox(height: AppSpacing.space3),

          // Section 3: audit trail and version history.
          _sectionTitle('3. Audit History & Rule Version Diffs'),
          const SizedBox(height: AppSpacing.space1),
          _listCard(
            title: 'Audit Trail Entries (${_auditTrail.length})',
            children: [
              for (final log in _auditTrail)
                _entryTile(
                  heading: '${log.action} • ${log.schemeId}',
                  trailing: log.timestamp.substring(0, 10),
                  lines: [log.details, 'Auditor: ${log.actor}'],
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.space2),
          _listCard(
            title: 'Version History: ${selected?.name ?? ''} '
                '(${versionHistory.length} Record(s))',
            children: [
              if (versionHistory.isEmpty)
                const Text(
                  'Initial verified baseline version. No prior deprecated versions.',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              for (final v in versionHistory)
                _entryTile(
                  heading: 'Version: ${v.version}',
                  trailing: 'Effective: ${v.effectiveDate}',
                  lines: [v.changesSummary, 'Delta: ${v.ruleDelta}'],
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.space3),

          // Policy card.
          Card(
            color: const Color(0xFFFFFBEB),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.warning_amber_outlined, color: Color(0xFFB45309)),
                  const SizedBox(width: AppSpacing.space1),
                  Expanded(
                    child: Text.rich(TextSpan(children: [
                      const TextSpan(
                        text: 'Administrative Rule Compliance:\n',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const TextSpan(
                        text: 'Standalone terms like "Eligible", "Guaranteed", or "Approved" '
                            'are strictly forbidden across all citizen-facing interfaces. '
                            'All evaluations use the four canonical likelihood labels: '
                            'Likely eligible, Need to confirm, Unlikely, Can\'t tell yet. '
                            'Zero raw identity numbers (Aadhaar/PAN) are ever accepted or stored.',
                      ),
                    ])),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SchemeRecord? _selectedScheme() {
    for (final s in verifiedGovernmentSchemes) {
      if (s.id == _selectedId) return s;
    }
    return verifiedGovernmentSchemes.isEmpty ? null : verifiedGovernmentSchemes.first;
  }

  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.space1),
        child: Text(text, style: Theme.of(context).textTheme.titleMedium),
      );

  Widget _provenanceTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text('Scheme & Department')),
          DataColumn(label: Text('Jurisdiction')),
          DataColumn(label: Text('Version')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Official Fee State')),
          DataColumn(label: Text('Last Verified')),
          DataColumn(label: Text('Portal')),
        ],
        rows: [
          for (final s in verifiedGovernmentSchemes)
            DataRow(
              selected: s.id == _selectedId,
              onSelectChanged: (_) => setState(() => _selectedId = s.id),
              cells: [
                DataCell(ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 260),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(s.name, style: const TextStyle(fontWeight: FontWeight.w700)),
                      Text(
                        s.sources.isEmpty ? '' : s.sources.first.department,
                        style: const TextStyle(
                            fontSize: 11, color: AppColors.colorTextSecondary),
                      ),
                    ],
                  ),
                )),
                DataCell(Text(s.jurisdiction == JurisdictionType.central
                    ? 'Central'
                    : s.state)),
                DataCell(Text('v${s.version}')),
                DataCell(Text(s.verificationStatus.wire)),
                DataCell(Text(s.feeStatus == FeeStatus.freeVerified
                    ? '100% Free'
                    : s.feeStatus.wire)),
                DataCell(Text(s.lastVerifiedDate)),
                DataCell(Text(s.sources.isEmpty ? '' : s.sources.first.portalUrl)),
              ],
            ),
        ],
      ),
    );
  }

  Widget _coverageCard(StateCoverageItem item) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.stateName,
                          style: const TextStyle(fontWeight: FontWeight.w700)),
                      Text(
                        'Code: ${item.stateCode} • Last Audit: ${item.lastAuditDate}',
                        style: const TextStyle(
                            fontSize: 11, color: AppColors.colorTextSecondary),
                      ),
                    ],
                  ),
                ),
                Text(
                  item.coverageStatus.wire.replaceAll('_', ' ').toUpperCase(),
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.space1),
            Text(item.notes, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _listCard({required String title, required List<Widget> children}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _entryTile({
    required String heading,
    required String trailing,
    required List<String> lines,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.space1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(heading,
                    style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
              ),
              Text(trailing, style: const TextStyle(fontSize: 11)),
            ],
          ),
          for (final line in lines) Text(line, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

/// Audit trail entry (repository.ts AuditLogEntry).
class _AuditLogEntry {
  const _AuditLogEntry({
    required this.schemeId,
    required this.version,
    required this.action,
    required this.timestamp,
    required this.actor,
    required this.details,
  });

  final String schemeId;
  final String version;
  final String action;
  final String timestamp;
  final String actor;
  final String details;
}

/// Rule version record (repository.ts RuleVersionRecord).
class _RuleVersionRecord {
  const _RuleVersionRecord({
    required this.schemeId,
    required this.version,
    required this.effectiveDate,
    required this.changesSummary,
    required this.ruleDelta,
  });

  final String schemeId;
  final String version;
  final String effectiveDate;
  final String changesSummary;
  final String ruleDelta;
}

// In-memory audit trail and version history (repository.ts AUDIT_TRAIL, VERSION_HISTORY).
const List<_AuditLogEntry> _auditTrail = [
  _AuditLogEntry(
    schemeId: 'ts-epass-rtf-2026',
    version: '2025-26.v1',
    action: 'VERIFIED',
    timestamp: '2026-11-20T10:00:00Z',
    actor: 'Govt Policy Auditor (CGG Reference)',
    details:
        'Verified G.O.Ms.No.66 attendance clause (75%) and income limits with MeeSeva integration.',
  ),
  _AuditLogEntry(
    schemeId: 'central-nsp-csss-2026',
    version: 'NSP-CSSS-2025-26',
    action: 'VERIFIED',
    timestamp: '2026-11-15T09:30:00Z',
    actor: 'MoE Guidelines Reviewer',
    details:
        'Confirmed 80th percentile merit cutoff and ₹4.5L gross family income ceiling on scholarships.gov.in.',
  ),
  _AuditLogEntry(
    schemeId: 'central-aicte-pragati-2026',
    version: 'AICTE-PRAGATI-2025-26',
    action: 'VERIFIED',
    timestamp: '2026-11-18T14:00:00Z',
    actor: 'AICTE Technical Auditor',
    details:
        'Validated ₹50,000/yr grant amount, ₹8L income limit, and max 2 girl children condition.',
  ),
];

const List<_RuleVersionRecord> _versionHistory = [
  _RuleVersionRecord(
    schemeId: 'ts-epass-rtf-2026',
    version: '2025-26.v1',
    effectiveDate: '2025-06-01',
    changesSummary:
        'Updated BC Rural income ceiling from ₹1,00,000 to ₹1,50,000 per G.O.Ms.66.',
    ruleDelta: 'Parameter `familyIncome` max limit increased for BC rural applicants.',
  ),
  _RuleVersionRecord(
    schemeId: 'ts-epass-rtf-2026',
    version: '2024-25.v2',
    effectiveDate: '2024-06-01',
    changesSummary: 'Mandatory Aadhaar-NPCI bank seeding clause added.',
    ruleDelta: 'Added NPCI biometric requirement.',
  ),
];

// National state coverage registry (coverage-registry.ts NATIONAL_STATE_COVERAGE).
const List<StateCoverageItem> _stateCoverage = [
  StateCoverageItem(
    stateCode: 'TS',
    stateName: 'Telangana',
    coverageStatus: CoverageStatus.covered,
    schemeCount: 4,
    lastAuditDate: '2026-11-20',
    notes:
        'Pilot cohort (College Students in Telangana) fully verified with official ePASS & department rules.',
  ),
  StateCoverageItem(
    stateCode: 'PAN',
    stateName: 'All India (Central)',
    coverageStatus: CoverageStatus.covered,
    schemeCount: 3,
    lastAuditDate: '2026-11-18',
    notes:
        'National Scholarship Portal (NSP) and AICTE central schemes cataloged and verified.',
  ),
  StateCoverageItem(
    stateCode: 'AP',
    stateName: 'Andhra Pradesh',
    coverageStatus: CoverageStatus.partial,
    schemeCount: 1,
    lastAuditDate: '2026-11-10',
    notes:
        'Jagananna Vidya Deevena & Vasathi Deevena cataloged; awaiting rule parity review.',
  ),
  StateCoverageItem(
    stateCode: 'KA',
    stateName: 'Karnataka',
    coverageStatus: CoverageStatus.partial,
    schemeCount: 1,
    lastAuditDate: '2026-11-10',
    notes:
        'State Scholarship Portal (SSP) post-matric metadata present; verification in progress.',
  ),
  StateCoverageItem(
    stateCode: 'MH',
    stateName: 'Maharashtra',
    coverageStatus: CoverageStatus.partial,
    schemeCount: 1,
    lastAuditDate: '2026-11-08',
    notes: 'MahaDBT post-matric scholarship cataloged; detailed rule criteria pending.',
  ),
  StateCoverageItem(
    stateCode: 'TN',
    stateName: 'Tamil Nadu',
    coverageStatus: CoverageStatus.notYetVerified,
    schemeCount: 0,
    lastAuditDate: '2026-11-01',
    notes:
        'State welfare scheme data has not been fully verified against official Gazettes yet.',
  ),
  StateCoverageItem(
    stateCode: 'KL',
    stateName: 'Kerala',
    coverageStatus: CoverageStatus.notYetVerified,
    schemeCount: 0,
    lastAuditDate: '2026-11-01',
    notes: 'Department regulations pending legal review.',
  ),
  StateCoverageItem(
    stateCode: 'UP',
    stateName: 'Uttar Pradesh',
    coverageStatus: CoverageStatus.notYetVerified,
    schemeCount: 0,
    lastAuditDate: '2026-11-01',
    notes: 'UP Scholarship portal rules pending automated ingestion audit.',
  ),
];
