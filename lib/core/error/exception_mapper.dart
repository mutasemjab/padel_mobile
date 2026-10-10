import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'failure.dart';

/// Inspects a [DioException] (response status + body shape) and produces the
/// matching [Failure]. This is the single place that understands the
/// backend's error envelope (`{status:false, message, code?, errors?}`) and
/// Laravel's 422 shape, so no other layer has to.
class ExceptionMapper {
  const ExceptionMapper._();

  static Failure map(Object error, [StackTrace? stackTrace]) {
    if (error is Failure) return error;

    if (error is! DioException) {
      // Parsing bugs land here — surface them in debug instead of hiding them.
      if (kDebugMode) debugPrint('ExceptionMapper: $error\n$stackTrace');
      return const UnknownFailure();
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return const NetworkFailure();
      case DioExceptionType.cancel:
        return const UnknownFailure('Request cancelled.');
      case DioExceptionType.badCertificate:
        return const NetworkFailure('Secure connection failed.');
      case DioExceptionType.badResponse:
        return _mapResponse(error);
      case DioExceptionType.unknown:
        return const NetworkFailure();
      default:
        return const UnknownFailure();
    }
  }

  static Failure _mapResponse(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode ?? 0;
    final body = response?.data;
    final message = _extractMessage(body);
    final code = _extractCode(body);

    switch (statusCode) {
      case 401:
        return UnauthorizedFailure(message ?? 'Session expired.', code);
      case 403:
        return ForbiddenFailure(message ?? 'Request failed.', code ?? ApiErrorCodes.forbidden);
      case 404:
        return NotFoundFailure(message ?? 'Not found.');
      case 422:
        if (body is Map) return ValidationFailure(message ?? 'Validation failed.', _extractErrors(body), code);
      case 429:
        return RateLimitedFailure(message ?? 'Too many requests.', code ?? ApiErrorCodes.rateLimited);
      case 503:
        if (code == ApiErrorCodes.paymentProviderNotConfigured ||
            code == ApiErrorCodes.threeDProviderNotConfigured ||
            code == ApiErrorCodes.otpProviderUnavailable ||
            code == ApiErrorCodes.socialProviderUnavailable) {
          return ProviderUnavailableFailure(message ?? 'Not available yet.', code!);
        }
    }

    if (statusCode == 400) return BusinessFailure(message ?? 'Request failed.', code);
    // The payment gateway refused (wrong credentials, declined...): show its reason, not "unexpected error".
    if (code == ApiErrorCodes.paymentGatewayError && message != null) return BusinessFailure(message, code);
    if (statusCode >= 500) return const ServerFailure();
    if (message != null) return BusinessFailure(message, code);
    return const UnknownFailure();
  }

  static Map<String, List<String>> _extractErrors(Map body) {
    final errors = <String, List<String>>{};
    final raw = body['errors'];
    if (raw is Map) {
      raw.forEach((key, value) {
        if (value is List) errors[key.toString()] = value.map((e) => e.toString()).toList();
      });
    }
    return errors;
  }

  static String? _extractMessage(dynamic body) {
    if (body is Map && body['message'] != null) return body['message'].toString();
    return null;
  }

  static String? _extractCode(dynamic body) {
    if (body is Map && body['code'] is String) return body['code'] as String;
    return null;
  }
}
