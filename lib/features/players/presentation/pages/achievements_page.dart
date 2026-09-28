import 'package:flutter/material.dart';

import '../../../../l10n/gen/app_localizations.dart';
import '../widgets/profile_tabs.dart';

/// Full collectible catalog for a player (progress rings, rarity, locked
/// state, separate Premium shelf).
class AchievementsPage extends StatelessWidget {
  final String playerId;

  const AchievementsPage({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).achievementsTitle)),
      body: ProfileAchievementsTab(playerId: playerId),
    );
  }
}
