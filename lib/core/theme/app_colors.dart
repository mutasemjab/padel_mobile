import 'package:flutter/material.dart';

/// Playmaker palette — deep court greens built around the logo color
/// ([green800] is the exact green of `assets/icon.png`), cream text, gold
/// accents and the ball yellow. Dark-first; the light variant flips to cream
/// surfaces with green ink. Nothing outside `core/theme` should use a raw
/// `Color(0x…)` — reach for these tokens (or [AppTokens] via `context.tokens`
/// for anything that differs between dark and light).
class AppColors {
  const AppColors._();

  // Brand greens (darkest → lightest)
  static const Color green950 = Color(0xFF041C16);
  static const Color green900 = Color(0xFF06261F);
  static const Color green800 = Color(0xFF09392E); // logo
  static const Color green700 = Color(0xFF0F4A3C);
  static const Color green600 = Color(0xFF16604E);
  static const Color greenGlow = Color(0xFF1A6B56);

  // Cream ink and its alpha steps
  static const Color cream = Color(0xFFF3EEDF);
  static const Color cream70 = Color(0xB3F3EEDF);
  static const Color cream40 = Color(0x66F3EEDF);
  static const Color cream15 = Color(0x26F3EEDF);
  static const Color cream08 = Color(0x14F3EEDF);
  static const Color ivory = Color(0xFFFFFBEF);

  // Gold and ball
  static const Color gold = Color(0xFFC9A86A);
  static const Color goldSoft = Color(0xFFE3CC97);
  static const Color ball = Color(0xFFDFF05A);
  static const Color ballSeam = Color(0xFFF7FBD9);

  /// Translucent field fill (`rgba(4,28,22,.55)`).
  static const Color field = Color(0x8C041C16);

  // Dark neutrals
  static const Color background = green950;
  static const Color surface = green900;
  static const Color surface2 = green800;
  static const Color outline = cream15;
  static const Color textPrimary = cream;
  static const Color textMuted = Color(0x99F3EEDF);

  // Light neutrals
  static const Color lightBackground = cream;
  static const Color lightSurface = ivory;
  static const Color lightSurface2 = Color(0xFFEAE3CF);
  static const Color lightOutline = Color(0xFFD8CDB0);
  static const Color lightTextPrimary = green900;
  static const Color lightTextMuted = Color(0xFF55705F);

  // Accents (shared by both themes)
  static const Color primary = gold;
  static const Color primaryDeep = green800;
  static const Color accent = ball;
  static const Color onAccent = green950;
  static const Color accentLight = Color(0xFFF0F8A8);
  static const Color accentShade = Color(0xFFB5C43A);
  static const Color clay = Color(0xFFD9895A); // social / casual
  static const Color premiumGold = gold;
  static const Color premiumGoldLight = goldSoft;
  static const Color onPremium = green900;
  static const Color live = Color(0xFFFF5A5F);
  static const Color success = Color(0xFF5FCB8F);
  static const Color danger = Color(0xFFE8907A);
  static const Color info = Color(0xFF7FC8B4); // training · sea glass
  static const Color warning = Color(0xFFE8B45A);

  // Achievement rarity frames
  static const Color rarityRare = info;
  static const Color rarityEpic = Color(0xFFB08AE8);
  static const Color rarityLegendary = gold;

  // Podium
  static const Color medalGold = gold;
  static const Color medalSilver = Color(0xFFC4C8C2);
  static const Color medalBronze = Color(0xFFC0865A);

  static const Color scrim = Color(0xB3000000);

  /// Modal barrier: night court, not flat black.
  static const Color barrier = Color(0x99020F0C);
  static const Color white = Color(0xFFFFFFFF);
  static const Color transparent = Color(0x00000000);

  // Legacy names kept so older call sites keep compiling while migrating.
  static const Color courtGreen = primaryDeep;
  static const Color clayOrange = clay;
  static const Color error = danger;
  static const Color neutralGrey = textMuted;
}
