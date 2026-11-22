import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/common.dart';

/// Landing page (port of src/routes/LandingPage.tsx). "Get started" pushes the
/// main shell, which is supplied by [shellBuilder] so this file does not depend
/// on main.dart.
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key, required this.shellBuilder});

  /// Builds the main shell (Intake, Matches, Checklist, Tracker, Admin review).
  final WidgetBuilder shellBuilder;

  static const List<_Step> _steps = [
    _Step(
      number: '01',
      title: 'Describe your situation in plain words',
      text:
          'Type in English or Telugu (or choose a synthetic demo profile). No long confusing forms; answer only what is needed.',
      icon: Icons.auto_awesome_outlined,
    ),
    _Step(
      number: '02',
      title: 'Three-valued deterministic matching',
      text:
          "Our engine evaluates published eligibility rules as true, false, or unknown. We report 'Likely eligible' or 'Need to confirm'—never fake guarantees.",
      icon: Icons.verified_user_outlined,
    ),
    _Step(
      number: '03',
      title: 'Document checklist & direct official links',
      text:
          'Get your personalized MeeSeva document list, step-by-step application instructions, fee transparency, and renewal calendar.',
      icon: Icons.description_outlined,
    ),
  ];

  static const List<String> _notes = [
    'Not an application or official portal: Official submissions occur directly on official sites like Telangana ePASS or NSP.',
    'Not an approval: Outcome labels like "Likely eligible" are guidance estimates based on published rules, never official guarantees.',
    'Zero fees or middlemen: Applying for government scholarships is 100% free. Never pay agents who demand commission or promise guaranteed approval.',
    'Sample profiles & verified data: Tested with 6 synthetic student personas; state coverage is disclosed honestly.',
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.space2),
          children: [
            // Hero.
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StatusChip(label: 'Independent Public Service Navigation'),
                    const SizedBox(height: AppSpacing.space2),
                    Text('LabhSaathi', style: textTheme.headlineLarge),
                    const SizedBox(height: AppSpacing.space1),
                    Text(
                      'Know your benefits. Understand your rights. Claim what\'s yours.',
                      style: textTheme.titleMedium,
                    ),
                    const SizedBox(height: AppSpacing.space2),
                    const Text(
                      'An intelligent, source-grounded claim-readiness platform designed for '
                      'low-income college students in Telangana and across India. Explain your '
                      'circumstances, discover verified scholarships, understand missing '
                      'conditions, and prepare documents without relying on middlemen.',
                    ),
                    const SizedBox(height: AppSpacing.space3),
                    FilledButton.icon(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(builder: shellBuilder),
                      ),
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Get started'),
                    ),
                    const SizedBox(height: AppSpacing.space2),
                    const Text(
                      'Independent guidance. Not an application, an approval, or official '
                      'government determination.',
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: AppColors.colorTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.space3),

            // Highlights.
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: AppSpacing.space1,
              crossAxisSpacing: AppSpacing.space1,
              childAspectRatio: 1.5,
              children: const [
                StatCard(
                  value: '100% Free',
                  label: 'Zero application fees on official portals',
                  icon: Icons.check_circle_outline,
                ),
                StatCard(
                  value: '7+ Verified',
                  label: 'Central & Telangana student schemes',
                  icon: Icons.apartment_outlined,
                ),
                StatCard(
                  value: 'Privacy First',
                  label: 'Sensitive-ID Shield blocks raw Aadhaar/PAN',
                  icon: Icons.lock_outline,
                ),
                StatCard(
                  value: 'No Middlemen',
                  label: 'Direct portal links & transparent fee states',
                  icon: Icons.shield_outlined,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.space3),

            // How it works.
            Text('Simple 3-Step Journey',
                style: textTheme.labelLarge?.copyWith(color: AppColors.colorAccent)),
            const SizedBox(height: AppSpacing.space1),
            Text('How it works', style: textTheme.headlineMedium),
            const SizedBox(height: AppSpacing.space2),
            for (final step in _steps) ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.space2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(step.number,
                              style: const TextStyle(fontWeight: FontWeight.w700)),
                          Icon(step.icon, color: AppColors.colorAccent),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.space1),
                      Text(step.title,
                          style: const TextStyle(fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Text(step.text,
                          style: const TextStyle(
                              fontSize: 13, color: AppColors.colorTextSecondary)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.space1),
            ],
            const SizedBox(height: AppSpacing.space2),

            // What this is not.
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.shield_outlined, color: AppColors.colorAccent),
                        const SizedBox(width: AppSpacing.space1),
                        Text('Middleman Shield • Protect Your Rights',
                            style: textTheme.labelLarge),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.space1),
                    Text('What this is not', style: textTheme.titleLarge),
                    const SizedBox(height: AppSpacing.space1),
                    for (final note in _notes)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Text('• $note', style: const TextStyle(fontSize: 13)),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.space3),

            // Footer.
            const Divider(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.space2),
              child: Text(
                'Never pay middlemen for official scholarships.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.colorTextSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Step {
  const _Step({
    required this.number,
    required this.title,
    required this.text,
    required this.icon,
  });

  final String number;
  final String title;
  final String text;
  final IconData icon;
}
