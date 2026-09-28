import 'package:flutter/material.dart';

import '../../domain/entities/match.dart';
import 'live_match_card.dart';

/// Compact row for a match in a live/schedule list — kept for existing call
/// sites; renders the shared [LiveMatchCard].
class MatchSummaryRow extends StatelessWidget {
  final Match match;
  final VoidCallback onTap;

  const MatchSummaryRow({super.key, required this.match, required this.onTap});

  @override
  Widget build(BuildContext context) => LiveMatchCard(match: match, onTap: onTap);
}
