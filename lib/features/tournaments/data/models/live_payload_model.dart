import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/live_payload.dart';
import '../../domain/entities/match.dart';
import 'match_model.dart';

part 'live_payload_model.freezed.dart';
part 'live_payload_model.g.dart';

@freezed
abstract class PointEventModel with _$PointEventModel {
  const factory PointEventModel({
    required int id,
    @Default(0) int sequence,
    @JsonKey(name: 'winning_team_id') int? winningTeamId,
    @JsonKey(name: 'ending_type') String? endingType,
    @JsonKey(name: 'primary_player_id') String? primaryPlayerId,
    @JsonKey(name: 'shot_type') String? shotType,
    @JsonKey(name: 'error_type') String? errorType,
    @JsonKey(name: 'serve_outcome') String? serveOutcome,
    String? coverage,
    @JsonKey(name: 'score_before') Map<String, dynamic>? scoreBefore,
    @JsonKey(name: 'score_after') Map<String, dynamic>? scoreAfter,
    @JsonKey(name: 'is_voided') @Default(false) bool isVoided,
    @JsonKey(name: 'corrected_from_id') int? correctedFromId,
    @JsonKey(name: 'recorded_at') DateTime? recordedAt,
  }) = _PointEventModel;

  factory PointEventModel.fromJson(Map<String, dynamic> json) => _$PointEventModelFromJson(json);
}

extension PointEventModelX on PointEventModel {
  PointEvent toEntity() => PointEvent(
        id: id,
        sequence: sequence,
        winningTeamId: winningTeamId,
        endingType: endingType,
        primaryPlayerId: primaryPlayerId,
        shotType: shotType,
        errorType: errorType,
        serveOutcome: serveOutcome,
        coverage: coverage,
        scoreBefore: scoreBefore,
        scoreAfter: scoreAfter,
        isVoided: isVoided,
        correctedFromId: correctedFromId,
        recordedAt: recordedAt,
      );
}

@freezed
abstract class LivePayloadModel with _$LivePayloadModel {
  const factory LivePayloadModel({
    String? event,
    @JsonKey(name: 'match_id') required int matchId,
    @JsonKey(name: 'tournament_id') int? tournamentId,
    @JsonKey(name: 'category_id') int? categoryId,
    @Default('scheduled') String status,
    @Default(0) int version,
    @JsonKey(name: 'team_one_id') int? teamOneId,
    @JsonKey(name: 'team_two_id') int? teamTwoId,
    @JsonKey(name: 'sets_won_team_one') @Default(0) int setsWonTeamOne,
    @JsonKey(name: 'sets_won_team_two') @Default(0) int setsWonTeamTwo,
    @JsonKey(name: 'live_score') LiveScoreModel? liveScore,
    @JsonKey(name: 'current_game_display') PointDisplayModel? currentGameDisplay,
    @JsonKey(name: 'winner_team_id') int? winnerTeamId,
    @JsonKey(name: 'last_point') PointEventModel? lastPoint,
    @JsonKey(name: 'server_time') DateTime? serverTime,
    @Default(true) bool changed,
  }) = _LivePayloadModel;

  factory LivePayloadModel.fromJson(Map<String, dynamic> json) => _$LivePayloadModelFromJson(json);
}

extension LivePayloadModelX on LivePayloadModel {
  LivePayload toEntity({int? pollIntervalSeconds}) => LivePayload(
        event: LiveEventType.fromApi(event),
        matchId: matchId,
        tournamentId: tournamentId,
        categoryId: categoryId,
        status: MatchStatusX.fromApi(status),
        version: version,
        teamOneId: teamOneId,
        teamTwoId: teamTwoId,
        setsWonTeamOne: setsWonTeamOne,
        setsWonTeamTwo: setsWonTeamTwo,
        liveScore: liveScore?.toEntity(),
        currentGameDisplay: currentGameDisplay?.toEntity(),
        winnerTeamId: winnerTeamId,
        lastPoint: lastPoint?.toEntity(),
        serverTime: serverTime,
        changed: changed,
        pollIntervalSeconds: pollIntervalSeconds,
      );
}
