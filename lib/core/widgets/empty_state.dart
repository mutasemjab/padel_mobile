import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_tokens.dart';

/// Illustrated state with an optional call-to-action. Used for empty lists
/// and as the base of the insufficient-data / coming-soon / premium states.
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? ctaLabel;
  final VoidCallback? onCta;
  final Color? accent;
  final Widget? footer;
  final bool compact;

  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.ctaLabel,
    this.onCta,
    this.accent,
    this.footer,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final color = accent ?? (t.isDark ? AppColors.goldSoft : AppColors.green700);
    final box = compact ? 64.0 : 112.0;
    final disc = compact ? 46.0 : 76.0;
    // A frosted medallion over a soft glow, ringed like the login emblem.
    final illustration = SizedBox(
      width: box,
      height: box,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [color.withValues(alpha: 0.24), color.withValues(alpha: 0)]),
            ),
          ),
          Container(
            width: disc + 14,
            height: disc + 14,
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: color.withValues(alpha: .14))),
          ),
          Container(
            width: disc,
            height: disc,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: t.isDark
                  ? const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.green600, AppColors.green800],
                    )
                  : const LinearGradient(colors: [AppColors.ivory, AppColors.lightSurface2]),
              border: Border.all(color: color.withValues(alpha: 0.5)),
              boxShadow: [BoxShadow(color: color.withValues(alpha: .25), blurRadius: 24, spreadRadius: -6)],
            ),
            child: Icon(icon, size: compact ? AppSizes.iconMd : 30, color: color),
          ),
        ],
      ),
    );

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        context.reduceMotion ? illustration : illustration.animate().scale(duration: 300.ms, curve: Curves.easeOutBack),
        compact ? Gap.md : Gap.xl,
        Text(
          title,
          style: compact ? context.text.titleSmall : context.text.headlineMedium?.copyWith(fontSize: 23),
          textAlign: TextAlign.center,
        ),
        Gap.sm,
        Text(message, style: context.text.bodySmall, textAlign: TextAlign.center),
        if (ctaLabel != null && onCta != null) ...[
          compact ? Gap.md : Gap.xl,
          FilledButton(onPressed: onCta, child: Text(ctaLabel!)),
        ],
        if (footer != null) ...[Gap.md, footer!],
      ],
    );

    if (compact) {
      return Padding(padding: const EdgeInsetsDirectional.all(AppSpacing.lg), child: content);
    }
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.all(AppSpacing.xxxl),
        child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 420), child: content),
      ).animate().fadeIn(duration: 250.ms),
    );
  }
}
