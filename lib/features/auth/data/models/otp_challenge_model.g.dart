// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OtpChallengeModel _$OtpChallengeModelFromJson(Map<String, dynamic> json) =>
    _OtpChallengeModel(
      sessionId: json['session_id'] as String,
      maskedPhone: json['masked_phone'] as String?,
      expiresIn: (json['expires_in'] as num?)?.toInt() ?? 300,
      resendAvailableIn: (json['resend_available_in'] as num?)?.toInt() ?? 30,
      codeLength: (json['code_length'] as num?)?.toInt() ?? 6,
    );

Map<String, dynamic> _$OtpChallengeModelToJson(_OtpChallengeModel instance) =>
    <String, dynamic>{
      'session_id': instance.sessionId,
      'masked_phone': instance.maskedPhone,
      'expires_in': instance.expiresIn,
      'resend_available_in': instance.resendAvailableIn,
      'code_length': instance.codeLength,
    };
