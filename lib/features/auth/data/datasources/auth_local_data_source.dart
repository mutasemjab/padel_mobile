import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/constants/storage_keys.dart';

/// Sole owner of the token + cached-session secure-storage keys — nothing
/// else in the app writes to them directly (see [AuthInterceptor]'s doc).
class AuthLocalDataSource {
  final FlutterSecureStorage secureStorage;

  AuthLocalDataSource(this.secureStorage);

  Future<void> saveToken(String token) => secureStorage.write(key: StorageKeys.authToken, value: token);

  Future<String?> readToken() => secureStorage.read(key: StorageKeys.authToken);

  Future<void> saveAccountType(String accountType) =>
      secureStorage.write(key: StorageKeys.accountType, value: accountType);

  Future<String?> readAccountType() => secureStorage.read(key: StorageKeys.accountType);

  Future<void> cachePlayer(Map<String, dynamic> playerJson) =>
      secureStorage.write(key: StorageKeys.cachedPlayer, value: jsonEncode(playerJson));

  Future<Map<String, dynamic>?> readCachedPlayer() async {
    final raw = await secureStorage.read(key: StorageKeys.cachedPlayer);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<void> cacheCoach(Map<String, dynamic>? coachJson) => coachJson == null
      ? secureStorage.delete(key: StorageKeys.cachedCoach)
      : secureStorage.write(key: StorageKeys.cachedCoach, value: jsonEncode(coachJson));

  Future<Map<String, dynamic>?> readCachedCoach() async {
    final raw = await secureStorage.read(key: StorageKeys.cachedCoach);
    if (raw == null) return null;
    return jsonDecode(raw) as Map<String, dynamic>;
  }

  Future<void> clear() async {
    await secureStorage.delete(key: StorageKeys.authToken);
    await secureStorage.delete(key: StorageKeys.cachedPlayer);
    await secureStorage.delete(key: StorageKeys.cachedCoach);
    await secureStorage.delete(key: StorageKeys.accountType);
  }
}
