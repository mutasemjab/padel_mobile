import 'package:equatable/equatable.dart';

import '../../../../core/models/player_summary.dart';

/// One verified official result from the player's point of view.
class ResultRow extends Equatable {
  final int officialResultId;
  final int matchId;
  final int tournamentId;
  final String tournamentName;
  final bool tournamentRanked;
  final String? categoryName;
  final String? round;
  final String resultType;
  final bool won;

  /// Pre-formatted by the backend, e.g. "6-4 6-2".
  final String? score;
  final int setsWon;
  final int setsLost;

  /// Null when the result didn't move the rating (unranked / pending).
  final int? ratingDelta;
  final DateTime? date;
  final PlayerSummary? partner;

  const ResultRow({
    required this.officialResultId,
    required this.matchId,
    required this.tournamentId,
    required this.tournamentName,
    required this.tournamentRanked,
    this.categoryName,
    this.round,
    required this.resultType,
    required this.won,
    this.score,
    this.setsWon = 0,
    this.setsLost = 0,
    this.ratingDelta,
    this.date,
    this.partner,
  });

  @override
  List<Object?> get props => [
        officialResultId,
        matchId,
        tournamentId,
        tournamentName,
        tournamentRanked,
        categoryName,
        round,
        resultType,
        won,
        score,
        setsWon,
        setsLost,
        ratingDelta,
        date,
        partner,
      ];
}

/// One Skill Rating change with its auditable calculation breakdown.
class RatingHistoryEntry extends Equatable {
  final int id;
  final int ratingBefore;
  final int ratingAfter;
  final int delta;

  /// `official_result | correction_reversal | inactivity`.
  final String reason;
  final int? officialResultId;
  final int? tournamentId;
  final String? tournamentName;
  final Map<String, dynamic>? breakdown;
  final DateTime? createdAt;

  const RatingHistoryEntry({
    required this.id,
    required this.ratingBefore,
    required this.ratingAfter,
    required this.delta,
    required this.reason,
    this.officialResultId,
    this.tournamentId,
    this.tournamentName,
    this.breakdown,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        ratingBefore,
        ratingAfter,
        delta,
        reason,
        officialResultId,
        tournamentId,
        tournamentName,
        breakdown,
        createdAt,
      ];
}

class SeasonPointsEntry extends Equatable {
  final int id;
  final String season;
  final int points;
  final String? stage;
  final num? weight;
  final String? reason;
  final String? tournamentName;
  final int? tournamentId;
  final String? categoryName;
  final DateTime? createdAt;

  const SeasonPointsEntry({
    required this.id,
    required this.season,
    required this.points,
    this.stage,
    this.weight,
    this.reason,
    this.tournamentName,
    this.tournamentId,
    this.categoryName,
    this.createdAt,
  });

  @override
  List<Object?> get props =>
      [id, season, points, stage, weight, reason, tournamentName, tournamentId, categoryName, createdAt];
}

class SeasonHistory extends Equatable {
  final String season;
  final int points;
  final Map<String, int> seasons;
  final List<SeasonPointsEntry> entries;

  const SeasonHistory({
    required this.season,
    required this.points,
    required this.seasons,
    required this.entries,
  });

  @override
  List<Object?> get props => [season, points, seasons, entries];
}

class TournamentHistoryEntry extends Equatable {
  final int tournamentId;
  final String tournamentName;
  final int? categoryId;
  final String? categoryName;
  final bool ranked;
  final String? bestRound;

  /// `champion | finalist | reached_semi_final | …`
  final String? placement;
  final int matches;
  final int wins;
  final DateTime? lastPlayedAt;

  const TournamentHistoryEntry({
    required this.tournamentId,
    required this.tournamentName,
    this.categoryId,
    this.categoryName,
    required this.ranked,
    this.bestRound,
    this.placement,
    this.matches = 0,
    this.wins = 0,
    this.lastPlayedAt,
  });

  @override
  List<Object?> get props => [
        tournamentId,
        tournamentName,
        categoryId,
        categoryName,
        ranked,
        bestRound,
        placement,
        matches,
        wins,
        lastPlayedAt,
      ];
}

class Challenge extends Equatable {
  final int id;
  final String status;
  final String? message;
  final PlayerSummary challenger;
  final PlayerSummary challenged;
  final DateTime? createdAt;

  const Challenge({
    required this.id,
    required this.status,
    this.message,
    required this.challenger,
    required this.challenged,
    this.createdAt,
  });

  bool get isPending => status == 'pending';

  @override
  List<Object?> get props => [id, status, message, challenger, challenged, createdAt];
}
