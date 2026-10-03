import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_envelope.dart';
import '../../../coaches/data/models/coach_model.dart';
import '../../../players/data/models/player_model.dart';
import '../models/auth_session_model.dart';
import '../../domain/entities/social_credential.dart';
import '../models/otp_challenge_model.dart';

abstract class AuthRemoteDataSource {
  /// [phone] is E.164 (`+9627XXXXXXXX`).
  Future<OtpChallengeModel> sendOtp({required String phone});

  Future<OtpChallengeModel> resendOtp({required String sessionId, required String phone});

  /// `{token, account_type, player, coach, is_new_user, profile_completed}`.
  Future<AuthSessionModel> verifyOtp({
    required String sessionId,
    required String phone,
    required String code,
    String? deviceToken,
    String? platform,
  });

  /// `POST auth/social/{google|apple}` — same payload as OTP verify.
  Future<AuthSessionModel> socialSignIn(SocialCredential credential, {String? deviceToken, String? platform});

  Future<void> logout({String? deviceToken});

  Future<PlayerModel> me();

  /// Coach half of a coach / player_coach session (`GET coach/profile`).
  Future<CoachModel> coachProfile();

  Future<PlayerModel> updateMe(Map<String, dynamic> fields);

  Future<PlayerModel> uploadPhoto(String filePath);

  Future<void> changePassword({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  });

  /// `DELETE auth/me` — permanently deletes the account.
  Future<void> deleteAccount();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<OtpChallengeModel> sendOtp({required String phone}) async {
    final response = await dio.post(ApiEndpoints.otpSend, data: {'phone': phone});
    return OtpChallengeModel.fromJson(ApiEnvelope.map(response));
  }

  @override
  Future<OtpChallengeModel> resendOtp({required String sessionId, required String phone}) async {
    final response = await dio.post(ApiEndpoints.otpResend, data: {'session_id': sessionId, 'phone': phone});
    return OtpChallengeModel.fromJson(ApiEnvelope.map(response));
  }

  @override
  Future<AuthSessionModel> verifyOtp({
    required String sessionId,
    required String phone,
    required String code,
    String? deviceToken,
    String? platform,
  }) async {
    final response = await dio.post(
      ApiEndpoints.otpVerify,
      data: {
        'session_id': sessionId,
        'phone': phone,
        'code': code,
        'device_token': ?deviceToken,
        if (deviceToken != null) 'platform': ?platform,
      },
    );
    return AuthSessionModel.fromJson(ApiEnvelope.map(response));
  }

  @override
  Future<AuthSessionModel> socialSignIn(SocialCredential credential, {String? deviceToken, String? platform}) async {
    final response = await dio.post(
      ApiEndpoints.socialSignIn(credential.provider.apiValue),
      data: {
        'id_token': credential.idToken,
        'authorization_code': ?credential.authorizationCode,
        'nonce': ?credential.nonce,
        'given_name': ?credential.givenName,
        'family_name': ?credential.familyName,
        'device_token': ?deviceToken,
        if (deviceToken != null) 'platform': ?platform,
      },
    );
    return AuthSessionModel.fromJson(ApiEnvelope.map(response));
  }

  @override
  Future<void> logout({String? deviceToken}) async {
    await dio.post(ApiEndpoints.logout, data: {'device_token': ?deviceToken});
  }

  @override
  Future<PlayerModel> me() async {
    final response = await dio.get(ApiEndpoints.me);
    return PlayerModel.fromJson(ApiEnvelope.map(response));
  }

  @override
  Future<CoachModel> coachProfile() async {
    final response = await dio.get(ApiEndpoints.coachProfile);
    return CoachModel.fromJson(ApiEnvelope.map(response));
  }

  @override
  Future<PlayerModel> updateMe(Map<String, dynamic> fields) async {
    final response = await dio.put(ApiEndpoints.me, data: fields);
    return PlayerModel.fromJson(ApiEnvelope.map(response));
  }

  @override
  Future<PlayerModel> uploadPhoto(String filePath) async {
    final form = FormData.fromMap({'photo': await MultipartFile.fromFile(filePath)});
    final response = await dio.post(ApiEndpoints.mePhoto, data: form);
    return PlayerModel.fromJson(ApiEnvelope.map(response));
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    await dio.put(
      ApiEndpoints.password,
      data: {'current_password': currentPassword, 'password': password, 'password_confirmation': passwordConfirmation},
    );
  }

  @override
  Future<void> deleteAccount() async {
    await dio.delete(ApiEndpoints.me);
  }
}
