// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duo_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DuoMediaModel _$DuoMediaModelFromJson(Map<String, dynamic> json) => _DuoMediaModel(
  id: (json['id'] as num).toInt(),
  status: json['status'] as String? ?? 'queued',
  mediaType: json['media_type'] as String? ?? 'video',
  mediaUrl: json['media_url'] as String?,
  thumbnailUrl: json['thumbnail_url'] as String?,
  error: json['error'] as String?,
  requestedAt: json['requested_at'] == null ? null : DateTime.parse(json['requested_at'] as String),
  completedAt: json['completed_at'] == null ? null : DateTime.parse(json['completed_at'] as String),
);

Map<String, dynamic> _$DuoMediaModelToJson(_DuoMediaModel instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'media_type': instance.mediaType,
  'media_url': instance.mediaUrl,
  'thumbnail_url': instance.thumbnailUrl,
  'error': instance.error,
  'requested_at': instance.requestedAt?.toIso8601String(),
  'completed_at': instance.completedAt?.toIso8601String(),
};

_DuoMediaStateModel _$DuoMediaStateModelFromJson(Map<String, dynamic> json) => _DuoMediaStateModel(
  providerConfigured: json['provider_configured'] as bool? ?? false,
  requiresPhotos: json['requires_photos'] as bool? ?? false,
  current: json['current'] == null ? null : DuoMediaModel.fromJson(json['current'] as Map<String, dynamic>),
  latestCompleted: json['latest_completed'] == null
      ? null
      : DuoMediaModel.fromJson(json['latest_completed'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DuoMediaStateModelToJson(_DuoMediaStateModel instance) => <String, dynamic>{
  'provider_configured': instance.providerConfigured,
  'requires_photos': instance.requiresPhotos,
  'current': instance.current?.toJson(),
  'latest_completed': instance.latestCompleted?.toJson(),
};
