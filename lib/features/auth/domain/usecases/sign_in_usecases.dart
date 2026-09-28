import '../../../../core/network/api_result.dart';
import '../entities/auth_session.dart';
import '../entities/otp_challenge.dart';
import '../entities/social_credential.dart';
import '../repositories/auth_repository.dart';

class SendOtpUseCase {
  final AuthRepository repository;

  SendOtpUseCase(this.repository);

  ApiResult<OtpChallenge> call({required String phone}) => repository.sendOtp(phone: phone);
}

class ResendOtpUseCase {
  final AuthRepository repository;

  ResendOtpUseCase(this.repository);

  ApiResult<OtpChallenge> call({required String sessionId, required String phone}) =>
      repository.resendOtp(sessionId: sessionId, phone: phone);
}

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  ApiResult<AuthSession> call({required String sessionId, required String phone, required String code}) =>
      repository.verifyOtp(sessionId: sessionId, phone: phone, code: code);
}

class SocialSignInUseCase {
  final AuthRepository repository;

  SocialSignInUseCase(this.repository);

  /// Right(null) when the user closed the provider sheet.
  ApiResult<AuthSession?> call(SocialProvider provider) => repository.socialSignIn(provider);
}
