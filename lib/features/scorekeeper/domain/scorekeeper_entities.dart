import 'package:equatable/equatable.dart';

class ScorekeeperSession extends Equatable {
  final String token;
  final String? staffName;
  final Map<String, dynamic> staff;

  const ScorekeeperSession({required this.token, this.staffName, this.staff = const {}});

  @override
  List<Object?> get props => [token, staffName, staff];
}

/// A point to record. The server requires the structured reason with every
/// point: [endingType] plus the fields that ending demands (see
/// `meta/enums.point_ending_types[].requires`).
class PointInput extends Equatable {
  final int? winningTeamId;
  final String? endingType;

  /// `player_id` string of the player who ended the point.
  final String? primaryPlayerId;
  final String? shotType;
  final String? errorType;
  final String? serveOutcome;

  /// Device time of the point, used by the server to order points for analysis.
  final DateTime? recordedAt;

  const PointInput({
    this.winningTeamId,
    this.endingType,
    this.primaryPlayerId,
    this.shotType,
    this.errorType,
    this.serveOutcome,
    this.recordedAt,
  });

  bool get hasDetail =>
      endingType != null || primaryPlayerId != null || shotType != null || errorType != null || serveOutcome != null;

  PointInput withWinner(int teamId) => PointInput(
        winningTeamId: teamId,
        endingType: endingType,
        primaryPlayerId: primaryPlayerId,
        shotType: shotType,
        errorType: errorType,
        serveOutcome: serveOutcome,
        recordedAt: recordedAt,
      );

  Map<String, dynamic> toJson() => {
        'winning_team_id': ?winningTeamId,
        'ending_type': ?endingType,
        'primary_player_id': ?primaryPlayerId,
        'shot_type': ?shotType,
        'error_type': ?errorType,
        'serve_outcome': ?serveOutcome,
        'recorded_at': ?recordedAt?.toUtc().toIso8601String(),
      };

  @override
  List<Object?> get props => [winningTeamId, endingType, primaryPlayerId, shotType, errorType, serveOutcome, recordedAt];
}
