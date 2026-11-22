import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Small rounded label used for likelihood labels and other short statuses.
class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.label, this.color});

  final String label;

  /// Border and text colour. Defaults to the site accent.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Color tone = color ?? AppColors.colorAccent;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: tone.withValues(alpha: 0.08),
        borderRadius: AppRadius.borderRadius,
        border: Border.all(color: tone.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: tone,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

/// Stat tile (value, label, optional icon) used in the landing highlights strip.
class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.value,
    required this.label,
    this.icon,
  });

  final String value;
  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 18, color: AppColors.colorAccent),
              const SizedBox(height: AppSpacing.space1),
            ],
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.colorTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
