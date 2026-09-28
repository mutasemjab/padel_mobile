import 'package:equatable/equatable.dart';

import '../../../../core/models/player_summary.dart';

/// The three boards are never mixed in one column.
enum RankingType {
  season,
  skill,
  xp;

  String get apiValue => name;
}

class TrendPoint extends Equatable {
  final DateTime date;
  final num value;
  final int? position;

  const TrendPoint({required this.date, required this.value, this.position});

  @override
  List<Object?> get props => [date, value, position];
}

/// A single leaderboard row. Independent of the players feature's `Player`
/// entity — this is a read-only ranking snapshot, not a full profile.
class RankingEntry extends Equatable {
  final String playerId;
  final String name;
  final String? photoUrl;
  final String level;
  final int skillRating;
  final int seasonRankingPoints;
  final int? seasonPoints;
  final int xp;
  final String? country;
  final String? side;
  final bool isPremium;
  final int? position;
  final int? previousPosition;

  /// > 0 moved up since the last daily snapshot; null = no snapshot yet
  /// (render nothing, never "0").
  final int? movement;
  final List<TrendPoint> trend;

  const RankingEntry({
    required this.playerId,
    required this.name,
    this.photoUrl,
    required this.level,
    required this.skillRating,
    required this.seasonRankingPoints,
    this.seasonPoints,
    this.xp = 0,
    this.country,
    this.side,
    this.isPremium = false,
    this.position,
    this.previousPosition,
    this.movement,
    this.trend = const [],
  });

  /// The value shown for [type] — exactly one metric per board.
  num valueFor(RankingType type) => switch (type) {
        RankingType.season => seasonPoints ?? seasonRankingPoints,
        RankingType.skill => skillRating,
        RankingType.xp => xp,
      };

  PlayerSummary toSummary() => PlayerSummary(
        playerId: playerId,
        name: name,
        photoUrl: photoUrl,
        level: level,
        skillRating: skillRating,
        side: side,
        country: country,
        isPremium: isPremium,
      );

  @override
  List<Object?> get props => [
        playerId,
        name,
        photoUrl,
        level,
        skillRating,
        seasonRankingPoints,
        seasonPoints,
        xp,
        country,
        side,
        isPremium,
        position,
        previousPosition,
        movement,
        trend,
      ];
}

class Season extends Equatable {
  final String code;
  final String name;
  final DateTime? startsOn;
  final DateTime? endsOn;
  final bool isActive;

  const Season({required this.code, required this.name, this.startsOn, this.endsOn, this.isActive = false});

  @override
  List<Object?> get props => [code, name, startsOn, endsOn, isActive];
}

/// `GET me/ranking` — the sticky "you" row.
class MyRanking extends Equatable {
  final String? season;
  final int seasonPoints;
  final int? seasonPosition;
  final int? seasonMovement;
  final int skillRating;
  final String? level;
  final int? skillPosition;
  final int? levelPosition;
  final int? skillMovement;
  final int xp;
  final int? xpPosition;

  const MyRanking({
    this.season,
    this.seasonPoints = 0,
    this.seasonPosition,
    this.seasonMovement,
    this.skillRating = 0,
    this.level,
    this.skillPosition,
    this.levelPosition,
    this.skillMovement,
    this.xp = 0,
    this.xpPosition,
  });

  int? positionFor(RankingType type) => switch (type) {
        RankingType.season => seasonPosition,
        RankingType.skill => skillPosition,
        RankingType.xp => xpPosition,
      };

  int? movementFor(RankingType type) => switch (type) {
        RankingType.season => seasonMovement,
        RankingType.skill => skillMovement,
        RankingType.xp => null,
      };

  num valueFor(RankingType type) => switch (type) {
        RankingType.season => seasonPoints,
        RankingType.skill => skillRating,
        RankingType.xp => xp,
      };

  @override
  List<Object?> get props => [
        season,
        seasonPoints,
        seasonPosition,
        seasonMovement,
        skillRating,
        level,
        skillPosition,
        levelPosition,
        skillMovement,
        xp,
        xpPosition,
      ];
}
