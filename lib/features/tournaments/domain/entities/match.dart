import 'package:equatable/equatable.dart';

import '../../../../core/models/player_summary.dart';
import 'live_payload.dart';

enum MatchStatus { scheduled, inProgress, completed, walkover, cancelled }

extension MatchStatusX on MatchStatus {
  static MatchStatus fromApi(String? raw) {
    switch (raw) {
      case 'in_progress':
        return MatchStatus.inProgress;
      case 'completed':
        return MatchStatus.completed;
      case 'walkover':
        return MatchStatus.walkover;
      case 'cancelled':
        return MatchStatus.cancelled;
      case 'scheduled':
      default:
        return MatchStatus.scheduled;
    }
  }

  String get apiValue => switch (this) {
        MatchStatus.scheduled => 'scheduled',
        MatchStatus.inProgress => 'in_progress',
        MatchStatus.completed => 'completed',
        MatchStatus.walkover => 'walkover',
        MatchStatus.cancelled => 'cancelled',
      };

  bool get isFinished => this == MatchStatus.completed || this == MatchStatus.walkover;
}

enum TeamStatus { active, withdrawn, disqualified }

class MatchTeam extends Equatable {
  final int id;
  final String label;
  final int? seed;
  final TeamStatus status;

  /// `withdrawal | no_show | injury | disqualification` — kept raw and
  /// labelled through `meta/enums` (result_types) at render time.
  final String? withdrawalReason;
  final int? groupId;
  final List<PlayerSummary> players;

  const MatchTeam({
    required this.id,
    required this.label,
    this.seed,
    this.status = TeamStatus.active,
    this.withdrawalReason,
    this.groupId,
    this.players = const [],
  });

  bool get isActive => status == TeamStatus.active;

  @override
  List<Object?> get props => [id, label, seed, status, withdrawalReason, groupId, players];
}

class SetScore extends Equatable {
  final int teamOne;
  final int teamTwo;

  const SetScore({required this.teamOne, required this.teamTwo});

  @override
  List<Object?> get props => [teamOne, teamTwo];
}

class GameScore extends Equatable {
  final int teamOne;
  final int teamTwo;

  const GameScore({required this.teamOne, required this.teamTwo});

  static const zero = GameScore(teamOne: 0, teamTwo: 0);

  @override
  List<Object?> get props => [teamOne, teamTwo];
}

/// Ready-to-render point labels (`"0"`, `"15"`, `"40"`, localized
/// "Deuce"/"Ad.", or raw tiebreak numbers) from `current_game_display`.
class PointDisplay extends Equatable {
  final String teamOne;
  final String teamTwo;

  const PointDisplay({required this.teamOne, required this.teamTwo});

  @override
  List<Object?> get props => [teamOne, teamTwo];
}

class LiveScore extends Equatable {
  final List<SetScore> sets;
  final GameScore currentSetGames;
  final GameScore currentGame;
  final bool isTiebreak;

  const LiveScore({
    required this.sets,
    required this.currentSetGames,
    required this.currentGame,
    required this.isTiebreak,
  });

  @override
  List<Object?> get props => [sets, currentSetGames, currentGame, isTiebreak];
}

enum VerificationStatus { pending, verified, rejected, corrected }

extension VerificationStatusX on VerificationStatus {
  static VerificationStatus fromApi(String? raw) => switch (raw) {
        'verified' => VerificationStatus.verified,
        'rejected' => VerificationStatus.rejected,
        'corrected' => VerificationStatus.corrected,
        _ => VerificationStatus.pending,
      };

  String get apiValue => name;
}

/// Official result attached to a match.
class MatchResult extends Equatable {
  final int id;

  /// `played | walkover | retirement | no_show | disqualification`.
  final String resultType;
  final VerificationStatus verificationStatus;
  final DateTime? verifiedAt;

  const MatchResult({
    required this.id,
    required this.resultType,
    required this.verificationStatus,
    this.verifiedAt,
  });

  @override
  List<Object?> get props => [id, resultType, verificationStatus, verifiedAt];
}

class IdName extends Equatable {
  final int id;
  final String name;

  const IdName({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}

class Match extends Equatable {
  final int id;
  final int? tournamentId;
  final int? categoryId;
  final IdName? category;
  final IdName? group;

  /// Tournament context — only present on `GET matches/live`.
  final IdName? tournament;

  final String? round;
  final String? roundLabel;
  final int? roundPosition;
  final MatchStatus status;
  final bool isLive;
  final DateTime? scheduledAt;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final String? court;
  final int? courtId;

  /// Null for bracket placeholders whose teams aren't decided yet.
  final MatchTeam? teamOne;
  final MatchTeam? teamTwo;
  final int setsWonTeamOne;
  final int setsWonTeamTwo;
  final LiveScore? liveScore;
  final PointDisplay? currentGameDisplay;
  final int version;
  final int? winnerTeamId;
  final int? nextMatchId;
  final bool isBye;
  final MatchResult? result;

  /// Tournament scoring: true = deuce / advantage, false = golden point at 40-40.
  final bool deuceEnabled;

  /// Scorekeeper only: the latest counted point (to edit its details).
  final PointEvent? lastPoint;

  /// The scorekeeper ended it before the score decided it (undo reopens it).
  final bool endedEarly;

  const Match({
    required this.id,
    this.tournamentId,
    this.categoryId,
    this.category,
    this.group,
    this.tournament,
    this.round,
    this.roundLabel,
    this.roundPosition,
    required this.status,
    this.isLive = false,
    this.scheduledAt,
    this.startedAt,
    this.completedAt,
    this.court,
    this.courtId,
    this.teamOne,
    this.teamTwo,
    this.setsWonTeamOne = 0,
    this.setsWonTeamTwo = 0,
    this.liveScore,
    this.currentGameDisplay,
    this.version = 0,
    this.winnerTeamId,
    this.nextMatchId,
    this.isBye = false,
    this.result,
    this.deuceEnabled = true,
    this.lastPoint,
    this.endedEarly = false,
  });

  bool get isInProgress => status == MatchStatus.inProgress;

  MatchTeam? get winner => winnerTeamId == null
      ? null
      : teamOne?.id == winnerTeamId
          ? teamOne
          : teamTwo?.id == winnerTeamId
              ? teamTwo
              : null;

  Match copyWith({
    MatchStatus? status,
    bool? isLive,
    int? setsWonTeamOne,
    int? setsWonTeamTwo,
    LiveScore? liveScore,
    PointDisplay? currentGameDisplay,
    int? version,
    int? winnerTeamId,
    bool? deuceEnabled,
    bool? endedEarly,
  }) {
    return Match(
      id: id,
      tournamentId: tournamentId,
      categoryId: categoryId,
      category: category,
      group: group,
      tournament: tournament,
      round: round,
      roundLabel: roundLabel,
      roundPosition: roundPosition,
      status: status ?? this.status,
      isLive: isLive ?? this.isLive,
      scheduledAt: scheduledAt,
      startedAt: startedAt,
      completedAt: completedAt,
      court: court,
      courtId: courtId,
      teamOne: teamOne,
      teamTwo: teamTwo,
      setsWonTeamOne: setsWonTeamOne ?? this.setsWonTeamOne,
      setsWonTeamTwo: setsWonTeamTwo ?? this.setsWonTeamTwo,
      liveScore: liveScore ?? this.liveScore,
      currentGameDisplay: currentGameDisplay ?? this.currentGameDisplay,
      version: version ?? this.version,
      winnerTeamId: winnerTeamId ?? this.winnerTeamId,
      nextMatchId: nextMatchId,
      isBye: isBye,
      result: result,
      deuceEnabled: deuceEnabled ?? this.deuceEnabled,
      lastPoint: lastPoint,
      endedEarly: endedEarly ?? this.endedEarly,
    );
  }

  @override
  List<Object?> get props => [
        id,
        tournamentId,
        categoryId,
        category,
        group,
        tournament,
        round,
        roundLabel,
        roundPosition,
        status,
        isLive,
        scheduledAt,
        startedAt,
        completedAt,
        court,
        courtId,
        teamOne,
        teamTwo,
        setsWonTeamOne,
        setsWonTeamTwo,
        liveScore,
        currentGameDisplay,
        version,
        winnerTeamId,
        nextMatchId,
        deuceEnabled,
        lastPoint,
        endedEarly,
        isBye,
        result,
      ];
}
