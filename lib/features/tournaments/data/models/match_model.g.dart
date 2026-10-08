// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IdNameModel _$IdNameModelFromJson(Map<String, dynamic> json) =>
    _IdNameModel(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$IdNameModelToJson(_IdNameModel instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_MatchTeamModel _$MatchTeamModelFromJson(Map<String, dynamic> json) =>
    _MatchTeamModel(
      id: (json['id'] as num).toInt(),
      label: json['label'] as String,
      seed: (json['seed'] as num?)?.toInt(),
      status: json['status'] as String? ?? 'active',
      withdrawalReason: json['withdrawal_reason'] as String?,
      groupId: (json['group_id'] as num?)?.toInt(),
      players:
          (json['players'] as List<dynamic>?)
              ?.map(
                (e) => PlayerSummaryModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$MatchTeamModelToJson(_MatchTeamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'seed': instance.seed,
      'status': instance.status,
      'withdrawal_reason': instance.withdrawalReason,
      'group_id': instance.groupId,
      'players': instance.players.map((e) => e.toJson()).toList(),
    };

_SetScoreModel _$SetScoreModelFromJson(Map<String, dynamic> json) =>
    _SetScoreModel(
      teamOne: (json['team_one'] as num?)?.toInt() ?? 0,
      teamTwo: (json['team_two'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SetScoreModelToJson(_SetScoreModel instance) =>
    <String, dynamic>{
      'team_one': instance.teamOne,
      'team_two': instance.teamTwo,
    };

_GameScoreModel _$GameScoreModelFromJson(Map<String, dynamic> json) =>
    _GameScoreModel(
      teamOne: (json['team_one'] as num?)?.toInt() ?? 0,
      teamTwo: (json['team_two'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$GameScoreModelToJson(_GameScoreModel instance) =>
    <String, dynamic>{
      'team_one': instance.teamOne,
      'team_two': instance.teamTwo,
    };

_PointDisplayModel _$PointDisplayModelFromJson(Map<String, dynamic> json) =>
    _PointDisplayModel(
      teamOne: json['team_one'] == null ? '0' : _str(json['team_one']),
      teamTwo: json['team_two'] == null ? '0' : _str(json['team_two']),
    );

Map<String, dynamic> _$PointDisplayModelToJson(_PointDisplayModel instance) =>
    <String, dynamic>{
      'team_one': instance.teamOne,
      'team_two': instance.teamTwo,
    };

_LiveScoreModel _$LiveScoreModelFromJson(Map<String, dynamic> json) =>
    _LiveScoreModel(
      sets:
          (json['sets'] as List<dynamic>?)
              ?.map((e) => SetScoreModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      currentSetGames: json['current_set_games'] == null
          ? null
          : GameScoreModel.fromJson(
              json['current_set_games'] as Map<String, dynamic>,
            ),
      currentGame: json['current_game'] == null
          ? null
          : GameScoreModel.fromJson(
              json['current_game'] as Map<String, dynamic>,
            ),
      isTiebreak: json['is_tiebreak'] as bool? ?? false,
    );

Map<String, dynamic> _$LiveScoreModelToJson(_LiveScoreModel instance) =>
    <String, dynamic>{
      'sets': instance.sets.map((e) => e.toJson()).toList(),
      'current_set_games': instance.currentSetGames?.toJson(),
      'current_game': instance.currentGame?.toJson(),
      'is_tiebreak': instance.isTiebreak,
    };

_MatchResultModel _$MatchResultModelFromJson(Map<String, dynamic> json) =>
    _MatchResultModel(
      id: (json['id'] as num).toInt(),
      resultType: json['result_type'] as String? ?? 'played',
      verificationStatus: json['verification_status'] as String? ?? 'pending',
      verifiedAt: json['verified_at'] == null
          ? null
          : DateTime.parse(json['verified_at'] as String),
    );

Map<String, dynamic> _$MatchResultModelToJson(_MatchResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'result_type': instance.resultType,
      'verification_status': instance.verificationStatus,
      'verified_at': instance.verifiedAt?.toIso8601String(),
    };

_MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => _MatchModel(
  id: (json['id'] as num).toInt(),
  tournamentId: (json['tournament_id'] as num?)?.toInt(),
  categoryId: (json['category_id'] as num?)?.toInt(),
  category: json['category'] == null
      ? null
      : IdNameModel.fromJson(json['category'] as Map<String, dynamic>),
  group: json['group'] == null
      ? null
      : IdNameModel.fromJson(json['group'] as Map<String, dynamic>),
  tournament: json['tournament'] == null
      ? null
      : IdNameModel.fromJson(json['tournament'] as Map<String, dynamic>),
  round: json['round'] as String?,
  roundLabel: json['round_label'] as String?,
  roundPosition: (json['round_position'] as num?)?.toInt(),
  status: json['status'] as String? ?? 'scheduled',
  isLive: json['is_live'] as bool? ?? false,
  scheduledAt: json['scheduled_at'] == null
      ? null
      : DateTime.parse(json['scheduled_at'] as String),
  startedAt: json['started_at'] == null
      ? null
      : DateTime.parse(json['started_at'] as String),
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  court: json['court'] as String?,
  courtId: (json['court_id'] as num?)?.toInt(),
  teamOne: json['team_one'] == null
      ? null
      : MatchTeamModel.fromJson(json['team_one'] as Map<String, dynamic>),
  teamTwo: json['team_two'] == null
      ? null
      : MatchTeamModel.fromJson(json['team_two'] as Map<String, dynamic>),
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
  version: (json['version'] as num?)?.toInt() ?? 0,
  winnerTeamId: (json['winner_team_id'] as num?)?.toInt(),
  nextMatchId: (json['next_match_id'] as num?)?.toInt(),
  isBye: json['is_bye'] as bool? ?? false,
  result: json['result'] == null
      ? null
      : MatchResultModel.fromJson(json['result'] as Map<String, dynamic>),
  deuceEnabled: json['deuce_enabled'] as bool? ?? true,
  lastPoint: json['last_point'] == null
      ? null
      : PointEventModel.fromJson(json['last_point'] as Map<String, dynamic>),
  endedEarly: json['ended_early'] as bool? ?? false,
);

Map<String, dynamic> _$MatchModelToJson(_MatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tournament_id': instance.tournamentId,
      'category_id': instance.categoryId,
      'category': instance.category?.toJson(),
      'group': instance.group?.toJson(),
      'tournament': instance.tournament?.toJson(),
      'round': instance.round,
      'round_label': instance.roundLabel,
      'round_position': instance.roundPosition,
      'status': instance.status,
      'is_live': instance.isLive,
      'scheduled_at': instance.scheduledAt?.toIso8601String(),
      'started_at': instance.startedAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
      'court': instance.court,
      'court_id': instance.courtId,
      'team_one': instance.teamOne?.toJson(),
      'team_two': instance.teamTwo?.toJson(),
      'sets_won_team_one': instance.setsWonTeamOne,
      'sets_won_team_two': instance.setsWonTeamTwo,
      'live_score': instance.liveScore?.toJson(),
      'current_game_display': instance.currentGameDisplay?.toJson(),
      'version': instance.version,
      'winner_team_id': instance.winnerTeamId,
      'next_match_id': instance.nextMatchId,
      'is_bye': instance.isBye,
      'result': instance.result?.toJson(),
      'deuce_enabled': instance.deuceEnabled,
      'last_point': instance.lastPoint?.toJson(),
      'ended_early': instance.endedEarly,
    };
