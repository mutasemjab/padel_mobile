import 'package:flutter/material.dart';

import '../models/player_summary.dart';
import '../theme/app_colors.dart';
import '../theme/app_effects.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_tokens.dart';
import 'app_network_image.dart';
import 'level_badge.dart';

/// Photo (or initials) with a level-colored ring and, for Premium players, a
/// gold halo. Wrap in a Hero via [heroTag] for avatar → profile transitions.
class PlayerAvatar extends StatelessWidget {
  final String name;
  final String? photoUrl;
  final String? level;
  final bool isPremium;
  final double size;
  final String? heroTag;
  final bool showRing;

  const PlayerAvatar({
    super.key,
    required this.name,
    this.photoUrl,
    this.level,
    this.isPremium = false,
    this.size = AppSizes.avatarMd,
    this.heroTag,
    this.showRing = true,
  });

  factory PlayerAvatar.fromSummary(PlayerSummary player, {double size = AppSizes.avatarMd, bool hero = false}) =>
      PlayerAvatar(
        name: player.name,
        photoUrl: player.photoUrl,
        level: player.level,
        isPremium: player.isPremium,
        size: size,
        heroTag: hero ? 'player-avatar-${player.playerId}' : null,
      );

  String get _initials {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    String first(String s) => String.fromCharCode(s.runes.first).toUpperCase();
    return parts.length == 1 ? first(parts.first) : '${first(parts.first)}${first(parts.last)}';
  }

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final ringWidth = size >= AppSizes.avatarLg ? AppSizes.ringStroke + 1 : AppSizes.ringStroke - 1;
    final ringColor = showRing && level != null ? LevelColors.of(level!) : t.outline;

    Widget avatar = Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(showRing ? ringWidth : 0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isPremium
            ? AppGradients.premium
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.lerp(ringColor, AppColors.white, .25)!, ringColor],
              ),
        boxShadow: isPremium && size >= AppSizes.avatarLg ? AppShadows.gold : null,
      ),
      child: Container(
        // the court-green gap between ring and face (`0 0 0 2px var(--green-800)`)
        padding: EdgeInsets.all(showRing ? (size >= AppSizes.avatarLg ? 2.5 : 1.5) : 0),
        decoration: BoxDecoration(shape: BoxShape.circle, color: t.isDark ? AppColors.green800 : AppColors.ivory),
        child: ClipOval(
          child: AppNetworkImage(
            url: photoUrl,
            fallback: DecoratedBox(
              decoration: BoxDecoration(
                gradient: t.isDark
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.green600, AppColors.green700],
                      )
                    : const LinearGradient(colors: [AppColors.lightSurface2, AppColors.lightSurface2]),
              ),
              child: Center(
                child: Text(
                  _initials,
                  style: AppFonts.display(size: size * 0.36, height: 1, color: t.isDark ? AppColors.cream : AppColors.green800),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (heroTag != null) avatar = Hero(tag: heroTag!, child: avatar);
    return Semantics(label: name, image: true, child: avatar);
  }
}

/// Small circular badge used in avatar stacks (team of two).
class AvatarPair extends StatelessWidget {
  final List<PlayerSummary> players;
  final double size;

  const AvatarPair({super.key, required this.players, this.size = AppSizes.avatarSm});

  @override
  Widget build(BuildContext context) {
    if (players.isEmpty) {
      return SizedBox(
        width: size,
        height: size,
        child: CircleAvatar(
          backgroundColor: context.tokens.isDark ? AppColors.cream08 : context.tokens.surface2,
          child: Icon(Icons.groups_rounded, size: size * .5, color: context.tokens.textMuted),
        ),
      );
    }
    final shown = players.take(2).toList();
    final overlap = size * 0.62;
    return SizedBox(
      width: size + overlap * (shown.length - 1),
      height: size,
      child: Stack(
        children: [
          for (var i = 0; i < shown.length; i++)
            PositionedDirectional(
              start: i * overlap,
              child: PlayerAvatar.fromSummary(shown[i], size: size),
            ),
        ],
      ),
    );
  }
}

/// Keeps a readable foreground on top of any level color.
Color onLevelColor(Color background) => background.computeLuminance() > 0.45 ? AppColors.onAccent : AppColors.white;
