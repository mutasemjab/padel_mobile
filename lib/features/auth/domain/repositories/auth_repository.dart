import '../../../../core/network/api_result.dart';
import '../../../players/domain/entities/player.dart';
import '../entities/auth_session.dart';
import '../entities/otp_challenge.dart';
import '../entities/social_credential.dart';

abstract class AuthRepository {
  /// Phone sign-in step 1 — the external provider texts the code.
  ApiResult<OtpChallenge> sendOtp({required String phone});

  ApiResult<OtpChallenge> resendOtp({required String sessionId, required String phone});

  /// Phone sign-in step 2 — persists the session (token, account type,
  /// cached profiles) and registers the device token, but
  /// leaves it to the caller to tell [AuthBloc] (so the welcome animation can
  /// play before the router leaves the login screen).
  ApiResult<AuthSession> verifyOtp({required String sessionId, required String phone, required String code});

  /// Google / Apple sign-in: opens the provider sheet, then exchanges its
  /// token for a session (persisted like [verifyOtp]). Right(null) means the
  /// user closed the provider sheet.
  ApiResult<AuthSession?> socialSignIn(SocialProvider provider);

  /// Unregisters the device token and clears local storage regardless of
  /// whether the network calls succeed.
  ApiResult<void> logout();

  ApiResult<Player> me();

  /// Verifies the stored token and rebuilds the session for its account
  /// type (player → `auth/me`, coach → `coach/profile`, both → both).
  ApiResult<AuthSession> restoreSession();

  /// `PUT auth/me` — only personal fields; competitive fields are never editable.
  ApiResult<Player> updateProfile(Map<String, dynamic> fields);

  ApiResult<Player> uploadPhoto(String filePath);

  ApiResult<void> changePassword({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  });

  /// True when a token is present locally (not verified against the backend).
  Future<bool> hasStoredSession();
}
