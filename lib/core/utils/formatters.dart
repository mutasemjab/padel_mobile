import 'package:intl/intl.dart';

import '../localization/locale_controller.dart';

class Formatters {
  const Formatters._();

  static String get _locale => LocaleController.instance.languageCode.value;

  /// `20` → "20", `20.5` → "20.50", with the currency code when known.
  static String money(num amount, [String? currency]) {
    final isWhole = amount == amount.roundToDouble();
    final number = NumberFormat.decimalPatternDigits(locale: _locale, decimalDigits: isWhole ? 0 : 2).format(amount);
    return currency == null || currency.isEmpty ? number : '$number $currency';
  }

  /// Win rates may arrive as a 0–1 ratio or a 0–100 percentage; null → null
  /// so callers render "—" instead of an invented 0%.
  static String? percent(num? value) {
    if (value == null) return null;
    final pct = value <= 1 ? value * 100 : value;
    return '${pct.round()}%';
  }

  static String compact(num value) => NumberFormat.compact(locale: _locale).format(value);

  static String signed(int value) => value > 0 ? '+$value' : '$value';

  /// ISO-3166 alpha-2 → flag emoji ("JO" → 🇯🇴). Unknown codes → ''.
  static String flag(String? countryCode) {
    final code = countryCode?.trim().toUpperCase();
    if (code == null || code.length != 2 || !RegExp(r'^[A-Z]{2}$').hasMatch(code)) return '';
    const base = 0x1F1E6 - 0x41;
    return String.fromCharCodes([base + code.codeUnitAt(0), base + code.codeUnitAt(1)]);
  }

  static String minutes(int minutes) {
    final h = minutes ~/ 60;
    final m = minutes % 60;
    if (h == 0) return '${m}m';
    return m == 0 ? '${h}h' : '${h}h ${m}m';
  }
}
