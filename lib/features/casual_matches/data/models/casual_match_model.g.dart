// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casual_match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CasualParticipantModel _$CasualParticipantModelFromJson(
  Map<String, dynamic> json,
) => _CasualParticipantModel(
  id: (json['id'] as num).toInt(),
  status: json['status'] as String? ?? 'requested',
  player: json['player'] == null
      ? null
      : PlayerSummaryModel.fromJson(json['player'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CasualParticipantModelToJson(
  _CasualParticipantModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'player': instance.player?.toJson(),
};

_CasualMatchModel _$CasualMatchModelFromJson(Map<String, dynamic> json) =>
    _CasualMatchModel(
      id: (json['id'] as num).toInt(),
      creator: PlayerSummaryModel.fromJson(
        json['creator'] as Map<String, dynamic>,
      ),
      venue: json['venue'] == null
          ? null
          : VenueModel.fromJson(json['venue'] as Map<String, dynamic>),
      court: json['court'] == null
          ? null
          : CourtModel.fromJson(json['court'] as Map<String, dynamic>),
      matchType: json['match_type'] as String,
      scheduledAt: DateTime.parse(json['scheduled_at'] as String),
      requiredLevel: json['required_level'] as String?,
      preferredSide: json['preferred_side'] as String?,
      playersNeeded: (json['players_needed'] as num?)?.toInt() ?? 0,
      acceptedCount: (json['accepted_count'] as num?)?.toInt() ?? 0,
      spotsLeft: (json['spots_left'] as num?)?.toInt(),
      status: json['status'] as String? ?? 'open',
      notes: json['notes'] as String?,
      isCreator: json['is_creator'] as bool? ?? false,
      myParticipation: json['my_participation'] == null
          ? null
          : CasualParticipantModel.fromJson(
              json['my_participation'] as Map<String, dynamic>,
            ),
      participants:
          (json['participants'] as List<dynamic>?)
              ?.map(
                (e) =>
                    CasualParticipantModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CasualMatchModelToJson(_CasualMatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creator': instance.creator.toJson(),
      'venue': instance.venue?.toJson(),
      'court': instance.court?.toJson(),
      'match_type': instance.matchType,
      'scheduled_at': instance.scheduledAt.toIso8601String(),
      'required_level': instance.requiredLevel,
      'preferred_side': instance.preferredSide,
      'players_needed': instance.playersNeeded,
      'accepted_count': instance.acceptedCount,
      'spots_left': instance.spotsLeft,
      'status': instance.status,
      'notes': instance.notes,
      'is_creator': instance.isCreator,
      'my_participation': instance.myParticipation?.toJson(),
      'participants': instance.participants.map((e) => e.toJson()).toList(),
    };
