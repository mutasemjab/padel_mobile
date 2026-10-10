import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';

import '../widgets/pm_backdrop.dart';
import 'app_colors.dart';
import 'app_effects.dart';
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

    // Primary CTA: the login's gold-leaf button on dark (green ink); deep court
    // green with cream ink on light. Painted by [backgroundBuilder] so the
    // gradient and its glow survive on every FilledButton / ElevatedButton.
    final primaryFill = t.isDark
        ? AppGradients.goldButton
        : const CssLinearGradient(145, colors: [AppColors.green700, AppColors.green900]);
    final primaryButton = ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.disabled) ? t.surface2 : AppColors.transparent,
      ),
      foregroundColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.disabled) ? t.textMuted : t.onHighlight,
      ),
      iconColor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.disabled) ? t.textMuted : t.onHighlight,
      ),
      overlayColor: WidgetStatePropertyAll(t.onHighlight.withValues(alpha: 0.08)),
      minimumSize: const WidgetStatePropertyAll(Size(64, AppSizes.buttonHeight)),
      padding: const WidgetStatePropertyAll(EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.xxl)),
      shape: const WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: AppRadius.controlAll)),
      textStyle: WidgetStatePropertyAll(text.labelLarge?.copyWith(fontSize: 15.5, fontWeight: FontWeight.w600)),
      elevation: const WidgetStatePropertyAll(0),
      backgroundBuilder: (context, states, child) {
        if (states.contains(WidgetState.disabled)) return child ?? const SizedBox.shrink();
        return DecoratedBox(
          decoration: BoxDecoration(
            gradient: primaryFill,
            borderRadius: AppRadius.controlAll,
            boxShadow: t.isDark ? AppShadows.goldButton : AppShadows.greenButton,
          ),
          child: child,
        );
      },
    );

    return ThemeData(
      useMaterial3: true,
      brightness: scheme.brightness,
      colorScheme: scheme,
      // Every route paints [PmBackdrop] under a transparent scaffold.
      scaffoldBackgroundColor: AppColors.transparent,
      canvasColor: t.background,
      textTheme: text,
      extensions: [t],
      splashFactory: InkSparkle.splashFactory,
      dividerTheme: DividerThemeData(color: t.outline, thickness: AppSizes.hairline, space: AppSizes.hairline),
      iconTheme: IconThemeData(color: t.textPrimary, size: AppSizes.iconLg),
      appBarTheme: AppBarTheme(
        backgroundColor: WidgetStateColor.resolveWith(
          (s) => s.contains(WidgetState.scrolledUnder)
              ? (t.isDark ? const Color(0xEB041C16) : const Color(0xF0F3EEDF))
              : AppColors.transparent,
        ),
        surfaceTintColor: AppColors.transparent,
        foregroundColor: t.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        toolbarHeight: 64,
        titleTextStyle: text.headlineMedium?.copyWith(fontSize: 26, height: 1.2),
        actionsPadding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
      ),
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (context) => _GlassIcon(icon: Icons.arrow_back_ios_new_rounded, dark: t.isDark),
        closeButtonIconBuilder: (context) => _GlassIcon(icon: Icons.close_rounded, dark: t.isDark),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: t.isDark ? const Color(0x0FF3EEDF) : AppColors.ivory,
        surfaceTintColor: AppColors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.cardAll,
          side: BorderSide(color: t.isDark ? AppGlass.hairline : AppColors.lightOutline),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(style: primaryButton),
      elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButton),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: t.textPrimary,
          backgroundColor: t.isDark ? AppColors.cream08 : AppColors.ivory,
          side: BorderSide(color: t.isDark ? AppColors.cream15 : AppColors.lightOutline),
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
        backgroundColor: t.isDark ? AppColors.goldSoft : AppColors.green800,
        foregroundColor: t.onHighlight,
        elevation: 0,
        highlightElevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        shape: const StadiumBorder(),
        extendedTextStyle: text.labelLarge?.copyWith(fontWeight: FontWeight.w700),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: t.isDark ? AppColors.field : AppColors.ivory,
        floatingLabelStyle: text.bodyMedium?.copyWith(color: t.isDark ? AppColors.goldSoft : AppColors.green800),
        contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md + 2),
        labelStyle: text.bodyMedium?.copyWith(color: t.textMuted),
        hintStyle: text.bodyMedium?.copyWith(color: t.textMuted),
        prefixIconColor: t.textMuted,
        suffixIconColor: t.textMuted,
        border: OutlineInputBorder(
          borderRadius: AppRadius.controlAll,
          borderSide: BorderSide(color: t.isDark ? AppColors.cream15 : AppColors.lightOutline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.controlAll,
          borderSide: BorderSide(color: t.isDark ? AppColors.cream15 : AppColors.lightOutline),
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
        backgroundColor: t.isDark ? const Color(0x8C06261F) : AppColors.ivory,
        selectedColor: t.isDark ? AppColors.goldSoft : AppColors.green800,
        disabledColor: t.surface2,
        labelStyle: text.labelMedium?.copyWith(color: t.isDark ? AppColors.cream70 : t.textPrimary),
        secondaryLabelStyle: text.labelMedium?.copyWith(color: t.onHighlight),
        side: WidgetStateBorderSide.resolveWith(
          (s) => s.contains(WidgetState.selected)
              ? const BorderSide(color: AppColors.transparent)
              : BorderSide(color: t.isDark ? const Color(0x40E3CC97) : AppColors.lightOutline),
        ),
        shape: const StadiumBorder(),
        showCheckmark: false,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs),
        checkmarkColor: t.onHighlight,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: t.isDark ? AppColors.green900 : AppColors.ivory,
        surfaceTintColor: AppColors.transparent,
        indicatorColor: t.isDark ? AppColors.goldSoft : AppColors.green800,
        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 0,
        height: 68,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith(
          (s) => IconThemeData(
            color: s.contains(WidgetState.selected) ? t.onHighlight : (t.isDark ? AppColors.cream40 : t.textMuted),
            size: 21,
          ),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (s) => text.labelSmall?.copyWith(
            letterSpacing: 0,
            fontWeight: s.contains(WidgetState.selected) ? FontWeight.w700 : FontWeight.w500,
            color: s.contains(WidgetState.selected) ? (t.isDark ? AppColors.goldSoft : AppColors.green800) : t.textMuted,
          ),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: t.isDark ? const Color(0xCC06261F) : AppColors.ivory,
        indicatorColor: t.isDark ? AppColors.goldSoft : AppColors.green800,
        selectedIconTheme: IconThemeData(color: t.onHighlight),
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
        indicator: ShapeDecoration(
          gradient: t.isDark
              ? AppGradients.goldButton
              : const CssLinearGradient(145, colors: [AppColors.green700, AppColors.green900]),
          shape: const StadiumBorder(),
        ),
        overlayColor: const WidgetStatePropertyAll(AppColors.transparent),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.green800,
        contentTextStyle: text.bodyMedium?.copyWith(color: AppColors.cream),
        actionTextColor: AppColors.goldSoft,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.controlAll,
          side: BorderSide(color: AppGlass.hairline),
        ),
        elevation: 0,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: t.isDark ? AppColors.green900 : AppColors.ivory,
        surfaceTintColor: AppColors.transparent,
        modalBackgroundColor: t.isDark ? AppColors.green900 : AppColors.ivory,
        modalBarrierColor: AppColors.barrier,
        showDragHandle: true,
        dragHandleColor: t.isDark ? AppColors.cream15 : t.outline,
        dragHandleSize: const Size(38, 4),
        // Full width on phones (the sheet would otherwise shrink to its
        // content), capped at 640 on tablets.
        constraints: const BoxConstraints(minWidth: 640, maxWidth: 640),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.sheet)),
          side: BorderSide(color: t.isDark ? AppGlass.hairlineStrong : AppColors.lightOutline),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: t.isDark ? AppColors.green900 : AppColors.ivory,
        surfaceTintColor: AppColors.transparent,
        barrierColor: AppColors.barrier,
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.cardAll,
          side: BorderSide(color: t.isDark ? AppGlass.hairlineStrong : AppColors.lightOutline),
        ),
        titleTextStyle: text.headlineMedium?.copyWith(fontSize: 22),
        contentTextStyle: text.bodyMedium?.copyWith(color: t.textMuted),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: t.isDark ? AppColors.goldSoft : AppColors.green700,
        linearTrackColor: t.isDark ? AppColors.cream08 : AppColors.lightSurface2,
        circularTrackColor: t.isDark ? AppColors.cream08 : AppColors.lightSurface2,
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
          TargetPlatform.android: _BackdropTransitions(FadeForwardsPageTransitionsBuilder()),
          TargetPlatform.iOS: _BackdropTransitions(CupertinoPageTransitionsBuilder()),
          TargetPlatform.windows: _BackdropTransitions(FadeForwardsPageTransitionsBuilder()),
          TargetPlatform.macOS: _BackdropTransitions(CupertinoPageTransitionsBuilder()),
          TargetPlatform.linux: _BackdropTransitions(FadeForwardsPageTransitionsBuilder()),
        },
      ),
    );
  }
}

/// Wraps a platform transition so every page sits on [PmBackdrop] — the
/// login's green depth and grain — instead of a flat scaffold color.
class _BackdropTransitions extends PageTransitionsBuilder {
  final PageTransitionsBuilder inner;

  const _BackdropTransitions(this.inner);

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) => inner.buildTransitions(route, context, animation, secondaryAnimation, PmBackdrop(child: child));
}

/// Back / close glyph in the frosted 40px square of the login and home headers.
class _GlassIcon extends StatelessWidget {
  final IconData icon;
  final bool dark;

  const _GlassIcon({required this.icon, required this.dark});

  @override
  Widget build(BuildContext context) => Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: dark ? AppColors.cream08 : AppColors.ivory,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: dark ? AppColors.cream15 : AppColors.lightOutline),
    ),
    child: Icon(icon, size: 18, color: dark ? AppColors.cream : AppColors.green800),
  );
}
