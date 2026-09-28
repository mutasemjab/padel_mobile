import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../constants/storage_keys.dart';
import '../force_logout_notifier.dart';

/// Attaches the player bearer token (when present) to every request, and
/// broadcasts a force-logout event the first time the backend responds 401 —
/// it does not clear storage itself, that's [AuthLocalDataSource]'s job.
///
/// Requests that already carry an Authorization header (scorekeeper calls
/// with the staff token) are left untouched, and a 401 on them never logs
/// the player out.
class AuthInterceptor extends Interceptor {
  final FlutterSecureStorage secureStorage;

  AuthInterceptor(this.secureStorage);

  static bool _isStaffCall(RequestOptions options) => options.path.startsWith('scorekeeper/');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!options.headers.containsKey('Authorization')) {
      final token = await secureStorage.read(key: StorageKeys.authToken);
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final path = err.requestOptions.path;
    final isLogin = path.startsWith('auth/otp/') || path.startsWith('auth/social/');
    if (err.response?.statusCode == 401 && !isLogin && !_isStaffCall(err.requestOptions)) {
      ForceLogoutNotifier.instance.notify();
    }
    handler.next(err);
  }
}
