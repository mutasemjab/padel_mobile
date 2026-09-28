import 'package:equatable/equatable.dart';

import 'match.dart';

/// What triggered a score broadcast. Drives the live-screen animation.
enum LiveEventType {
  point,
  game,
  set,
  matchCompleted,
  undo,
  correction,
  detailsUpdated,
  statusChanged,
  unknown;

  static LiveEventType fromApi(String? raw) => switch (raw) {
        'point' => LiveEventType.point,
        'game' => LiveEventType.game,
        'set' => LiveEventType.set,
        'match_completed' => LiveEventType.matchCompleted,
        'undo' => LiveEventType.undo,
        'correction' => LiveEventType.correction,
        'details_updated' => LiveEventType.detailsUpdated,
        'status_changed' => LiveEventType.statusChanged,
        _ => LiveEventType.unknown,
      };

  /// Events allowed to move `version` backwards.
  bool get mayRewind => this == LiveEventType.undo || this == LiveEventType.correction;
}

/// One recorded point (`GET matches/{id}/points` and `last_point`).
class PointEvent extends Equatable {
  final int id;
  final int sequence;
  final int? winningTeamId;
  final String? endingType;

  /// `player_id` string (e.g. PDL-000012), not a numeric id.
  final String? primaryPlayerId;
  final String? shotType;
  final String? errorType;
  final String? serveOutcome;

  /// `full | partial` — how much detail the scorekeeper captured.
  final String? coverage;
  final Map<String, dynamic>? scoreBefore;
  final Map<String, dynamic>? scoreAfter;
  final bool isVoided;
  final int? correctedFromId;
  final DateTime? recordedAt;

  const PointEvent({
    required this.id,
    required this.sequence,
    this.winningTeamId,
    this.endingType,
    this.primaryPlayerId,
    this.shotType,
    this.errorType,
    this.serveOutcome,
    this.coverage,
    this.scoreBefore,
    this.scoreAfter,
    this.isVoided = false,
    this.correctedFromId,
    this.recordedAt,
  });

  @override
  List<Object?> get props => [
        id,
        sequence,
        winningTeamId,
        endingType,
        primaryPlayerId,
        shotType,
        errorType,
        serveOutcome,
        coverage,
        scoreBefore,
        scoreAfter,
        isVoided,
        correctedFromId,
        recordedAt,
      ];
}

/// The `score.updated` realtime payload — identical to the polling fallback
/// `GET matches/{id}/live` (which adds [changed] and a poll interval).
class LivePayload extends Equatable {
  final LiveEventType event;
  final int matchId;
  final int? tournamentId;
  final int? categoryId;
  final MatchStatus status;
  final int version;
  final int? teamOneId;
  final int? teamTwoId;
  final int setsWonTeamOne;
  final int setsWonTeamTwo;
  final LiveScore? liveScore;
  final PointDisplay? currentGameDisplay;
  final int? winnerTeamId;
  final PointEvent? lastPoint;
  final DateTime? serverTime;

  /// Polling only: false when nothing changed since `since_version`.
  final bool changed;

  /// Polling only: the backend's suggested interval.
  final int? pollIntervalSeconds;

  const LivePayload({
    required this.event,
    required this.matchId,
    this.tournamentId,
    this.categoryId,
    required this.status,
    required this.version,
    this.teamOneId,
    this.teamTwoId,
    this.setsWonTeamOne = 0,
    this.setsWonTeamTwo = 0,
    this.liveScore,
    this.currentGameDisplay,
    this.winnerTeamId,
    this.lastPoint,
    this.serverTime,
    this.changed = true,
    this.pollIntervalSeconds,
  });

  /// Applies this payload to [match] in place — no refetch.
  Match applyTo(Match match) => match.copyWith(
        status: status,
        isLive: status == MatchStatus.inProgress,
        setsWonTeamOne: setsWonTeamOne,
        setsWonTeamTwo: setsWonTeamTwo,
        liveScore: liveScore,
        currentGameDisplay: currentGameDisplay,
        version: version,
        winnerTeamId: winnerTeamId,
      );

  @override
  List<Object?> get props => [
        event,
        matchId,
        tournamentId,
        categoryId,
        status,
        version,
        teamOneId,
        teamTwoId,
        setsWonTeamOne,
        setsWonTeamTwo,
        liveScore,
        currentGameDisplay,
        winnerTeamId,
        lastPoint,
        serverTime,
        changed,
        pollIntervalSeconds,
      ];
}
