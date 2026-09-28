import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';

/// Circular progress arc around an optional [child] (achievement progress,
/// coverage, spots filled).
class ProgressRing extends StatelessWidget {
  final double value;
  final double size;
  final double stroke;
  final Color? color;
  final Widget? child;

  const ProgressRing({super.key, required this.value, this.size = 56, this.stroke = 4, this.color, this.child});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return SizedBox(
      width: size,
      height: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: value.clamp(0, 1)),
        duration: context.reduceMotion ? Duration.zero : const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
        builder: (context, v, child) =>
            CustomPaint(painter: _RingPainter(v, color ?? t.highlight, t.surface2, stroke), child: child),
        child: Center(child: child),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double value;
  final Color color;
  final Color track;
  final double stroke;

  _RingPainter(this.value, this.color, this.track, this.stroke);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final deflated = rect.deflate(stroke / 2);
    canvas.drawArc(
      deflated,
      0,
      math.pi * 2,
      false,
      Paint()
        ..color = track
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke,
    );
    if (value <= 0) return;
    canvas.drawArc(
      deflated,
      -math.pi / 2,
      math.pi * 2 * value,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter old) =>
      old.value != value || old.color != color || old.track != track || old.stroke != stroke;
}
