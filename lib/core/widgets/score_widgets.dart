import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_tokens.dart';

/// One completed set as a compact "6 / 4" chip; the side that won the set
/// is emphasised. [animateIn] slides it in when a set just finished.
class SetChip extends StatelessWidget {
  final int own;
  final int other;
  final bool compact;
  final bool animateIn;

  const SetChip({super.key, required this.own, required this.other, this.compact = false, this.animateIn = false});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final won = own > other;
    final chip = Container(
      width: compact ? 22 : 30,
      padding: EdgeInsetsDirectional.symmetric(vertical: compact ? AppSpacing.xxs : AppSpacing.xs),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: won ? (t.isDark ? AppColors.cream08 : t.surface2) : AppColors.transparent,
        borderRadius: AppRadius.smAll,
      ),
      child: Text(
        '$own',
        style: AppTypography.number(
          context,
          size: compact ? 17 : 21,
          weight: FontWeight.w500,
          color: won ? t.textPrimary : t.textMuted.withValues(alpha: t.isDark ? .55 : .8),
        ),
      ),
    );
    if (!animateIn || context.reduceMotion) return chip;
    return chip.animate().slideX(begin: 0.6, end: 0, duration: 250.ms, curve: Curves.easeOut).fadeIn(duration: 250.ms);
  }
}

/// A score value that flips (slides up + fades) whenever [value] changes.
class FlipDigit extends StatelessWidget {
  final String value;
  final TextStyle style;

  const FlipDigit({super.key, required this.value, required this.style});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: context.reduceMotion ? Duration.zero : const Duration(milliseconds: 220),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        final incoming = child.key == ValueKey(value);
        final offset = Tween<Offset>(begin: Offset(0, incoming ? 0.5 : -0.5), end: Offset.zero).animate(animation);
        return ClipRect(
          child: SlideTransition(
            position: offset,
            child: FadeTransition(opacity: animation, child: child),
          ),
        );
      },
      child: Text(value, key: ValueKey(value), style: style),
    );
  }
}

/// Briefly pulses its child when [trigger] changes (games counter pulse).
class PulseOnChange extends StatelessWidget {
  final Object trigger;
  final Widget child;

  const PulseOnChange({super.key, required this.trigger, required this.child});

  @override
  Widget build(BuildContext context) {
    if (context.reduceMotion) return child;
    return child
        .animate(key: ValueKey(trigger))
        .scaleXY(begin: 1.25, end: 1, duration: 320.ms, curve: Curves.easeOutBack)
        .tint(color: AppColors.accent, begin: 0.35, end: 0, duration: 400.ms);
  }
}
