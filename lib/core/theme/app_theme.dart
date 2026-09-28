import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_text_styles.dart';
import 'app_tokens.dart';

/// Builds the dark (Playmaker court green, default) and light (cream) themes. Every Material
/// component the app uses is configured here so screens never style buttons,
/// inputs or chips inline.
class AppTheme {
  const AppTheme._();

  static ThemeData dark({String languageCode = 'en'}) => _build(AppTokens.dark, languageCode);

  static ThemeData light({String languageCode = 'en'}) => _build(AppTokens.light, languageCode);

  static ThemeData _build(AppTokens t, String languageCode) {
    final scheme = ColorScheme(
      brightness: t.isDark ? Brightness.dark : Brightness.light,
      primary: t.highlight,
      onPrimary: t.onHighlight,
      primaryContainer: t.isDark ? AppColors.green700 : const Color(0xFFDCE6DC),
      onPrimaryContainer: t.isDark ? AppColors.cream : AppColors.green800,
      secondary: AppColors.accent,
      onSecondary: AppColors.onAccent,
      secondaryContainer: t.surface2,
      onSecondaryContainer: t.textPrimary,
      tertiary: AppColors.clay,
      onTertiary: AppColors.white,
      error: AppColors.danger,
      onError: AppColors.green950,
      errorContainer: AppColors.danger.withValues(alpha: 0.16),
      onErrorContainer: AppColors.danger,
      surface: t.surface,
      onSurface: t.textPrimary,
      onSurfaceVariant: t.textMuted,
      surfaceContainerLowest: t.background,
      surfaceContainerLow: t.surface,
      surfaceContainer: t.surface,
      surfaceContainerHigh: t.surface2,
      surfaceContainerHighest: t.surface2,
      outline: t.outline,
      outlineVariant: t.outline,
      shadow: AppColors.scrim,
      scrim: AppColors.scrim,
      inverseSurface: t.textPrimary,
      onInverseSurface: t.background,
      inversePrimary: AppColors.accent,
      surfaceTint: AppColors.transparent,
    );

    final text = AppTypography.textTheme(t, languageCode);

    // Primary CTA: gold with green ink on dark; logo green with cream ink on light.
    final primaryButton = ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.disabled) ? t.surface2 : t.highlight,
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.disabled) ? t.textMuted : t.onHighlight,
      ),
      overlayColor: WidgetStatePropertyAll(t.onHighlight.withValues(alpha: 0.08)),
      minimumSize: const WidgetStatePropertyAll(Size(64, AppSizes.buttonHeight)),
      padding: const WidgetStatePropertyAll(EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.xxl)),
      shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: AppRadius.controlAll)),
      textStyle: WidgetStatePropertyAll(text.labelLarge?.copyWith(fontSize: 15.5, fontWeight: FontWeight.w600)),
      elevation: const WidgetStatePropertyAll(0),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: t.background,
      canvasColor: t.background,
      textTheme: text,
      extensions: [t],
      splashFactory: InkSparkle.splashFactory,
      dividerTheme: DividerThemeData(color: t.outline, thickness: AppSizes.hairline, space: AppSizes.hairline),
      iconTheme: IconThemeData(color: t.textPrimary, size: AppSizes.iconLg),
      appBarTheme: AppBarTheme(
        backgroundColor: t.background.withValues(alpha: 0),
        surfaceTintColor: AppColors.transparent,
        foregroundColor: t.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: text.headlineMedium,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: t.surface,
        surfaceTintColor: AppColors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.lgAll,
          side: BorderSide(color: t.outline),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(style: primaryButton),
      elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButton),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: t.textPrimary,
          backgroundColor: t.isDark ? AppColors.cream08 : AppColors.transparent,
          side: BorderSide(color: t.outline),
          minimumSize: const Size(64, AppSizes.buttonHeight),
          padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.xxl),
          shape: const RoundedRectangleBorder(borderRadius: AppRadius.controlAll),
          textStyle: text.labelLarge?.copyWith(fontSize: 15.5, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: t.isDark ? AppColors.goldSoft : AppColors.green800,
          textStyle: text.labelLarge,
          shape: const StadiumBorder(),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(style: IconButton.styleFrom(foregroundColor: t.textPrimary)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: t.highlight,
        foregroundColor: t.onHighlight,
        elevation: 0,
        highlightElevation: 0,
        shape: const StadiumBorder(),
        extendedTextStyle: text.labelLarge?.copyWith(fontWeight: FontWeight.w700),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: t.isDark ? AppColors.field : t.surface,
        contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md + 2),
        labelStyle: text.bodyMedium?.copyWith(color: t.textMuted),
        hintStyle: text.bodyMedium?.copyWith(color: t.textMuted),
        prefixIconColor: t.textMuted,
        suffixIconColor: t.textMuted,
        border: OutlineInputBorder(
          borderRadius: AppRadius.controlAll,
          borderSide: BorderSide(color: t.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.controlAll,
          borderSide: BorderSide(color: t.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.controlAll,
          borderSide: BorderSide(color: t.isDark ? AppColors.goldSoft.withValues(alpha: .6) : AppColors.green800),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppRadius.controlAll,
          borderSide: BorderSide(color: AppColors.danger),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: AppRadius.controlAll,
          borderSide: BorderSide(color: AppColors.danger, width: 1.5),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: t.surface2,
        selectedColor: t.highlight,
        disabledColor: t.surface2,
        labelStyle: text.labelMedium?.copyWith(color: t.textPrimary),
        secondaryLabelStyle: text.labelMedium?.copyWith(color: t.onHighlight),
        side: BorderSide(color: t.outline),
        shape: const StadiumBorder(),
        showCheckmark: false,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.sm),
        checkmarkColor: t.onHighlight,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: t.surface,
        surfaceTintColor: AppColors.transparent,
        indicatorColor: t.highlight.withValues(alpha: t.isDark ? 0.16 : 0.12),
        indicatorShape: const StadiumBorder(),
        elevation: 0,
        height: 68,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith(
          (s) =>
              IconThemeData(color: s.contains(WidgetState.selected) ? t.highlight : t.textMuted, size: AppSizes.iconLg),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (s) => text.labelSmall?.copyWith(
            letterSpacing: 0.2,
            color: s.contains(WidgetState.selected) ? t.textPrimary : t.textMuted,
          ),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: t.surface,
        indicatorColor: t.highlight.withValues(alpha: 0.16),
        selectedIconTheme: IconThemeData(color: t.highlight),
        unselectedIconTheme: IconThemeData(color: t.textMuted),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: t.onHighlight,
        unselectedLabelColor: t.textMuted,
        labelStyle: text.labelLarge,
        unselectedLabelStyle: text.labelLarge,
        indicatorSize: TabBarIndicatorSize.tab,
        dividerColor: AppColors.transparent,
        tabAlignment: TabAlignment.start,
        indicator: ShapeDecoration(color: t.highlight, shape: const StadiumBorder()),
        overlayColor: const WidgetStatePropertyAll(AppColors.transparent),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: t.isDark ? AppColors.green800 : AppColors.green900,
        contentTextStyle: text.bodyMedium?.copyWith(color: AppColors.cream),
        actionTextColor: AppColors.goldSoft,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
        elevation: 0,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: t.surface,
        surfaceTintColor: AppColors.transparent,
        modalBackgroundColor: t.surface,
        showDragHandle: true,
        dragHandleColor: t.isDark ? AppColors.cream15 : t.outline,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl))),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: t.surface,
        surfaceTintColor: AppColors.transparent,
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.xlAll),
        titleTextStyle: text.titleLarge,
        contentTextStyle: text.bodyMedium,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: t.highlight,
        linearTrackColor: t.surface2,
        circularTrackColor: t.surface2,
        linearMinHeight: 6,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: t.textMuted,
        textColor: t.textPrimary,
        contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.lg),
        shape: const RoundedRectangleBorder(borderRadius: AppRadius.mdAll),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? t.onHighlight : t.textMuted,
        ),
        trackColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? t.highlight : t.surface2),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? t.highlight : t.textMuted),
      ),
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected) ? t.highlight : t.surface2,
          ),
          foregroundColor: WidgetStateProperty.resolveWith(
            (s) => s.contains(WidgetState.selected) ? t.onHighlight : t.textPrimary,
          ),
          side: WidgetStatePropertyAll(BorderSide(color: t.outline)),
        ),
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeForwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
