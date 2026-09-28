import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../domain/entities/category_detail.dart';
import '../../domain/entities/match.dart';
import 'live_match_card.dart';

/// Knockout bracket: a horizontal scroll of rounds (R32 → Final) with
/// connector lines. Each round's slots double in height so every match sits
/// centred between the two it's fed from. Mirrors automatically in RTL.
class BracketView extends StatelessWidget {
  final List<BracketRound> rounds;
  final void Function(Match match) onOpenMatch;

  const BracketView({super.key, required this.rounds, required this.onOpenMatch});

  static const double _cardWidth = 272;
  static const double _slotBase = 164;
  static const double _connectorWidth = 28;

  @override
  Widget build(BuildContext context) {
    if (rounds.isEmpty) return const SizedBox.shrink();
    final firstCount = rounds.first.matches.length.clamp(1, 1 << 10);
    final totalHeight = firstCount * _slotBase;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: AppSpacing.page,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var r = 0; r < rounds.length; r++) ...[
            _RoundColumn(
              round: rounds[r],
              slotHeight: totalHeight / rounds[r].matches.length.clamp(1, 1 << 10),
              width: _cardWidth,
              onOpenMatch: onOpenMatch,
            ),
            if (r < rounds.length - 1)
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 32),
                child: SizedBox(
                  width: _connectorWidth,
                  height: totalHeight,
                  child: CustomPaint(
                    painter: _ConnectorPainter(
                      fromCount: rounds[r].matches.length,
                      color: context.tokens.outline,
                      rtl: Directionality.of(context) == TextDirection.rtl,
                    ),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}

class _RoundColumn extends StatelessWidget {
  final BracketRound round;
  final double slotHeight;
  final double width;
  final void Function(Match match) onOpenMatch;

  const _RoundColumn({required this.round, required this.slotHeight, required this.width, required this.onOpenMatch});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 32,
            child: Text(round.roundLabel.toUpperCase(), style: AppTypography.eyebrow(context)),
          ),
          for (final match in round.matches)
            SizedBox(
              height: slotHeight,
              child: Center(child: LiveMatchCard(match: match, onTap: () => onOpenMatch(match))),
            ),
        ],
      ),
    );
  }
}

class _ConnectorPainter extends CustomPainter {
  final int fromCount;
  final Color color;
  final bool rtl;

  _ConnectorPainter({required this.fromCount, required this.color, required this.rtl});

  @override
  void paint(Canvas canvas, Size size) {
    if (fromCount < 2) return;
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    final slot = size.height / fromCount;
    double x(double v) => rtl ? size.width - v : v;
    final mid = size.width / 2;
    for (var i = 0; i + 1 < fromCount; i += 2) {
      final top = slot * i + slot / 2;
      final bottom = slot * (i + 1) + slot / 2;
      final join = (top + bottom) / 2;
      final path = Path()
        ..moveTo(x(0), top)
        ..lineTo(x(mid), top)
        ..lineTo(x(mid), bottom)
        ..lineTo(x(0), bottom)
        ..moveTo(x(mid), join)
        ..lineTo(x(size.width), join);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ConnectorPainter old) =>
      old.fromCount != fromCount || old.color != color || old.rtl != rtl;
}
