import 'package:equatable/equatable.dart';

/// Machine codes the backend puts in the error envelope's `code` key.
class ApiErrorCodes {
  const ApiErrorCodes._();

  static const String invalidCredentials = 'INVALID_CREDENTIALS';
  static const String premiumRequired = 'PREMIUM_REQUIRED';
  static const String coachOnly = 'COACH_ONLY';
  static const String playerProfileRequired = 'PLAYER_PROFILE_REQUIRED';
  static const String staffOnly = 'STAFF_ONLY';
  static const String forbidden = 'FORBIDDEN';
  static const String accountInactive = 'ACCOUNT_INACTIVE';
  static const String notFound = 'NOT_FOUND';
  static const String rateLimited = 'RATE_LIMITED';
  static const String paymentProviderNotConfigured = 'PAYMENT_PROVIDER_NOT_CONFIGURED';
  static const String threeDProviderNotConfigured = 'THREE_D_PROVIDER_NOT_CONFIGURED';

  // Phone + OTP sign-in
  static const String invalidPhone = 'INVALID_PHONE';
  static const String otpInvalid = 'OTP_INVALID';
  static const String otpExpired = 'OTP_EXPIRED';
  static const String otpSessionInvalid = 'OTP_SESSION_INVALID';
  static const String otpResendTooSoon = 'OTP_RESEND_TOO_SOON';
  static const String otpResendLimit = 'OTP_RESEND_LIMIT';
  static const String otpTooManyAttempts = 'OTP_TOO_MANY_ATTEMPTS';
  static const String otpProviderUnavailable = 'OTP_PROVIDER_UNAVAILABLE';

  // Google / Apple sign-in
  static const String socialTokenInvalid = 'SOCIAL_TOKEN_INVALID';
  static const String socialProviderUnavailable = 'SOCIAL_PROVIDER_UNAVAILABLE';

  /// Client-side: this build has no OAuth client configured for the provider.
  static const String socialNotConfigured = 'SOCIAL_NOT_CONFIGURED';

  /// Not an error: a 200 whose payload is an explicit empty state.
  static const String insufficientData = 'INSUFFICIENT_DATA';
}

/// Base type every repository returns on the Left side of `Either<Failure, T>`.
/// Widgets must never see a raw exception — only these.
sealed class Failure extends Equatable {
  final String message;

  /// The backend's machine-readable `code`, when it sent one.
  final String? code;

  const Failure(this.message, [this.code]);

  bool get isPremiumRequired => code == ApiErrorCodes.premiumRequired;

  @override
  List<Object?> get props => [message, code];
}

/// HTTP 422 — Laravel's standard validation error shape (`errors` map of field -> messages).
class ValidationFailure extends Failure {
  final Map<String, List<String>> errors;

  const ValidationFailure(super.message, this.errors, [super.code]);

  /// First error message for a given field, if any — handy for inline form errors.
  String? firstErrorFor(String field) => errors[field]?.isNotEmpty == true ? errors[field]!.first : null;

  @override
  List<Object?> get props => [message, errors, code];
}

/// HTTP 400 `{status:false, message}` business-rule rejection
/// (e.g. "This match is no longer open.").
class BusinessFailure extends Failure {
  const BusinessFailure(super.message, [super.code]);
}

/// HTTP 401 — bad credentials on login, otherwise a missing/expired token.
class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Session expired.', super.code]);

  bool get isInvalidCredentials => code == ApiErrorCodes.invalidCredentials;
}

/// HTTP 403 — the account may not do this. [code] tells why
/// (`PREMIUM_REQUIRED`, `COACH_ONLY`, `PLAYER_PROFILE_REQUIRED`, `STAFF_ONLY`,
/// `FORBIDDEN`, `ACCOUNT_INACTIVE`). `PREMIUM_REQUIRED` routes to the paywall.
class ForbiddenFailure extends Failure {
  const ForbiddenFailure(super.message, String super.code);
}

/// HTTP 404.
class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Not found.', super.code = ApiErrorCodes.notFound]);
}

/// HTTP 429.
class RateLimitedFailure extends Failure {
  const RateLimitedFailure([super.message = 'Too many requests.', super.code = ApiErrorCodes.rateLimited]);
}

/// HTTP 503 with a provider code (payments / 3D / OTP not configured yet). Not a
/// crash — the UI shows a friendly "coming soon" state.
class ProviderUnavailableFailure extends Failure {
  const ProviderUnavailableFailure(super.message, String super.code);
}

/// Timeout or no connectivity.
class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection.']);
}

/// HTTP 5xx or anything unexpected from the server.
class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Something went wrong on our end.']);
}

/// Anything that doesn't fit the above (parsing errors, cancellations, etc).
class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'An unexpected error occurred.']);
}
