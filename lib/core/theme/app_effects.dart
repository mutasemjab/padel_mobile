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
    colors: [Color(0xFF6FB3E8), Color(0xFF2E6A99)],
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
    return ui.Gradient.linear(rect.center - d * half, rect.center + d * half, colors, stops);
  }
}
