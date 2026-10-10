import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
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
      bottomNavigationBar: _FloatingNav(
        items: items,
        selectedIndex: navigationShell.currentIndex,
        onSelected: _go,
      ),
    );
  }
}

/// The home design's floating glass dock: frosted pill, gold hairline, and
/// the active tab lifted into a gold-leaf chip with the ball-lime glow.
class _FloatingNav extends StatelessWidget {
  final List<(IconData, IconData, String)> items;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _FloatingNav({required this.items, required this.selectedIndex, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final bottom = MediaQuery.paddingOf(context).bottom;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(AppSpacing.md, AppSpacing.xs, AppSpacing.md, bottom > 0 ? bottom : AppSpacing.md),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          gradient: t.isDark
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xF00F4A3C), Color(0xF5062820)],
                )
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.ivory, Color(0xFFF6F0E0)],
                ),
          border: Border.all(color: t.isDark ? AppGlass.hairlineStrong : AppColors.lightOutline),
          boxShadow: [
            BoxShadow(
              color: t.isDark ? const Color(0xB3000000) : const Color(0x293A3320),
              blurRadius: 40,
              offset: const Offset(0, 18),
              spreadRadius: -14,
            ),
          ],
        ),
        child: SizedBox(
          height: 68,
          child: Row(
            children: [
              for (var i = 0; i < items.length; i++)
                Expanded(
                  child: _NavItem(
                    icon: items[i].$1,
                    selectedIcon: items[i].$2,
                    label: items[i].$3,
                    selected: i == selectedIndex,
                    onTap: () => onSelected(i),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final duration = AppMotion.of(context, const Duration(milliseconds: 380));
    final ink = t.isDark ? AppColors.green900 : AppColors.cream;
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      excludeSemantics: true,
      child: InkResponse(
        onTap: onTap,
        radius: 34,
        highlightColor: AppColors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: duration,
              curve: AppMotion.ease,
              width: selected ? 52 : 40,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: selected
                    ? (t.isDark
                          ? AppGradients.goldButton
                          : const CssLinearGradient(145, colors: [AppColors.green700, AppColors.green900]))
                    : null,
                boxShadow: selected ? (t.isDark ? AppShadows.goldButton : AppShadows.greenButton) : null,
              ),
              child: Icon(
                selected ? selectedIcon : icon,
                size: 21,
                color: selected ? ink : (t.isDark ? AppColors.cream40 : AppColors.lightTextMuted),
              ),
            ),
            const SizedBox(height: 5),
            AnimatedDefaultTextStyle(
              duration: duration,
              style: context.text.labelSmall!.copyWith(
                fontSize: 11,
                letterSpacing: 0,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                color: selected
                    ? (t.isDark ? AppColors.goldSoft : AppColors.green800)
                    : (t.isDark ? AppColors.cream40 : AppColors.lightTextMuted),
              ),
              child: Text(label, maxLines: 1, overflow: TextOverflow.fade, softWrap: false),
            ),
          ],
        ),
      ),
    );
  }
}
