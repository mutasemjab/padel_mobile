import 'package:flutter/widgets.dart';

/// 4-pt spacing scale. Use these instead of literal paddings/gaps.
class AppSpacing {
  const AppSpacing._();

  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double huge = 48;

  /// Horizontal page gutter used by every screen.
  static const double gutter = lg;

  static const EdgeInsetsDirectional page = EdgeInsetsDirectional.all(gutter);
  static const EdgeInsetsDirectional pageH = EdgeInsetsDirectional.symmetric(horizontal: gutter);
  static const EdgeInsetsDirectional card = EdgeInsetsDirectional.all(lg);
  static const EdgeInsetsDirectional cardDense = EdgeInsetsDirectional.all(md);

  /// Max content width on tablets so lines never stretch across a 12" screen.
  static const double maxContentWidth = 720;
  static const double tabletBreakpoint = 700;
}

/// Vertical/horizontal gap widgets — `Gap.md` reads better than `SizedBox(height: 12)`.
class Gap {
  const Gap._();

  static const SizedBox xxs = SizedBox(width: AppSpacing.xxs, height: AppSpacing.xxs);
  static const SizedBox xs = SizedBox(width: AppSpacing.xs, height: AppSpacing.xs);
  static const SizedBox sm = SizedBox(width: AppSpacing.sm, height: AppSpacing.sm);
  static const SizedBox md = SizedBox(width: AppSpacing.md, height: AppSpacing.md);
  static const SizedBox lg = SizedBox(width: AppSpacing.lg, height: AppSpacing.lg);
  static const SizedBox xl = SizedBox(width: AppSpacing.xl, height: AppSpacing.xl);
  static const SizedBox xxl = SizedBox(width: AppSpacing.xxl, height: AppSpacing.xxl);
  static const SizedBox xxxl = SizedBox(width: AppSpacing.xxxl, height: AppSpacing.xxxl);
  static const SizedBox huge = SizedBox(width: AppSpacing.huge, height: AppSpacing.huge);
}

class AppRadius {
  const AppRadius._();

  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;

  /// Buttons and input fields (the design's 18px controls).
  static const double control = 18;
  static const double pill = 999;

  static const BorderRadius smAll = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius mdAll = BorderRadius.all(Radius.circular(md));
  static const BorderRadius lgAll = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius xlAll = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius controlAll = BorderRadius.all(Radius.circular(control));
  static const BorderRadius pillAll = BorderRadius.all(Radius.circular(pill));
}

/// Fixed component sizes (avatars, icons, tiles) so they aren't magic numbers.
class AppSizes {
  const AppSizes._();

  static const double iconXs = 14;
  static const double iconSm = 16;
  static const double iconMd = 20;
  static const double iconLg = 24;
  static const double iconXl = 32;
  static const double iconHero = 56;

  static const double avatarXs = 28;
  static const double avatarSm = 36;
  static const double avatarMd = 48;
  static const double avatarLg = 72;
  static const double avatarXl = 112;

  static const double dot = 8;
  static const double chipHeight = 32;
  static const double buttonHeight = 56;
  static const double sparklineHeight = 28;
  static const double sparklineWidth = 64;
  static const double heroHeight = 240;
  static const double carouselCardWidth = 260;
  static const double hairline = 1;
  static const double ringStroke = 3;
}
