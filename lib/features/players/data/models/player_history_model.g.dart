// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResultRowModel _$ResultRowModelFromJson(
  Map<String, dynamic> json,
) => _ResultRowModel(
  officialResultId: (json['official_result_id'] as num?)?.toInt() ?? 0,
  matchId: (json['match_id'] as num?)?.toInt() ?? 0,
  tournamentId: (json['tournament_id'] as num?)?.toInt() ?? 0,
  tournamentName: json['tournament_name'] as String? ?? '',
  tournamentRanked: json['tournament_ranked'] as bool? ?? false,
  categoryName: json['category_name'] as String?,
  round: json['round'] as String?,
  resultType: json['result_type'] as String? ?? 'played',
  won: json['won'] as bool? ?? false,
  score: json['score'] as String?,
  setsWon: (json['sets_won'] as num?)?.toInt() ?? 0,
  setsLost: (json['sets_lost'] as num?)?.toInt() ?? 0,
  ratingDelta: (json['rating_delta'] as num?)?.toInt(),
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  partner: json['partner'] == null
      ? null
      : PlayerSummaryModel.fromJson(json['partner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ResultRowModelToJson(_ResultRowModel instance) =>
    <String, dynamic>{
      'official_result_id': instance.officialResultId,
      'match_id': instance.matchId,
      'tournament_id': instance.tournamentId,
      'tournament_name': instance.tournamentName,
      'tournament_ranked': instance.tournamentRanked,
      'category_name': instance.categoryName,
      'round': instance.round,
      'result_type': instance.resultType,
      'won': instance.won,
      'score': instance.score,
      'sets_won': instance.setsWon,
      'sets_lost': instance.setsLost,
      'rating_delta': instance.ratingDelta,
      'date': instance.date?.toIso8601String(),
      'partner': instance.partner?.toJson(),
    };

_TournamentHistoryModel _$TournamentHistoryModelFromJson(
  Map<String, dynamic> json,
) => _TournamentHistoryModel(
  tournamentId: (json['tournament_id'] as num).toInt(),
  tournamentName: json['tournament_name'] as String? ?? '',
  categoryId: (json['category_id'] as num?)?.toInt(),
  categoryName: json['category_name'] as String?,
  ranked: json['ranked'] as bool? ?? false,
  bestRound: json['best_round'] as String?,
  placement: json['placement'] as String?,
  matches: (json['matches'] as num?)?.toInt() ?? 0,
  wins: (json['wins'] as num?)?.toInt() ?? 0,
  lastPlayedAt: json['last_played_at'] == null
      ? null
      : DateTime.parse(json['last_played_at'] as String),
);

Map<String, dynamic> _$TournamentHistoryModelToJson(
  _TournamentHistoryModel instance,
) => <String, dynamic>{
  'tournament_id': instance.tournamentId,
  'tournament_name': instance.tournamentName,
  'category_id': instance.categoryId,
  'category_name': instance.categoryName,
  'ranked': instance.ranked,
  'best_round': instance.bestRound,
  'placement': instance.placement,
  'matches': instance.matches,
  'wins': instance.wins,
  'last_played_at': instance.lastPlayedAt?.toIso8601String(),
};

_ChallengeModel _$ChallengeModelFromJson(Map<String, dynamic> json) =>
    _ChallengeModel(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String? ?? 'pending',
      message: json['message'] as String?,
      challenger: PlayerSummaryModel.fromJson(
        json['challenger'] as Map<String, dynamic>,
      ),
      challenged: PlayerSummaryModel.fromJson(
        json['challenged'] as Map<String, dynamic>,
      ),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ChallengeModelToJson(_ChallengeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'message': instance.message,
      'challenger': instance.challenger.toJson(),
      'challenged': instance.challenged.toJson(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
