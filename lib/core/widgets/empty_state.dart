import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
    final color = accent ?? t.highlight;
    final illustration = SizedBox(
      width: compact ? 64 : 104,
      height: compact ? 64 : 104,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [color.withValues(alpha: 0.22), color.withValues(alpha: 0)]),
            ),
          ),
          Container(
            width: compact ? 44 : 68,
            height: compact ? 44 : 68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: t.surface2,
              border: Border.all(color: color.withValues(alpha: 0.5), width: 1.5),
            ),
            child: Icon(icon, size: compact ? AppSizes.iconMd : AppSizes.iconXl, color: color),
          ),
        ],
      ),
    );

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        context.reduceMotion ? illustration : illustration.animate().scale(duration: 300.ms, curve: Curves.easeOutBack),
        compact ? Gap.md : Gap.xl,
        Text(title, style: compact ? context.text.titleSmall : context.text.titleMedium, textAlign: TextAlign.center),
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
