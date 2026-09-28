import 'package:flutter/widgets.dart';

import '../../l10n/gen/app_localizations.dart';
import 'failure.dart';

/// The backend already returns validation/business messages translated
/// (see LocaleInterceptor, which sends Accept-Language), so [Failure.message]
/// is shown as-is in that case. Machine codes and the handful of client-side
/// fallback messages (network/timeout/unknown, never seen by the backend) are
/// mapped to localized strings here. `OTP_INVALID` is deliberately left to the
/// backend message, which carries the remaining attempts.
extension FailureL10n on Failure {
  String localizedMessage(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final byCode = switch (code) {
      ApiErrorCodes.invalidCredentials => l10n.failureInvalidCredentials,
      ApiErrorCodes.premiumRequired => l10n.failurePremiumRequired,
      ApiErrorCodes.coachOnly => l10n.failureCoachOnly,
      ApiErrorCodes.playerProfileRequired => l10n.failurePlayerProfileRequired,
      ApiErrorCodes.staffOnly => l10n.failureStaffOnly,
      ApiErrorCodes.accountInactive => l10n.failureAccountInactive,
      ApiErrorCodes.rateLimited => l10n.failureRateLimited,
      ApiErrorCodes.paymentProviderNotConfigured => l10n.stateComingSoonPayments,
      ApiErrorCodes.threeDProviderNotConfigured => l10n.stateComingSoon3d,
      ApiErrorCodes.invalidPhone => l10n.failureInvalidPhone,
      ApiErrorCodes.otpExpired => l10n.failureOtpExpired,
      ApiErrorCodes.otpSessionInvalid => l10n.failureOtpSessionInvalid,
      ApiErrorCodes.otpResendTooSoon => l10n.failureOtpResendTooSoon,
      ApiErrorCodes.otpResendLimit => l10n.failureOtpResendLimit,
      ApiErrorCodes.otpTooManyAttempts => l10n.failureOtpTooManyAttempts,
      ApiErrorCodes.otpProviderUnavailable => l10n.failureOtpProviderUnavailable,
      ApiErrorCodes.socialTokenInvalid => l10n.failureSocialTokenInvalid,
      ApiErrorCodes.socialProviderUnavailable || ApiErrorCodes.socialNotConfigured => l10n.failureSocialUnavailable,
      _ => null,
    };
    if (byCode != null) return byCode;

    return switch (message) {
      'Session expired.' => l10n.failureSessionExpired,
      'No internet connection.' => l10n.failureNoInternet,
      'Something went wrong on our end.' => l10n.failureServerError,
      'An unexpected error occurred.' => l10n.failureUnknown,
      'Request cancelled.' => l10n.failureRequestCancelled,
      'Secure connection failed.' => l10n.failureSecureConnectionFailed,
      'Validation failed.' => l10n.failureValidationFailed,
      'Request failed.' => l10n.failureRequestFailed,
      'Not found.' => l10n.failureNotFound,
      'Too many requests.' => l10n.failureRateLimited,
      'Not available yet.' => l10n.failureProviderUnavailable,
      _ => message,
    };
  }
}
