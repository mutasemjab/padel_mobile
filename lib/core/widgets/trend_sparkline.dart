import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Tiny line chart of a metric's recent values. Draws nothing for fewer than
/// two points (a single dot is not a trend).
class TrendSparkline extends StatelessWidget {
  final List<num> values;
  final Color? color;
  final double width;
  final double height;

  /// For position trends lower is better, so the line is flipped.
  final bool invert;

  const TrendSparkline({
    super.key,
    required this.values,
    this.color,
    this.width = AppSizes.sparklineWidth,
    this.height = AppSizes.sparklineHeight,
    this.invert = false,
  });

  @override
  Widget build(BuildContext context) {
    if (values.length < 2) return SizedBox(width: width, height: height);
    final rising = invert ? values.last < values.first : values.last >= values.first;
    final lineColor = color ?? (rising ? AppColors.success : AppColors.danger);
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(painter: _SparklinePainter(values, lineColor, invert)),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  final List<num> values;
  final Color color;
  final bool invert;

  _SparklinePainter(this.values, this.color, this.invert);

  @override
  void paint(Canvas canvas, Size size) {
    final minV = values.reduce((a, b) => a < b ? a : b).toDouble();
    final maxV = values.reduce((a, b) => a > b ? a : b).toDouble();
    final range = (maxV - minV).abs() < 1e-9 ? 1.0 : maxV - minV;
    final dx = size.width / (values.length - 1);

    Offset point(int i) {
      var norm = (values[i] - minV) / range;
      if (invert) norm = 1 - norm;
      return Offset(i * dx, size.height - norm * (size.height - 4) - 2);
    }

    final path = Path()..moveTo(point(0).dx, point(0).dy);
    for (var i = 1; i < values.length; i++) {
      final p = point(i);
      path.lineTo(p.dx, p.dy);
    }

    final fill = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.28), color.withValues(alpha: 0)],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      path,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
    canvas.drawCircle(point(values.length - 1), 2.5, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter old) =>
      old.values != values || old.color != color || old.invert != invert;
}
