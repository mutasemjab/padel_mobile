import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/api_endpoints.dart';
import '../constants/app_durations.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/locale_interceptor.dart';

/// Thin wrapper around a single, app-wide [Dio] instance. Base URL and
/// timeouts are set once here; auth/locale headers and logging are interceptors.
class DioClient {
  late final Dio dio;

  DioClient(FlutterSecureStorage secureStorage) {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: AppDurations.connectTimeout,
        receiveTimeout: AppDurations.receiveTimeout,
        headers: {'Accept': 'application/json'},
      ),
    );

    dio.interceptors.addAll([
      LocaleInterceptor(),
      AuthInterceptor(secureStorage),
      if (kDebugMode) PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true, compact: true),
    ]);
  }
}
