import 'package:flutter/material.dart';

import '../constants/app_durations.dart';
import '../theme/app_tokens.dart';

/// Counts up to [value] on first build and animates between changes.
/// Respects "reduce motion" by rendering the final value directly.
class AnimatedCounter extends StatelessWidget {
  final num value;
  final TextStyle style;
  final String Function(num value)? format;

  const AnimatedCounter({super.key, required this.value, required this.style, this.format});

  String _format(num v) => format?.call(v) ?? v.round().toString();

  @override
  Widget build(BuildContext context) {
    if (context.reduceMotion) return Text(_format(value), style: style);
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: value.toDouble()),
      duration: AppDurations.counter,
      curve: AppDurations.curve,
      builder: (context, v, _) => Text(_format(v), style: style),
    );
  }
}
