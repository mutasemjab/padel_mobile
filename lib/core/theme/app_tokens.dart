import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Brightness-dependent semantic colors that Material's [ColorScheme] has no
/// slot for (second surface, muted text, "your" highlight, …). Read with
/// `context.tokens`.
@immutable
class AppTokens extends ThemeExtension<AppTokens> {
  final Color background;
  final Color surface;
  final Color surface2;
  final Color outline;
  final Color textPrimary;
  final Color textMuted;

  /// Gold on dark; logo green on light (gold text is unreadable on cream).
  final Color highlight;

  /// Foreground to put on top of [highlight] fills.
  final Color onHighlight;

  final bool isDark;

  const AppTokens({
    required this.background,
    required this.surface,
    required this.surface2,
    required this.outline,
    required this.textPrimary,
    required this.textMuted,
    required this.highlight,
    required this.onHighlight,
    required this.isDark,
  });

  static const AppTokens dark = AppTokens(
    background: AppColors.background,
    surface: AppColors.surface,
    surface2: AppColors.surface2,
    outline: AppColors.outline,
    textPrimary: AppColors.textPrimary,
    textMuted: AppColors.textMuted,
    highlight: AppColors.gold,
    onHighlight: AppColors.green900,
    isDark: true,
  );

  static const AppTokens light = AppTokens(
    background: AppColors.lightBackground,
    surface: AppColors.lightSurface,
    surface2: AppColors.lightSurface2,
    outline: AppColors.lightOutline,
    textPrimary: AppColors.lightTextPrimary,
    textMuted: AppColors.lightTextMuted,
    highlight: AppColors.green800,
    onHighlight: AppColors.cream,
    isDark: false,
  );

  @override
  AppTokens copyWith({
    Color? background,
    Color? surface,
    Color? surface2,
    Color? outline,
    Color? textPrimary,
    Color? textMuted,
    Color? highlight,
    Color? onHighlight,
    bool? isDark,
  }) {
    return AppTokens(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surface2: surface2 ?? this.surface2,
      outline: outline ?? this.outline,
      textPrimary: textPrimary ?? this.textPrimary,
      textMuted: textMuted ?? this.textMuted,
      highlight: highlight ?? this.highlight,
      onHighlight: onHighlight ?? this.onHighlight,
      isDark: isDark ?? this.isDark,
    );
  }

  @override
  AppTokens lerp(ThemeExtension<AppTokens>? other, double t) {
    if (other is! AppTokens) return this;
    return AppTokens(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surface2: Color.lerp(surface2, other.surface2, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      highlight: Color.lerp(highlight, other.highlight, t)!,
      onHighlight: Color.lerp(onHighlight, other.onHighlight, t)!,
      isDark: t < 0.5 ? isDark : other.isDark,
    );
  }
}

extension AppThemeContext on BuildContext {
  AppTokens get tokens => Theme.of(this).extension<AppTokens>() ?? AppTokens.dark;
  TextTheme get text => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;

  /// Honours the OS "reduce motion" / "remove animations" setting.
  bool get reduceMotion => MediaQuery.maybeDisableAnimationsOf(this) ?? false;

  bool get isTablet => MediaQuery.sizeOf(this).width >= 700;
}
