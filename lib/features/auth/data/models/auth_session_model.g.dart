// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthSessionModel _$AuthSessionModelFromJson(Map<String, dynamic> json) =>
    _AuthSessionModel(
      token: json['token'] as String,
      accountType: json['account_type'] as String? ?? 'player',
      player: json['player'] == null
          ? null
          : PlayerModel.fromJson(json['player'] as Map<String, dynamic>),
      coach: json['coach'] == null
          ? null
          : CoachModel.fromJson(json['coach'] as Map<String, dynamic>),
      isNewUser: json['is_new_user'] as bool? ?? false,
      profileCompleted: json['profile_completed'] as bool? ?? true,
    );

Map<String, dynamic> _$AuthSessionModelToJson(_AuthSessionModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'account_type': instance.accountType,
      'player': instance.player?.toJson(),
      'coach': instance.coach?.toJson(),
      'is_new_user': instance.isNewUser,
      'profile_completed': instance.profileCompleted,
    };
