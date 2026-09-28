import 'package:equatable/equatable.dart';

/// A pending phone verification returned by `auth/otp/send` and
/// `auth/otp/resend`. [sessionId] must be echoed back on resend / verify.
class OtpChallenge extends Equatable {
  final String sessionId;
  final String? maskedPhone;

  /// Seconds until the code expires.
  final int expiresIn;

  /// Seconds before `auth/otp/resend` is allowed again.
  final int resendAvailableIn;
  final int codeLength;

  const OtpChallenge({
    required this.sessionId,
    this.maskedPhone,
    this.expiresIn = 300,
    this.resendAvailableIn = 30,
    this.codeLength = 6,
  });

  @override
  List<Object?> get props => [sessionId, maskedPhone, expiresIn, resendAvailableIn, codeLength];
}
