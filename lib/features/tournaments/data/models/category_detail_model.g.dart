// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StandingRowModel _$StandingRowModelFromJson(Map<String, dynamic> json) =>
    _StandingRowModel(
      position: (json['position'] as num?)?.toInt() ?? 0,
      team: MatchTeamModel.fromJson(json['team'] as Map<String, dynamic>),
      played: (json['played'] as num?)?.toInt() ?? 0,
      wins: (json['wins'] as num?)?.toInt() ?? 0,
      losses: (json['losses'] as num?)?.toInt() ?? 0,
      points: (json['points'] as num?)?.toInt() ?? 0,
      setsWon: (json['sets_won'] as num?)?.toInt() ?? 0,
      setsLost: (json['sets_lost'] as num?)?.toInt() ?? 0,
      setDifference: (json['set_difference'] as num?)?.toInt() ?? 0,
      gamesWon: (json['games_won'] as num?)?.toInt() ?? 0,
      gamesLost: (json['games_lost'] as num?)?.toInt() ?? 0,
      gameDifference: (json['game_difference'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$StandingRowModelToJson(_StandingRowModel instance) =>
    <String, dynamic>{
      'position': instance.position,
      'team': instance.team.toJson(),
      'played': instance.played,
      'wins': instance.wins,
      'losses': instance.losses,
      'points': instance.points,
      'sets_won': instance.setsWon,
      'sets_lost': instance.setsLost,
      'set_difference': instance.setDifference,
      'games_won': instance.gamesWon,
      'games_lost': instance.gamesLost,
      'game_difference': instance.gameDifference,
    };

_CategoryGroupModel _$CategoryGroupModelFromJson(Map<String, dynamic> json) =>
    _CategoryGroupModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      finished: json['finished'] as bool? ?? false,
      standings:
          (json['standings'] as List<dynamic>?)
              ?.map((e) => StandingRowModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      matches:
          (json['matches'] as List<dynamic>?)
              ?.map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$CategoryGroupModelToJson(_CategoryGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'finished': instance.finished,
      'standings': instance.standings.map((e) => e.toJson()).toList(),
      'matches': instance.matches.map((e) => e.toJson()).toList(),
    };

_BracketRoundModel _$BracketRoundModelFromJson(Map<String, dynamic> json) =>
    _BracketRoundModel(
      round: json['round'] as String,
      roundLabel: json['round_label'] as String?,
      matches:
          (json['matches'] as List<dynamic>?)
              ?.map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BracketRoundModelToJson(_BracketRoundModel instance) =>
    <String, dynamic>{
      'round': instance.round,
      'round_label': instance.roundLabel,
      'matches': instance.matches.map((e) => e.toJson()).toList(),
    };

_CategoryDetailModel _$CategoryDetailModelFromJson(
  Map<String, dynamic> json,
) => _CategoryDetailModel(
  category: TournamentCategoryModel.fromJson(
    json['category'] as Map<String, dynamic>,
  ),
  teams:
      (json['teams'] as List<dynamic>?)
          ?.map((e) => MatchTeamModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  groups:
      (json['groups'] as List<dynamic>?)
          ?.map((e) => CategoryGroupModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  bracket:
      (json['bracket'] as List<dynamic>?)
          ?.map((e) => BracketRoundModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CategoryDetailModelToJson(
  _CategoryDetailModel instance,
) => <String, dynamic>{
  'category': instance.category.toJson(),
  'teams': instance.teams.map((e) => e.toJson()).toList(),
  'groups': instance.groups.map((e) => e.toJson()).toList(),
  'bracket': instance.bracket.map((e) => e.toJson()).toList(),
};

_EligibilityModel _$EligibilityModelFromJson(Map<String, dynamic> json) =>
    _EligibilityModel(
      registrationOpen: json['registration_open'] as bool? ?? false,
      isFull: json['is_full'] as bool? ?? false,
      playerIssues:
          (json['player_issues'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      partnerIssues: (json['partner_issues'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requiresPayment: json['requires_payment'] as bool? ?? false,
      registrationFee: json['registration_fee'] as num? ?? 0,
    );

Map<String, dynamic> _$EligibilityModelToJson(_EligibilityModel instance) =>
    <String, dynamic>{
      'registration_open': instance.registrationOpen,
      'is_full': instance.isFull,
      'player_issues': instance.playerIssues,
      'partner_issues': instance.partnerIssues,
      'requires_payment': instance.requiresPayment,
      'registration_fee': instance.registrationFee,
    };
