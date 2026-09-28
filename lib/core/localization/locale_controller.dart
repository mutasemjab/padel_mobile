import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/storage_keys.dart';

/// Single source of truth for the app's current language. Read synchronously
/// by [LocaleInterceptor] on every request (Accept-Language) and by the
/// widget tree (MaterialApp locale) via [ValueListenable].
class LocaleController {
  LocaleController._internal();

  static final LocaleController instance = LocaleController._internal();

  /// Backend default is Arabic when no header is sent; we mirror that.
  final ValueNotifier<String> languageCode = ValueNotifier<String>('ar');

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(StorageKeys.locale);
    if (saved == 'ar' || saved == 'en') {
      languageCode.value = saved!;
    }
  }

  Future<void> setLanguage(String code) async {
    if (code != 'ar' && code != 'en') return;
    languageCode.value = code;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(StorageKeys.locale, code);
  }

  bool get isRtl => languageCode.value == 'ar';
}
