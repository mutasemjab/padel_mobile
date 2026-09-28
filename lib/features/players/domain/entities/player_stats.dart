import 'package:equatable/equatable.dart';

enum StreakType { win, loss }

class StreakInfo extends Equatable {
  final StreakType? type;
  final int count;

  const StreakInfo({this.type, this.count = 0});

  @override
  List<Object?> get props => [type, count];
}

/// Verified competitive record. `winRate` is null with 0 matches — show "—".
class PlayerStats extends Equatable {
  final int matchesPlayed;
  final int wins;
  final int losses;
  final double? winRate;
  final int walkoverWins;
  final int walkoverLosses;
  final int setsWon;
  final int setsLost;
  final int gamesWon;
  final int gamesLost;
  final StreakInfo currentStreak;
  final int bestWinStreak;
  final int tournamentsPlayed;
  final int titles;
  final int finalsReached;
  final DateTime? lastPlayedAt;

  const PlayerStats({
    this.matchesPlayed = 0,
    this.wins = 0,
    this.losses = 0,
    this.winRate,
    this.walkoverWins = 0,
    this.walkoverLosses = 0,
    this.setsWon = 0,
    this.setsLost = 0,
    this.gamesWon = 0,
    this.gamesLost = 0,
    this.currentStreak = const StreakInfo(),
    this.bestWinStreak = 0,
    this.tournamentsPlayed = 0,
    this.titles = 0,
    this.finalsReached = 0,
    this.lastPlayedAt,
  });

  @override
  List<Object?> get props => [
        matchesPlayed,
        wins,
        losses,
        winRate,
        walkoverWins,
        walkoverLosses,
        setsWon,
        setsLost,
        gamesWon,
        gamesLost,
        currentStreak,
        bestWinStreak,
        tournamentsPlayed,
        titles,
        finalsReached,
        lastPlayedAt,
      ];
}

class WinRecord extends Equatable {
  final int matches;
  final int wins;

  const WinRecord({this.matches = 0, this.wins = 0});

  double? get rate => matches == 0 ? null : wins / matches;

  @override
  List<Object?> get props => [matches, wins];
}

class PointStats extends Equatable {
  final int totalPoints;

  /// 0–1 share of points with shot/error detail. Below ~0.3 = limited data.
  final double? coverage;
  final int attributedPoints;
  final Map<String, int> winnersByShot;
  final Map<String, int> errorsByType;

  const PointStats({
    this.totalPoints = 0,
    this.coverage,
    this.attributedPoints = 0,
    this.winnersByShot = const {},
    this.errorsByType = const {},
  });

  bool get isLimited => (coverage ?? 0) < 0.3;

  @override
  List<Object?> get props => [totalPoints, coverage, attributedPoints, winnersByShot, errorsByType];
}

class RatingPoint extends Equatable {
  final int rating;
  final DateTime date;

  const RatingPoint({required this.rating, required this.date});

  @override
  List<Object?> get props => [rating, date];
}

/// Premium-owner-only analytics block.
class AdvancedStats extends Equatable {
  final Map<String, WinRecord> byStage;
  final WinRecord decidingSets;
  final Map<String, WinRecord> byCompetition;
  final PointStats pointStats;
  final List<RatingPoint> ratingTimeline;

  const AdvancedStats({
    this.byStage = const {},
    this.decidingSets = const WinRecord(),
    this.byCompetition = const {},
    this.pointStats = const PointStats(),
    this.ratingTimeline = const [],
  });

  @override
  List<Object?> get props => [byStage, decidingSets, byCompetition, pointStats, ratingTimeline];
}

/// `GET players/{id}/stats`.
class PlayerStatsBundle extends Equatable {
  final PlayerStats summary;
  final bool advancedAvailable;
  final AdvancedStats? advanced;

  const PlayerStatsBundle({required this.summary, required this.advancedAvailable, this.advanced});

  @override
  List<Object?> get props => [summary, advancedAvailable, advanced];
}
