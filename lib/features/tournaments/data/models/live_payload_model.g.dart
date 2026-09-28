// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_payload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PointEventModel _$PointEventModelFromJson(Map<String, dynamic> json) =>
    _PointEventModel(
      id: (json['id'] as num).toInt(),
      sequence: (json['sequence'] as num?)?.toInt() ?? 0,
      winningTeamId: (json['winning_team_id'] as num?)?.toInt(),
      endingType: json['ending_type'] as String?,
      primaryPlayerId: json['primary_player_id'] as String?,
      shotType: json['shot_type'] as String?,
      errorType: json['error_type'] as String?,
      serveOutcome: json['serve_outcome'] as String?,
      coverage: json['coverage'] as String?,
      scoreBefore: json['score_before'] as Map<String, dynamic>?,
      scoreAfter: json['score_after'] as Map<String, dynamic>?,
      isVoided: json['is_voided'] as bool? ?? false,
      correctedFromId: (json['corrected_from_id'] as num?)?.toInt(),
      recordedAt: json['recorded_at'] == null
          ? null
          : DateTime.parse(json['recorded_at'] as String),
    );

Map<String, dynamic> _$PointEventModelToJson(_PointEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sequence': instance.sequence,
      'winning_team_id': instance.winningTeamId,
      'ending_type': instance.endingType,
      'primary_player_id': instance.primaryPlayerId,
      'shot_type': instance.shotType,
      'error_type': instance.errorType,
      'serve_outcome': instance.serveOutcome,
      'coverage': instance.coverage,
      'score_before': instance.scoreBefore,
      'score_after': instance.scoreAfter,
      'is_voided': instance.isVoided,
      'corrected_from_id': instance.correctedFromId,
      'recorded_at': instance.recordedAt?.toIso8601String(),
    };

_LivePayloadModel _$LivePayloadModelFromJson(Map<String, dynamic> json) =>
    _LivePayloadModel(
      event: json['event'] as String?,
      matchId: (json['match_id'] as num).toInt(),
      tournamentId: (json['tournament_id'] as num?)?.toInt(),
      categoryId: (json['category_id'] as num?)?.toInt(),
      status: json['status'] as String? ?? 'scheduled',
      version: (json['version'] as num?)?.toInt() ?? 0,
      teamOneId: (json['team_one_id'] as num?)?.toInt(),
      teamTwoId: (json['team_two_id'] as num?)?.toInt(),
      setsWonTeamOne: (json['sets_won_team_one'] as num?)?.toInt() ?? 0,
      setsWonTeamTwo: (json['sets_won_team_two'] as num?)?.toInt() ?? 0,
      liveScore: json['live_score'] == null
          ? null
          : LiveScoreModel.fromJson(json['live_score'] as Map<String, dynamic>),
      currentGameDisplay: json['current_game_display'] == null
          ? null
          : PointDisplayModel.fromJson(
              json['current_game_display'] as Map<String, dynamic>,
            ),
      winnerTeamId: (json['winner_team_id'] as num?)?.toInt(),
      lastPoint: json['last_point'] == null
          ? null
          : PointEventModel.fromJson(
              json['last_point'] as Map<String, dynamic>,
            ),
      serverTime: json['server_time'] == null
          ? null
          : DateTime.parse(json['server_time'] as String),
      changed: json['changed'] as bool? ?? true,
    );

Map<String, dynamic> _$LivePayloadModelToJson(_LivePayloadModel instance) =>
    <String, dynamic>{
      'event': instance.event,
      'match_id': instance.matchId,
      'tournament_id': instance.tournamentId,
      'category_id': instance.categoryId,
      'status': instance.status,
      'version': instance.version,
      'team_one_id': instance.teamOneId,
      'team_two_id': instance.teamTwoId,
      'sets_won_team_one': instance.setsWonTeamOne,
      'sets_won_team_two': instance.setsWonTeamTwo,
      'live_score': instance.liveScore?.toJson(),
      'current_game_display': instance.currentGameDisplay?.toJson(),
      'winner_team_id': instance.winnerTeamId,
      'last_point': instance.lastPoint?.toJson(),
      'server_time': instance.serverTime?.toIso8601String(),
      'changed': instance.changed,
    };
