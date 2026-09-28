import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../l10n/gen/app_localizations.dart';

/// Persistent shell: Home · Compete · Rankings · Play · Profile. Bottom
/// navigation on phones, a navigation rail on tablets. Each tab keeps its own
/// stack (go_router [StatefulShellRoute]).
class MainShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({super.key, required this.navigationShell});

  void _go(int index) => navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = [
      (Icons.home_outlined, Icons.home_rounded, l10n.navHome),
      (Icons.emoji_events_outlined, Icons.emoji_events_rounded, l10n.navCompete),
      (Icons.leaderboard_outlined, Icons.leaderboard_rounded, l10n.navRankings),
      (Icons.sports_tennis_outlined, Icons.sports_tennis_rounded, l10n.navPlay),
      (Icons.person_outline_rounded, Icons.person_rounded, l10n.navProfile),
    ];

    if (context.isTablet) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: _go,
              labelType: NavigationRailLabelType.all,
              leading: const Padding(
                padding: EdgeInsetsDirectional.symmetric(vertical: AppSpacing.lg),
                child: AppLogo(height: 40),
              ),
              destinations: [
                for (final (icon, selected, label) in items)
                  NavigationRailDestination(icon: Icon(icon), selectedIcon: Icon(selected), label: Text(label)),
              ],
            ),
            VerticalDivider(width: 1, color: context.tokens.outline),
            Expanded(child: navigationShell),
          ],
        ),
      );
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: DecoratedBox(
        decoration: BoxDecoration(border: Border(top: BorderSide(color: context.tokens.outline))),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _go,
          destinations: [
            for (final (icon, selected, label) in items)
              NavigationDestination(icon: Icon(icon), selectedIcon: Icon(selected), label: label),
          ],
        ),
      ),
    );
  }
}
