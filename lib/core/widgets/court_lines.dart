import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Subtle padel-court line texture for hero areas (outer box, service
/// lines, center line, net). Purely decorative.
class CourtLinesBackground extends StatelessWidget {
  final Widget? child;
  final Color color;
  final double opacity;

  const CourtLinesBackground({super.key, this.child, this.color = AppColors.white, this.opacity = 0.07});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CourtLinesPainter(color.withValues(alpha: opacity)),
      child: child,
    );
  }
}

class _CourtLinesPainter extends CustomPainter {
  final Color color;

  _CourtLinesPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    // A court rotated to lie across the hero, anchored to the trailing side.
    final w = size.width;
    final h = size.height;
    final court = Rect.fromLTWH(w * 0.38, -h * 0.1, w * 0.78, h * 1.2);
    canvas.drawRect(court, paint);
    final netX = court.left + court.width / 2;
    canvas.drawLine(Offset(netX, court.top), Offset(netX, court.bottom), paint..strokeWidth = 2.5);
    paint.strokeWidth = 1.5;
    final serviceOffset = court.width * 0.34;
    canvas.drawLine(Offset(netX - serviceOffset, court.top), Offset(netX - serviceOffset, court.bottom), paint);
    canvas.drawLine(Offset(netX + serviceOffset, court.top), Offset(netX + serviceOffset, court.bottom), paint);
    final midY = court.top + court.height / 2;
    canvas.drawLine(Offset(netX - serviceOffset, midY), Offset(netX + serviceOffset, midY), paint);
  }

  @override
  bool shouldRepaint(covariant _CourtLinesPainter old) => old.color != color;
}
