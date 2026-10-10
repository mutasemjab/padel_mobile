import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_effects.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_tokens.dart';

/// Number + label tile for stat grids. A null [value] renders "—".
class StatCard extends StatelessWidget {
  final String label;
  final String? value;
  final IconData? icon;
  final Color? accent;
  final String? caption;

  const StatCard({super.key, required this.label, required this.value, this.icon, this.accent, this.caption});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final ink = accent ?? (t.isDark ? AppColors.cream : t.textPrimary);
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(14, 14, 14, 12),
      decoration: AppGlass.card(t.isDark, radius: AppRadius.controlAll),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (accent ?? (t.isDark ? AppColors.goldSoft : AppColors.green700)).withValues(alpha: .12),
                border: Border.all(color: (accent ?? (t.isDark ? AppColors.goldSoft : AppColors.green700)).withValues(alpha: .28)),
              ),
              child: Icon(icon, size: 14, color: accent ?? (t.isDark ? AppColors.goldSoft : AppColors.green700)),
            ),
            Gap.sm,
          ],
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              value ?? AppLocalizations.of(context).valueDash,
              style: AppTypography.number(context, size: 26, weight: FontWeight.w500, color: ink),
            ),
          ),
          Gap.xxs,
          Text(label, style: context.text.labelSmall?.copyWith(letterSpacing: 0), maxLines: 2, overflow: TextOverflow.ellipsis),
          if (caption != null) ...[
            Gap.xxs,
            Text(caption!, style: context.text.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
          ],
        ],
      ),
    );
  }
}

/// Responsive grid of [StatCard]s (2 columns on phones, 4 on tablets).
class StatGrid extends StatelessWidget {
  final List<Widget> children;

  const StatGrid({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= AppSpacing.tabletBreakpoint ? 4 : 2;
        final width = (constraints.maxWidth - AppSpacing.sm * (columns - 1)) / columns;
        return Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [for (final c in children) SizedBox(width: width, child: c)],
        );
      },
    );
  }
}
