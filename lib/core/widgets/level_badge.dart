import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_tokens.dart';

/// Level → metal, used by avatar rings and level chips: bronze for C,
/// silver for B, gold for A and the ball's lime for Elite — the same three
/// grades as the titles.
class LevelColors {
  const LevelColors._();

  static Color of(String level) => switch (level) {
    'Elite' => AppColors.accent,
    'A+' || 'A' => AppColors.gold,
    'B+' || 'B' => AppColors.medalSilver,
    'C+' || 'C' => AppColors.medalBronze,
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
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.22), color.withValues(alpha: 0.08)],
        ),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.5)),
      ),
      child: Text(
        level!,
        style: AppTypography.number(
          context,
          size: large ? 18 : 13,
          weight: FontWeight.w700,
          color: context.tokens.isDark ? Color.lerp(color, AppColors.white, .15) : Color.lerp(color, AppColors.lightTextPrimary, 0.45),
        ),
      ),
    );
  }
}
