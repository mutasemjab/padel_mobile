import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  const AppShadows._();

  static const List<BoxShadow> soft = [BoxShadow(color: Color(0x40000000), blurRadius: 18, offset: Offset(0, 8))];

  static const List<BoxShadow> lifted = [BoxShadow(color: Color(0x59000000), blurRadius: 28, offset: Offset(0, 14))];

  /// Highlight glow for "your" things (your row, your latest achievement).
  static List<BoxShadow> glow(Color color, {double strength = 0.45}) => [
    BoxShadow(color: color.withValues(alpha: strength), blurRadius: 24, spreadRadius: 1),
  ];

  static final List<BoxShadow> volt = glow(AppColors.ball, strength: 0.35);
  static final List<BoxShadow> gold = glow(AppColors.gold, strength: 0.4);
  static final List<BoxShadow> live = glow(AppColors.live, strength: 0.4);

  /// Under gold CTAs: `0 14px 30px -12px rgba(201,168,106,.7)`.
  static const List<BoxShadow> goldButton = [
    BoxShadow(color: Color(0xB3C9A86A), offset: Offset(0, 14), blurRadius: 30, spreadRadius: -12),
  ];

  /// The light theme's court-green CTA glow.
  static const List<BoxShadow> greenButton = [
    BoxShadow(color: Color(0x660A3A2F), offset: Offset(0, 12), blurRadius: 24, spreadRadius: -12),
  ];
}

/// Motion language of the design.
class AppMotion {
  const AppMotion._();

  /// `cubic-bezier(.2,.8,.2,1)` — the signature ease-out.
  static const Curve ease = Cubic(.2, .8, .2, 1);

  /// CSS keyword curves, for 1:1 ports of the designer's animations.
  static const Curve cssEase = Cubic(.25, .1, .25, 1);
  static const Curve cssEaseOut = Cubic(0, 0, .58, 1);
  static const Curve cssEaseInOut = Cubic(.42, 0, .58, 1);

  /// Collapses durations when the OS asks for reduced motion (delays are
  /// kept, as in `prefers-reduced-motion`).
  static Duration of(BuildContext context, Duration d) =>
      (MediaQuery.maybeDisableAnimationsOf(context) ?? false) ? const Duration(microseconds: 10) : d;
}

class AppGradients {
  const AppGradients._();

  /// Screen-height court gradient (`#0a3a2f → #06261f 55% → #041c16`).
  static const LinearGradient screen = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.green800, AppColors.green900, AppColors.green950],
    stops: [0, .55, 1],
  );

  /// Hero court gradient used behind athlete cards and tournament heroes.
  static const LinearGradient court = LinearGradient(
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
    colors: [AppColors.green600, AppColors.green800, AppColors.green950],
    stops: [0, 0.55, 1],
  );

  static const LinearGradient courtLight = LinearGradient(
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
    colors: [AppColors.green700, AppColors.green800],
  );

  /// Gold CTA fill (`linear-gradient(145deg, #e3cc97, #c9a86a)`).
  static const Gradient goldButton = CssLinearGradient(145, colors: [AppColors.goldSoft, AppColors.gold]);

  /// Gold-leaf fill for the logo mark and the wordmark.
  static const List<Color> goldLeaf = [AppColors.ivory, AppColors.goldSoft, AppColors.gold];

  static const LinearGradient premium = LinearGradient(
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
    colors: [AppColors.goldSoft, AppColors.gold],
  );

  /// Dark gold-on-green surface for the Premium hub.
  static const LinearGradient premiumSurface = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF2B3A22), AppColors.green900, AppColors.background],
    stops: [0, 0.45, 1],
  );

  static const LinearGradient live = LinearGradient(colors: [AppColors.live, Color(0xFFFF8A65)]);

  static const LinearGradient clay = LinearGradient(
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
    colors: [Color(0xFFD9895A), Color(0xFF8E4A26)],
  );

  static const LinearGradient training = LinearGradient(
    begin: AlignmentDirectional.topStart,
    end: AlignmentDirectional.bottomEnd,
    colors: [AppColors.green600, AppColors.green900],
  );

  /// Bottom fade so text over hero images stays readable.
  static const LinearGradient imageScrim = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x00041C16), Color(0xD9041C16)],
  );
}

/// A CSS `linear-gradient(<angle>deg, …)` — unlike [LinearGradient] with
/// alignments, the gradient line length follows the CSS spec for any box
/// aspect ratio, so non-square boxes (buttons) match the designs.
class CssLinearGradient extends LinearGradient {
  final double angle;

  const CssLinearGradient(this.angle, {required super.colors, super.stops});

  @override
  Shader createShader(Rect rect, {TextDirection? textDirection}) {
    final r = angle * math.pi / 180;
    final d = Offset(math.sin(r), -math.cos(r));
    final half = (rect.width * d.dx.abs() + rect.height * d.dy.abs()) / 2;
    // CSS spreads stop-less colors evenly; dart:ui only accepts that for two.
    final even = stops ?? (colors.length > 2 ? [for (var i = 0; i < colors.length; i++) i / (colors.length - 1)] : null);
    return ui.Gradient.linear(rect.center - d * half, rect.center + d * half, colors, even);
  }
}

/// Glass surfaces from the login sheet and the home hero: a faint cream
/// wash, a gold hairline and a deep soft shadow on dark; ivory paper with a
/// sand hairline on light.
class AppGlass {
  const AppGlass._();

  /// Gold hairline used around glass on dark (`rgba(227,204,151,.16)`).
  static const Color hairline = Color(0x29E3CC97);

  /// Stronger gold edge for sheets, dialogs and heroes (`rgba(227,204,151,.22)`).
  static const Color hairlineStrong = Color(0x38E3CC97);

  static BoxDecoration card(
    bool dark, {
    BorderRadius radius = const BorderRadius.all(Radius.circular(22)),
    Color? border,
    bool raised = false,
  }) => BoxDecoration(
    borderRadius: radius,
    gradient: dark
        ? const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0x14F3EEDF), Color(0x08F3EEDF)],
          )
        : const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.ivory, Color(0xFFFBF6E8)],
          ),
    border: Border.all(color: border ?? (dark ? hairline : AppColors.lightOutline)),
    boxShadow: raised || !dark
        ? [
            BoxShadow(
              color: dark ? const Color(0x99000000) : const Color(0x1F3A3320),
              blurRadius: dark ? 40 : 24,
              offset: Offset(0, dark ? 20 : 10),
              spreadRadius: dark ? -20 : -12,
            ),
          ]
        : null,
  );

  /// The home hero's deep court panel (`linear-gradient(180deg,#0f4b3d,#0a3a2f 55%,#072c24)`).
  static BoxDecoration hero({BorderRadius radius = const BorderRadius.all(Radius.circular(30)), Color? border}) =>
      BoxDecoration(
        borderRadius: radius,
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0F4B3D), AppColors.green800, Color(0xFF072C24)],
          stops: [0, .55, 1],
        ),
        border: Border.all(color: border ?? const Color(0x2EE3CC97)),
        boxShadow: const [BoxShadow(color: Color(0xB3000000), blurRadius: 60, offset: Offset(0, 30), spreadRadius: -25)],
      );

  /// Sunken well inside a panel (`rgba(4,28,22,.5)` + cream-08 hairline).
  static BoxDecoration well(bool dark, {BorderRadius radius = const BorderRadius.all(Radius.circular(16))}) =>
      BoxDecoration(
        borderRadius: radius,
        color: dark ? const Color(0x80041C16) : AppColors.lightSurface2.withValues(alpha: .6),
        border: Border.all(color: dark ? AppColors.cream08 : AppColors.lightOutline.withValues(alpha: .7)),
      );

  /// Green aura glowing down from the top edge of a hero panel.
  static const RadialGradient aura = RadialGradient(
    center: Alignment(0, -1.1),
    radius: 1.1,
    colors: [Color(0xE61A6B56), Color(0x001A6B56)],
    stops: [0, .55],
  );
}

/// Brushed-metal fills for places and title grades (bronze · silver · gold).
class AppMetals {
  const AppMetals._();

  static const List<Color> gold = [Color(0xFFFFF6CF), Color(0xFFE9C46A), Color(0xFF94681C)];
  static const List<Color> silver = [Color(0xFFFFFFFF), Color(0xFFCFD6DD), Color(0xFF6F7B85)];
  static const List<Color> bronze = [Color(0xFFFFD9B3), Color(0xFFC7804A), Color(0xFF6E3B1C)];

  static List<Color>? forPlace(int? place) => switch (place) {
    1 => gold,
    2 => silver,
    3 => bronze,
    _ => null,
  };

  static LinearGradient fill(List<Color> c) =>
      LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: c, stops: const [0, .5, 1]);
}
