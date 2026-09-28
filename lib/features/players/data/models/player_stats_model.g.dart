// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_stats_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayerStatsModel _$PlayerStatsModelFromJson(Map<String, dynamic> json) =>
    _PlayerStatsModel(
      matchesPlayed: (json['matches_played'] as num?)?.toInt() ?? 0,
      wins: (json['wins'] as num?)?.toInt() ?? 0,
      losses: (json['losses'] as num?)?.toInt() ?? 0,
      winRate: json['win_rate'] as num?,
      walkoverWins: (json['walkover_wins'] as num?)?.toInt() ?? 0,
      walkoverLosses: (json['walkover_losses'] as num?)?.toInt() ?? 0,
      setsWon: (json['sets_won'] as num?)?.toInt() ?? 0,
      setsLost: (json['sets_lost'] as num?)?.toInt() ?? 0,
      gamesWon: (json['games_won'] as num?)?.toInt() ?? 0,
      gamesLost: (json['games_lost'] as num?)?.toInt() ?? 0,
      currentStreak: json['current_streak'] as Map<String, dynamic>?,
      bestWinStreak: (json['best_win_streak'] as num?)?.toInt() ?? 0,
      tournamentsPlayed: (json['tournaments_played'] as num?)?.toInt() ?? 0,
      titles: (json['titles'] as num?)?.toInt() ?? 0,
      finalsReached: (json['finals_reached'] as num?)?.toInt() ?? 0,
      lastPlayedAt: json['last_played_at'] == null
          ? null
          : DateTime.parse(json['last_played_at'] as String),
    );

Map<String, dynamic> _$PlayerStatsModelToJson(_PlayerStatsModel instance) =>
    <String, dynamic>{
      'matches_played': instance.matchesPlayed,
      'wins': instance.wins,
      'losses': instance.losses,
      'win_rate': instance.winRate,
      'walkover_wins': instance.walkoverWins,
      'walkover_losses': instance.walkoverLosses,
      'sets_won': instance.setsWon,
      'sets_lost': instance.setsLost,
      'games_won': instance.gamesWon,
      'games_lost': instance.gamesLost,
      'current_streak': instance.currentStreak,
      'best_win_streak': instance.bestWinStreak,
      'tournaments_played': instance.tournamentsPlayed,
      'titles': instance.titles,
      'finals_reached': instance.finalsReached,
      'last_played_at': instance.lastPlayedAt?.toIso8601String(),
    };
