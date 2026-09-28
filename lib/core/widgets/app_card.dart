import 'package:flutter/material.dart';

import '../theme/app_effects.dart';
import '../theme/app_spacing.dart';
import '../theme/app_tokens.dart';

/// The one card surface used across the app. Supports a gradient fill, a
/// highlight glow for "your" things, and an ink ripple when tappable.
class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Gradient? gradient;
  final Color? color;
  final Color? borderColor;
  final List<BoxShadow>? shadows;
  final BorderRadius borderRadius;
  final bool elevated;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = AppSpacing.card,
    this.gradient,
    this.color,
    this.borderColor,
    this.shadows,
    this.borderRadius = AppRadius.lgAll,
    this.elevated = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: gradient == null ? (color ?? t.surface) : null,
        gradient: gradient,
        borderRadius: borderRadius,
        border: Border.all(color: borderColor ?? t.outline),
        boxShadow: shadows ?? (elevated ? AppShadows.soft : null),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}
