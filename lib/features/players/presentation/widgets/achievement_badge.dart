import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/progress_ring.dart';
import '../../domain/entities/achievement.dart';

/// The three title grades (same family as Playmaker football): the frame's
/// metal. Read from the backend rarity — common and rare are bronze, epic
/// silver, legendary gold — so nothing new is asked of the API.
enum TitleGrade {
  bronze,
  silver,
  gold;

  static TitleGrade of(AchievementRarity rarity) => switch (rarity) {
    AchievementRarity.common || AchievementRarity.rare => TitleGrade.bronze,
    AchievementRarity.epic => TitleGrade.silver,
    AchievementRarity.legendary => TitleGrade.gold,
  };

  List<Color> get metal => switch (this) {
    TitleGrade.bronze => AppMetals.bronze,
    TitleGrade.silver => AppMetals.silver,
    TitleGrade.gold => AppMetals.gold,
  };
}

/// Bundled title artwork (one illustration per achievement `code`, framed by
/// the grade's ring). A code joins [codes] once its art is in
/// `assets/titles/`; until then the badge draws its own frame and glyph.
class TitleArt {
  const TitleArt._();

  static const Set<String> codes = {};
  static const bool frames = false;

  static String art(String code) => 'assets/titles/$code.webp';
  static String frame(TitleGrade grade) => 'assets/titles/frame-${grade.name}.webp';
  static const premiumFrame = 'assets/titles/frame-premium.webp';
}

/// Collectible title badge. A server icon wins, then bundled art, then the
/// drawn medal. Premium identity uses a diamond so it never reads as a
/// competitive title. Locked titles are desaturated with a progress ring
/// when progress is known.
class AchievementBadge extends StatelessWidget {
  final Achievement achievement;
  final double size;
  final bool showLabel;
  final VoidCallback? onTap;

  const AchievementBadge({
    super.key,
    required this.achievement,
    this.size = 64,
    this.showLabel = true,
    this.onTap,
  });

  /// The grade's middle metal, for glows and labels around the badge.
  static Color rarityColor(BuildContext context, AchievementRarity rarity) => TitleGrade.of(rarity).metal[1];

  @override
  Widget build(BuildContext context) {
    final unlocked = achievement.isUnlocked;
    final badge = achievement.isPremium
        ? _PremiumDiamond(achievement: achievement, size: size)
        : _TitleMedal(achievement: achievement, size: size);

    Widget visual = unlocked
        ? badge
        : Stack(
            alignment: Alignment.center,
            children: [
              Opacity(opacity: 0.4, child: ColorFiltered(colorFilter: _greyscale, child: badge)),
              if (achievement.progress != null)
                ProgressRing(
                  value: achievement.progress!.ratio,
                  size: size + 8,
                  stroke: 3,
                  color: context.tokens.isDark ? AppColors.goldSoft : AppColors.green700,
                )
              else
                Container(
                  width: size * .34,
                  height: size * .34,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: context.tokens.isDark ? const Color(0xCC041C16) : AppColors.ivory,
                    border: Border.all(color: context.tokens.isDark ? AppColors.cream15 : AppColors.lightOutline),
                  ),
                  child: Icon(Icons.lock_rounded, size: size * 0.17, color: context.tokens.textMuted),
                ),
            ],
          );

    visual = SizedBox(width: size + 8, height: size + 8, child: Center(child: visual));

    return Semantics(
      label: achievement.name,
      button: onTap != null,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.mdAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            visual,
            if (showLabel) ...[
              Gap.xs,
              SizedBox(
                width: size + 20,
                child: Text(
                  achievement.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.labelSmall?.copyWith(
                    color: unlocked ? context.tokens.textPrimary : context.tokens.textMuted,
                    letterSpacing: 0,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  static const ColorFilter _greyscale = ColorFilter.matrix(<double>[
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0, //
    0, 0, 0, 1, 0,
  ]);
}

/// A title in its grade's frame: bundled art when we have it, otherwise the
/// drawn medal (metal ring, court-green well, the title's glyph).
class _TitleMedal extends StatelessWidget {
  final Achievement achievement;
  final double size;

  const _TitleMedal({required this.achievement, required this.size});

  @override
  Widget build(BuildContext context) {
    final grade = TitleGrade.of(achievement.rarity);
    final glow = achievement.isUnlocked
        ? [BoxShadow(color: grade.metal[1].withValues(alpha: grade == TitleGrade.gold ? .5 : .32), blurRadius: size * .4, spreadRadius: -size * .08)]
        : null;
    final drawn = CustomPaint(
      painter: _MedalPainter(grade),
      child: Center(child: _Glyph(achievement: achievement, grade: grade, size: size)),
    );
    final hasArt = TitleArt.codes.contains(achievement.code);

    Widget inner;
    if (achievement.iconUrl != null) {
      inner = Stack(
        fit: StackFit.expand,
        children: [
          CustomPaint(painter: _MedalPainter(grade)),
          Padding(
            padding: EdgeInsets.all(size * .19),
            child: ClipOval(child: AppNetworkImage(url: achievement.iconUrl, fallback: _Glyph(achievement: achievement, grade: grade, size: size))),
          ),
        ],
      );
    } else if (hasArt) {
      inner = Stack(
        fit: StackFit.expand,
        children: [
          if (TitleArt.frames)
            Image.asset(TitleArt.frame(grade), fit: BoxFit.contain, errorBuilder: (_, _, _) => CustomPaint(painter: _MedalPainter(grade)))
          else
            CustomPaint(painter: _MedalPainter(grade)),
          Padding(
            padding: EdgeInsets.all(size * .2),
            child: Image.asset(TitleArt.art(achievement.code), fit: BoxFit.contain, errorBuilder: (_, _, _) => const SizedBox.shrink()),
          ),
        ],
      );
    } else {
      inner = drawn;
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: glow),
      child: inner,
    );
  }
}

/// Glyph for a title without artwork — the idea of each title in one icon,
/// cast in the grade's metal. "First in level" titles carry the level.
class _Glyph extends StatelessWidget {
  final Achievement achievement;
  final TitleGrade grade;
  final double size;

  const _Glyph({required this.achievement, required this.grade, required this.size});

  static IconData iconFor(Achievement a) => switch (a.code) {
    'first_official_match' => Icons.sports_tennis_rounded,
    'matches_25' => Icons.layers_rounded,
    'tournament_champion' => Icons.emoji_events_rounded,
    'triple_champion' => Icons.military_tech_rounded,
    'win_streak_5' => Icons.local_fire_department_rounded,
    'win_streak_10' => Icons.bolt_rounded,
    'giant_killer' => Icons.castle_rounded,
    'fastest_rising' => Icons.rocket_launch_rounded,
    'perfect_duo' => Icons.handshake_rounded,
    'tournament_mvp' => Icons.star_rounded,
    'elite_member' => Icons.verified_rounded,
    _ when a.code.startsWith('number_one_') => Icons.workspace_premium_rounded,
    _ => a.category == AchievementCategory.social ? Icons.handshake_rounded : Icons.emoji_events_rounded,
  };

  /// `number_one_b_plus` → `B+`.
  static String? levelOf(String code) {
    if (!code.startsWith('number_one_')) return null;
    final raw = code.substring('number_one_'.length);
    final plus = raw.endsWith('_plus');
    final base = (plus ? raw.substring(0, raw.length - 5) : raw).toUpperCase();
    return plus ? '$base+' : base;
  }

  @override
  Widget build(BuildContext context) {
    final level = levelOf(achievement.code);
    final metal = ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (r) => LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: grade.metal,
        stops: const [0, .55, 1],
      ).createShader(r),
      child: level == null
          ? Icon(iconFor(achievement), size: size * .4, color: AppColors.white)
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.workspace_premium_rounded, size: size * .26, color: AppColors.white),
                Text(level, style: AppFonts.numeral(size: size * .2, weight: FontWeight.w700, height: 1, color: AppColors.white)),
              ],
            ),
    );
    return metal;
  }
}

/// The drawn frame: a brushed-metal ring around a court-green well. Silver
/// adds a notched edge, gold a laurel and emerald studs — the three grades
/// read apart even at 48px.
class _MedalPainter extends CustomPainter {
  final TitleGrade grade;

  _MedalPainter(this.grade);

  @override
  void paint(Canvas canvas, Size size) {
    final c = size.center(Offset.zero);
    final r = size.shortestSide / 2;
    final m = grade.metal;
    final ringRect = Rect.fromCircle(center: c, radius: r);

    if (grade == TitleGrade.gold) _laurel(canvas, c, r, m);

    final ringR = grade == TitleGrade.gold ? r * .84 : r * .92;
    final ring = Paint()
      ..shader = SweepGradient(
        colors: [m[0], m[1], m[2], m[1], m[0], m[1], m[2], m[1], m[0]],
        transform: const GradientRotation(-math.pi / 3),
      ).createShader(ringRect);
    canvas.drawCircle(c, ringR, ring);

    if (grade == TitleGrade.silver) {
      final notch = Paint()..color = m[2].withValues(alpha: .6);
      for (var i = 0; i < 24; i++) {
        final a = i * math.pi / 12;
        canvas.drawCircle(c + Offset(math.cos(a), math.sin(a)) * ringR * .93, ringR * .035, notch);
      }
    }
    if (grade == TitleGrade.bronze) {
      final rivet = Paint()..color = m[0].withValues(alpha: .8);
      for (var i = 0; i < 8; i++) {
        final a = i * math.pi / 4 + math.pi / 8;
        canvas.drawCircle(c + Offset(math.cos(a), math.sin(a)) * ringR * .9, ringR * .045, rivet);
      }
    }

    // bevel + the court-green well
    final wellR = ringR * .78;
    canvas.drawCircle(c, wellR + ringR * .04, Paint()..color = const Color(0xFF041C16));
    canvas.drawCircle(
      c,
      wellR,
      Paint()
        ..shader = const RadialGradient(
          center: Alignment(0, -.5),
          colors: [AppColors.green600, AppColors.green800, AppColors.green950],
          stops: [0, .6, 1],
        ).createShader(Rect.fromCircle(center: c, radius: wellR)),
    );
    // top highlight on the ring
    canvas.drawArc(
      Rect.fromCircle(center: c, radius: ringR * .96),
      -math.pi * .85,
      math.pi * .7,
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = ringR * .05
        ..strokeCap = StrokeCap.round
        ..color = AppColors.white.withValues(alpha: .35),
    );

    if (grade == TitleGrade.gold) {
      final gem = Paint()..color = const Color(0xFF2FBF7F);
      for (final a in [-math.pi / 2, math.pi / 6, math.pi * 5 / 6]) {
        final p = c + Offset(math.cos(a), math.sin(a)) * ringR * .89;
        canvas
          ..drawCircle(p, ringR * .075, Paint()..color = m[2])
          ..drawCircle(p, ringR * .055, gem);
      }
    }
  }

  void _laurel(Canvas canvas, Offset c, double r, List<Color> m) {
    final leaf = Paint()..color = m[1];
    final leafDark = Paint()..color = m[2];
    for (final side in [-1.0, 1.0]) {
      for (var i = 0; i < 6; i++) {
        final a = math.pi / 2 + side * (math.pi * .18 + i * math.pi * .12);
        final p = c + Offset(math.cos(a), math.sin(a)) * r * .9;
        canvas
          ..save()
          ..translate(p.dx, p.dy)
          ..rotate(a + side * math.pi / 2.6)
          ..drawOval(Rect.fromCenter(center: Offset.zero, width: r * .2, height: r * .09), i.isEven ? leaf : leafDark)
          ..restore();
      }
    }
  }

  @override
  bool shouldRepaint(_MedalPainter old) => old.grade != grade;
}

/// Premium identity: a gold diamond — visibly a different family from titles.
class _PremiumDiamond extends StatelessWidget {
  final Achievement achievement;
  final double size;

  const _PremiumDiamond({required this.achievement, required this.size});

  @override
  Widget build(BuildContext context) {
    final inner = size * 0.72;
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 4,
          child: Container(
            width: inner,
            height: inner,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFFF6DA), AppColors.goldSoft, AppColors.gold],
              ),
              borderRadius: BorderRadius.circular(size * .16),
              border: Border.all(color: const Color(0xFFFFFBEF), width: 1.2),
              boxShadow: achievement.isUnlocked ? AppShadows.gold : null,
            ),
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Center(
                child: achievement.iconUrl == null
                    ? (TitleArt.codes.contains(achievement.code)
                          ? Image.asset(TitleArt.art(achievement.code), width: inner * .78, errorBuilder: (_, _, _) => _diamond(inner))
                          : _diamond(inner))
                    : ClipOval(
                        child: SizedBox(
                          width: inner * 0.6,
                          height: inner * 0.6,
                          child: AppNetworkImage(url: achievement.iconUrl),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _diamond(double inner) => Icon(Icons.diamond_rounded, color: AppColors.onPremium, size: inner * 0.5);
}
