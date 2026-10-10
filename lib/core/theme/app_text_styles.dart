import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_tokens.dart';

/// The three Playmaker families. All weights used here are bundled in
/// `assets/fonts`, so google_fonts never has to download them.
class AppFonts {
  const AppFonts._();

  /// Amiri — display headings (bundled weight: 700).
  static TextStyle display({double size = 30, double height = 1.25, Color color = AppColors.cream}) =>
      GoogleFonts.amiri(fontSize: size, height: height, fontWeight: FontWeight.w700, color: color);

  /// Arabic glyphs for Playfair (Latin-only): numbers stay Playfair, any
  /// Arabic word inside the same string falls back to Plex instead of tofu.
  static List<String> _arabicFallback(FontWeight weight) => [
    GoogleFonts.ibmPlexSansArabic(fontWeight: weight).fontFamily!,
  ];

  /// IBM Plex Sans Arabic — all UI text, Arabic and Latin (400–700).
  static TextStyle body({
    double size = 14,
    double? height,
    FontWeight weight = FontWeight.w400,
    Color color = AppColors.cream,
    double? letterSpacing,
  }) => GoogleFonts.ibmPlexSansArabic(
    fontSize: size,
    height: height,
    fontWeight: weight,
    color: color,
    letterSpacing: letterSpacing,
  );

  /// Playfair Display — numbers, phone numbers, IDs, the wordmark (500 / 700,
  /// 500 italic).
  static TextStyle numeral({
    double size = 16,
    FontWeight weight = FontWeight.w500,
    Color color = AppColors.cream,
    double? letterSpacing,
    double? height,
    bool italic = false,
    List<FontFeature>? fontFeatures,
  }) => GoogleFonts.playfairDisplay(
    fontSize: size,
    fontWeight: weight,
    color: color,
    letterSpacing: letterSpacing,
    height: height,
    fontStyle: italic ? FontStyle.italic : FontStyle.normal,
    fontFeatures: fontFeatures,
  ).copyWith(fontFamilyFallback: _arabicFallback(weight));
}

/// Type system:
/// - **Amiri** for display and headline text
/// - **IBM Plex Sans Arabic** for UI text in both languages
/// - **Playfair Display** for scores, ratings and every number (tabular figures)
///
/// Scale: display 52/42/34 · headline 28/24 · title 20/17 · body 15/13 ·
/// label 12 · score 72.
class AppTypography {
  const AppTypography._();

  static const List<FontFeature> tabular = [FontFeature.tabularFigures(), FontFeature.liningFigures()];

  static TextTheme textTheme(AppTokens tokens, String languageCode) {
    final ink = tokens.textPrimary;
    final isAr = languageCode == 'ar';
    TextStyle display(double size, double height) => AppFonts.display(size: size, height: height, color: ink);
    TextStyle ui(double size, FontWeight weight, double? height, {Color? color, double? letterSpacing}) =>
        AppFonts.body(size: size, weight: weight, height: height, color: color ?? ink, letterSpacing: letterSpacing);

    return TextTheme(
      displayLarge: display(52, 1.1),
      displayMedium: display(42, 1.15),
      displaySmall: display(34, 1.2),
      headlineLarge: display(28, 1.25),
      headlineMedium: display(24, 1.3),
      headlineSmall: ui(20, FontWeight.w700, 1.3),
      titleLarge: ui(20, FontWeight.w700, 1.3),
      titleMedium: ui(17, FontWeight.w600, 1.35),
      titleSmall: ui(15, FontWeight.w600, 1.35),
      bodyLarge: ui(15, FontWeight.w400, 1.6),
      bodyMedium: ui(15, FontWeight.w400, 1.6),
      bodySmall: ui(13, FontWeight.w400, 1.5, color: tokens.textMuted),
      labelLarge: ui(14, FontWeight.w600, null, letterSpacing: 0.2),
      labelMedium: ui(12, FontWeight.w600, null, letterSpacing: isAr ? 0 : 0.3),
      labelSmall: ui(12, FontWeight.w500, null, letterSpacing: isAr ? 0 : 0.6, color: tokens.textMuted),
    );
  }

  /// Small gold eyebrow above section titles ("LIVE NOW", "YOUR SEASON").
  static TextStyle eyebrow(BuildContext context, {Color? color}) {
    final isAr = Localizations.localeOf(context).languageCode == 'ar';
    return context.text.labelSmall!.copyWith(
      color: color ?? (context.tokens.isDark ? AppColors.goldSoft : AppColors.green700),
      letterSpacing: isAr ? 0 : 1.2,
      fontWeight: FontWeight.w600,
    );
  }

  /// Playfair numerals with tabular figures — every rating, point and stat.
  static TextStyle number(BuildContext context, {double size = 20, FontWeight weight = FontWeight.w700, Color? color}) {
    return AppFonts.numeral(
      size: size,
      weight: weight == FontWeight.w500 ? FontWeight.w500 : FontWeight.w700,
      height: 1.0,
      color: color ?? context.tokens.textPrimary,
      fontFeatures: tabular,
    );
  }

  /// The 72pt live score.
  static TextStyle score(BuildContext context, {Color? color}) => number(context, size: 72, color: color);

  static TextStyle scoreSecondary(BuildContext context, {Color? color}) =>
      number(context, size: 28, color: color ?? context.tokens.textMuted);
}

/// Legacy entry points kept for call sites written before [AppTypography].
class AppTextStyles {
  const AppTextStyles._();

  static TextStyle scoreDisplay(BuildContext context) => AppTypography.score(context);
  static TextStyle scoreSecondary(BuildContext context) => AppTypography.scoreSecondary(context);
}
