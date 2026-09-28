import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/otp_challenge.dart';

part 'otp_challenge_model.freezed.dart';
part 'otp_challenge_model.g.dart';

@freezed
abstract class OtpChallengeModel with _$OtpChallengeModel {
  const factory OtpChallengeModel({
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'masked_phone') String? maskedPhone,
    @JsonKey(name: 'expires_in') @Default(300) int expiresIn,
    @JsonKey(name: 'resend_available_in') @Default(30) int resendAvailableIn,
    @JsonKey(name: 'code_length') @Default(6) int codeLength,
  }) = _OtpChallengeModel;

  factory OtpChallengeModel.fromJson(Map<String, dynamic> json) => _$OtpChallengeModelFromJson(json);
}

extension OtpChallengeModelX on OtpChallengeModel {
  OtpChallenge toEntity() => OtpChallenge(
    sessionId: sessionId,
    maskedPhone: maskedPhone,
    expiresIn: expiresIn,
    resendAvailableIn: resendAvailableIn,
    codeLength: codeLength,
  );
}
