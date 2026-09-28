import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:padel/core/error/exception_mapper.dart';
import 'package:padel/core/error/failure.dart';

DioException _response(int status, Map<String, dynamic> body, {String path = 'x'}) {
  final options = RequestOptions(path: path);
  return DioException(
    requestOptions: options,
    type: DioExceptionType.badResponse,
    response: Response(requestOptions: options, statusCode: status, data: body),
  );
}

void main() {
  test('403 PREMIUM_REQUIRED becomes a ForbiddenFailure routed to the paywall', () {
    final f = ExceptionMapper.map(_response(403, {'status': false, 'message': 'Premium', 'code': 'PREMIUM_REQUIRED'}));
    expect(f, isA<ForbiddenFailure>());
    expect(f.isPremiumRequired, isTrue);
  });

  test('403 without code defaults to FORBIDDEN', () {
    final f = ExceptionMapper.map(_response(403, {'status': false, 'message': 'No'}));
    expect(f.code, ApiErrorCodes.forbidden);
  });

  test('401 INVALID_CREDENTIALS is distinguishable from session expiry', () {
    final f = ExceptionMapper.map(_response(401, {'status': false, 'message': 'Wrong', 'code': 'INVALID_CREDENTIALS'}));
    expect(f, isA<UnauthorizedFailure>());
    expect((f as UnauthorizedFailure).isInvalidCredentials, isTrue);
  });

  test('503 provider codes are "coming soon", not server crashes', () {
    final f = ExceptionMapper.map(
      _response(503, {'status': false, 'message': 'x', 'code': 'PAYMENT_PROVIDER_NOT_CONFIGURED'}),
    );
    expect(f, isA<ProviderUnavailableFailure>());
    expect(ExceptionMapper.map(_response(503, {'message': 'down'})), isA<ServerFailure>());
  });

  test('404 / 429 / 400 / 422 map to their failures', () {
    expect(ExceptionMapper.map(_response(404, {'message': 'nope'})), isA<NotFoundFailure>());
    expect(ExceptionMapper.map(_response(429, {'message': 'slow'})), isA<RateLimitedFailure>());
    final business = ExceptionMapper.map(_response(400, {'status': false, 'message': 'Slot taken'}));
    expect(business, isA<BusinessFailure>());
    expect(business.message, 'Slot taken');
    final validation = ExceptionMapper.map(_response(422, {
      'message': 'Invalid',
      'errors': {
        'email': ['Taken'],
      },
    }));
    expect((validation as ValidationFailure).firstErrorFor('email'), 'Taken');
  });

  test('connectivity problems are NetworkFailure', () {
    final f = ExceptionMapper.map(DioException(
      requestOptions: RequestOptions(path: 'x'),
      type: DioExceptionType.connectionError,
    ));
    expect(f, isA<NetworkFailure>());
  });

  test('OTP errors keep their machine code (422 / 429 / 503)', () {
    final invalid = ExceptionMapper.map(_response(422, {
      'status': false,
      'message': 'Wrong code, 3 attempts left',
      'code': 'OTP_INVALID',
      'data': {'attempts_left': 3},
    }));
    expect(invalid, isA<ValidationFailure>());
    expect(invalid.code, ApiErrorCodes.otpInvalid);
    expect(invalid.message, 'Wrong code, 3 attempts left');

    final tooSoon = ExceptionMapper.map(_response(429, {'message': 'Wait', 'code': 'OTP_RESEND_TOO_SOON'}));
    expect(tooSoon, isA<RateLimitedFailure>());
    expect(tooSoon.code, ApiErrorCodes.otpResendTooSoon);
    expect(ExceptionMapper.map(_response(429, {'message': 'slow'})).code, ApiErrorCodes.rateLimited);

    final provider = ExceptionMapper.map(_response(503, {'message': 'x', 'code': 'OTP_PROVIDER_UNAVAILABLE'}));
    expect(provider, isA<ProviderUnavailableFailure>());
  });
}
