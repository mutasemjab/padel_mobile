import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/duo_media.dart';

part 'duo_media_model.freezed.dart';
part 'duo_media_model.g.dart';

@freezed
abstract class DuoMediaModel with _$DuoMediaModel {
  const factory DuoMediaModel({
    required int id,
    @Default('queued') String status,
    @JsonKey(name: 'media_type') @Default('video') String mediaType,
    @JsonKey(name: 'media_url') String? mediaUrl,
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    String? error,
    @JsonKey(name: 'requested_at') DateTime? requestedAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
  }) = _DuoMediaModel;

  factory DuoMediaModel.fromJson(Map<String, dynamic> json) => _$DuoMediaModelFromJson(json);
}

extension DuoMediaModelX on DuoMediaModel {
  DuoMedia toEntity() => DuoMedia(
    id: id,
    status: DuoMediaStatus.fromApi(status),
    mediaType: DuoMediaType.fromApi(mediaType),
    mediaUrl: mediaUrl,
    thumbnailUrl: thumbnailUrl,
    error: error,
    requestedAt: requestedAt,
    completedAt: completedAt,
  );
}

@freezed
abstract class DuoMediaStateModel with _$DuoMediaStateModel {
  const factory DuoMediaStateModel({
    @JsonKey(name: 'provider_configured') @Default(false) bool providerConfigured,
    @JsonKey(name: 'requires_photos') @Default(false) bool requiresPhotos,
    DuoMediaModel? current,
    @JsonKey(name: 'latest_completed') DuoMediaModel? latestCompleted,
  }) = _DuoMediaStateModel;

  factory DuoMediaStateModel.fromJson(Map<String, dynamic> json) => _$DuoMediaStateModelFromJson(json);
}

extension DuoMediaStateModelX on DuoMediaStateModel {
  DuoMediaState toEntity() => DuoMediaState(
    providerConfigured: providerConfigured,
    requiresPhotos: requiresPhotos,
    current: current?.toEntity(),
    latestCompleted: latestCompleted?.toEntity(),
  );
}
