import 'package:equatable/equatable.dart';

class ScorekeeperSession extends Equatable {
  final String token;
  final String? staffName;
  final Map<String, dynamic> staff;

  const ScorekeeperSession({required this.token, this.staffName, this.staff = const {}});

  @override
  List<Object?> get props => [token, staffName, staff];
}

/// A point to record. Only [winningTeamId] is required — detail never blocks
/// the score and can be attached afterwards.
class PointInput extends Equatable {
  final int? winningTeamId;
  final String? endingType;

  /// `player_id` string of the player who ended the point.
  final String? primaryPlayerId;
  final String? shotType;
  final String? errorType;
  final String? serveOutcome;

  const PointInput({
    this.winningTeamId,
    this.endingType,
    this.primaryPlayerId,
    this.shotType,
    this.errorType,
    this.serveOutcome,
  });

  bool get hasDetail =>
      endingType != null || primaryPlayerId != null || shotType != null || errorType != null || serveOutcome != null;

  Map<String, dynamic> toJson() => {
        'winning_team_id': ?winningTeamId,
        'ending_type': ?endingType,
        'primary_player_id': ?primaryPlayerId,
        'shot_type': ?shotType,
        'error_type': ?errorType,
        'serve_outcome': ?serveOutcome,
      };

  @override
  List<Object?> get props => [winningTeamId, endingType, primaryPlayerId, shotType, errorType, serveOutcome];
}
