import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/player_summary_model.dart';
import '../../domain/entities/match.dart';
import 'live_payload_model.dart';

part 'match_model.freezed.dart';
part 'match_model.g.dart';

@freezed
abstract class IdNameModel with _$IdNameModel {
  const factory IdNameModel({required int id, required String name}) = _IdNameModel;

  factory IdNameModel.fromJson(Map<String, dynamic> json) => _$IdNameModelFromJson(json);
}

extension IdNameModelX on IdNameModel {
  IdName toEntity() => IdName(id: id, name: name);
}

@freezed
abstract class MatchTeamModel with _$MatchTeamModel {
  const factory MatchTeamModel({
    required int id,
    required String label,
    int? seed,
    @Default('active') String status,
    @JsonKey(name: 'withdrawal_reason') String? withdrawalReason,
    @JsonKey(name: 'group_id') int? groupId,
    @Default([]) List<PlayerSummaryModel> players,
  }) = _MatchTeamModel;

  factory MatchTeamModel.fromJson(Map<String, dynamic> json) => _$MatchTeamModelFromJson(json);
}

extension MatchTeamModelX on MatchTeamModel {
  MatchTeam toEntity() => MatchTeam(
        id: id,
        label: label,
        seed: seed,
        status: switch (status) {
          'withdrawn' => TeamStatus.withdrawn,
          'disqualified' => TeamStatus.disqualified,
          _ => TeamStatus.active,
        },
        withdrawalReason: withdrawalReason,
        groupId: groupId,
        players: players.map((p) => p.toEntity()).toList(),
      );
}

@freezed
abstract class SetScoreModel with _$SetScoreModel {
  const factory SetScoreModel({
    @JsonKey(name: 'team_one') @Default(0) int teamOne,
    @JsonKey(name: 'team_two') @Default(0) int teamTwo,
  }) = _SetScoreModel;

  factory SetScoreModel.fromJson(Map<String, dynamic> json) => _$SetScoreModelFromJson(json);
}

extension SetScoreModelX on SetScoreModel {
  SetScore toEntity() => SetScore(teamOne: teamOne, teamTwo: teamTwo);
}

@freezed
abstract class GameScoreModel with _$GameScoreModel {
  const factory GameScoreModel({
    @JsonKey(name: 'team_one') @Default(0) int teamOne,
    @JsonKey(name: 'team_two') @Default(0) int teamTwo,
  }) = _GameScoreModel;

  factory GameScoreModel.fromJson(Map<String, dynamic> json) => _$GameScoreModelFromJson(json);
}

extension GameScoreModelX on GameScoreModel {
  GameScore toEntity() => GameScore(teamOne: teamOne, teamTwo: teamTwo);
}

@freezed
abstract class PointDisplayModel with _$PointDisplayModel {
  const factory PointDisplayModel({
    @JsonKey(name: 'team_one', fromJson: _str) @Default('0') String teamOne,
    @JsonKey(name: 'team_two', fromJson: _str) @Default('0') String teamTwo,
  }) = _PointDisplayModel;

  factory PointDisplayModel.fromJson(Map<String, dynamic> json) =>
      _$PointDisplayModelFromJson(json);
}

String _str(dynamic v) => v?.toString() ?? '0';

extension PointDisplayModelX on PointDisplayModel {
  PointDisplay toEntity() => PointDisplay(teamOne: teamOne, teamTwo: teamTwo);
}

@freezed
abstract class LiveScoreModel with _$LiveScoreModel {
  const factory LiveScoreModel({
    @Default([]) List<SetScoreModel> sets,
    @JsonKey(name: 'current_set_games') GameScoreModel? currentSetGames,
    @JsonKey(name: 'current_game') GameScoreModel? currentGame,
    @JsonKey(name: 'is_tiebreak') @Default(false) bool isTiebreak,
  }) = _LiveScoreModel;

  factory LiveScoreModel.fromJson(Map<String, dynamic> json) => _$LiveScoreModelFromJson(json);
}

extension LiveScoreModelX on LiveScoreModel {
  LiveScore toEntity() => LiveScore(
        sets: sets.map((s) => s.toEntity()).toList(),
        currentSetGames: currentSetGames?.toEntity() ?? GameScore.zero,
        currentGame: currentGame?.toEntity() ?? GameScore.zero,
        isTiebreak: isTiebreak,
      );
}

@freezed
abstract class MatchResultModel with _$MatchResultModel {
  const factory MatchResultModel({
    required int id,
    @JsonKey(name: 'result_type') @Default('played') String resultType,
    @JsonKey(name: 'verification_status') @Default('pending') String verificationStatus,
    @JsonKey(name: 'verified_at') DateTime? verifiedAt,
  }) = _MatchResultModel;

  factory MatchResultModel.fromJson(Map<String, dynamic> json) => _$MatchResultModelFromJson(json);
}

extension MatchResultModelX on MatchResultModel {
  MatchResult toEntity() => MatchResult(
        id: id,
        resultType: resultType,
        verificationStatus: VerificationStatusX.fromApi(verificationStatus),
        verifiedAt: verifiedAt,
      );
}

@freezed
abstract class MatchModel with _$MatchModel {
  const factory MatchModel({
    required int id,
    @JsonKey(name: 'tournament_id') int? tournamentId,
    @JsonKey(name: 'category_id') int? categoryId,
    IdNameModel? category,
    IdNameModel? group,
    IdNameModel? tournament,
    String? round,
    @JsonKey(name: 'round_label') String? roundLabel,
    @JsonKey(name: 'round_position') int? roundPosition,
    @Default('scheduled') String status,
    @JsonKey(name: 'is_live') @Default(false) bool isLive,
    @JsonKey(name: 'scheduled_at') DateTime? scheduledAt,
    @JsonKey(name: 'started_at') DateTime? startedAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    String? court,
    @JsonKey(name: 'court_id') int? courtId,
    @JsonKey(name: 'team_one') MatchTeamModel? teamOne,
    @JsonKey(name: 'team_two') MatchTeamModel? teamTwo,
    @JsonKey(name: 'sets_won_team_one') @Default(0) int setsWonTeamOne,
    @JsonKey(name: 'sets_won_team_two') @Default(0) int setsWonTeamTwo,
    @JsonKey(name: 'live_score') LiveScoreModel? liveScore,
    @JsonKey(name: 'current_game_display') PointDisplayModel? currentGameDisplay,
    @Default(0) int version,
    @JsonKey(name: 'winner_team_id') int? winnerTeamId,
    @JsonKey(name: 'next_match_id') int? nextMatchId,
    @JsonKey(name: 'is_bye') @Default(false) bool isBye,
    MatchResultModel? result,
    @JsonKey(name: 'deuce_enabled') @Default(true) bool deuceEnabled,
    @JsonKey(name: 'last_point') PointEventModel? lastPoint,
    @JsonKey(name: 'ended_early') @Default(false) bool endedEarly,
  }) = _MatchModel;

  factory MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);
}

extension MatchModelX on MatchModel {
  Match toEntity() {
    final parsedStatus = MatchStatusX.fromApi(status);
    return Match(
      id: id,
      tournamentId: tournamentId ?? tournament?.id,
      categoryId: categoryId ?? category?.id,
      category: category?.toEntity(),
      group: group?.toEntity(),
      tournament: tournament?.toEntity(),
      round: round,
      roundLabel: roundLabel,
      roundPosition: roundPosition,
      status: parsedStatus,
      isLive: isLive || parsedStatus == MatchStatus.inProgress,
      scheduledAt: scheduledAt,
      startedAt: startedAt,
      completedAt: completedAt,
      court: court,
      courtId: courtId,
      teamOne: teamOne?.toEntity(),
      teamTwo: teamTwo?.toEntity(),
      setsWonTeamOne: setsWonTeamOne,
      setsWonTeamTwo: setsWonTeamTwo,
      liveScore: liveScore?.toEntity(),
      currentGameDisplay: currentGameDisplay?.toEntity(),
      version: version,
      winnerTeamId: winnerTeamId,
      nextMatchId: nextMatchId,
      isBye: isBye,
      result: result?.toEntity(),
      deuceEnabled: deuceEnabled,
      lastPoint: lastPoint?.toEntity(),
      endedEarly: endedEarly,
    );
  }
}

Match matchFromJson(Map<String, dynamic> json) => MatchModel.fromJson(json).toEntity();
