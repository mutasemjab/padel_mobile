import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_tokens.dart';

/// Level → accent color, used by avatar rings and level chips.
class LevelColors {
  const LevelColors._();

  static Color of(String level) => switch (level) {
    'Elite' => AppColors.accent,
    'A+' || 'A' => AppColors.primary,
    'B+' || 'B' => AppColors.info,
    'C+' => AppColors.clay,
    _ => AppColors.textMuted,
  };
}

/// Compact level chip ("B+"). Level codes are identical in every language.
class LevelBadge extends StatelessWidget {
  final String? level;
  final bool large;

  const LevelBadge({super.key, required this.level, this.large = false});

  @override
  Widget build(BuildContext context) {
    if (level == null || level!.isEmpty) return const SizedBox.shrink();
    final color = LevelColors.of(level!);
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: large ? AppSpacing.md : AppSpacing.sm,
        vertical: large ? AppSpacing.xs : AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.14),
        borderRadius: AppRadius.pillAll,
        border: Border.all(color: color.withValues(alpha: 0.55)),
      ),
      child: Text(
        level!,
        style: AppTypography.number(
          context,
          size: large ? 18 : 13,
          weight: FontWeight.w800,
          color: context.tokens.isDark ? color : Color.lerp(color, AppColors.lightTextPrimary, 0.35),
        ),
      ),
    );
  }
}
