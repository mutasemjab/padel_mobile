import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category_detail.dart';
import 'match_model.dart';
import 'tournament_model.dart';

part 'category_detail_model.freezed.dart';
part 'category_detail_model.g.dart';

@freezed
abstract class StandingRowModel with _$StandingRowModel {
  const factory StandingRowModel({
    @Default(0) int position,
    required MatchTeamModel team,
    @Default(0) int played,
    @Default(0) int wins,
    @Default(0) int losses,
    @Default(0) int points,
    @JsonKey(name: 'sets_won') @Default(0) int setsWon,
    @JsonKey(name: 'sets_lost') @Default(0) int setsLost,
    @JsonKey(name: 'set_difference') @Default(0) int setDifference,
    @JsonKey(name: 'games_won') @Default(0) int gamesWon,
    @JsonKey(name: 'games_lost') @Default(0) int gamesLost,
    @JsonKey(name: 'game_difference') @Default(0) int gameDifference,
  }) = _StandingRowModel;

  factory StandingRowModel.fromJson(Map<String, dynamic> json) => _$StandingRowModelFromJson(json);
}

extension StandingRowModelX on StandingRowModel {
  StandingRow toEntity() => StandingRow(
        position: position,
        team: team.toEntity(),
        played: played,
        wins: wins,
        losses: losses,
        points: points,
        setsWon: setsWon,
        setsLost: setsLost,
        setDifference: setDifference,
        gamesWon: gamesWon,
        gamesLost: gamesLost,
        gameDifference: gameDifference,
      );
}

@freezed
abstract class CategoryGroupModel with _$CategoryGroupModel {
  const factory CategoryGroupModel({
    required int id,
    required String name,
    @Default(false) bool finished,
    @Default([]) List<StandingRowModel> standings,
    @Default([]) List<MatchModel> matches,
  }) = _CategoryGroupModel;

  factory CategoryGroupModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryGroupModelFromJson(json);
}

extension CategoryGroupModelX on CategoryGroupModel {
  CategoryGroup toEntity() => CategoryGroup(
        id: id,
        name: name,
        finished: finished,
        standings: standings.map((s) => s.toEntity()).toList(),
        matches: matches.map((m) => m.toEntity()).toList(),
      );
}

@freezed
abstract class BracketRoundModel with _$BracketRoundModel {
  const factory BracketRoundModel({
    required String round,
    @JsonKey(name: 'round_label') String? roundLabel,
    @Default([]) List<MatchModel> matches,
  }) = _BracketRoundModel;

  factory BracketRoundModel.fromJson(Map<String, dynamic> json) =>
      _$BracketRoundModelFromJson(json);
}

extension BracketRoundModelX on BracketRoundModel {
  BracketRound toEntity() => BracketRound(
        round: round,
        roundLabel: roundLabel ?? round,
        matches: matches.map((m) => m.toEntity()).toList(),
      );
}

@freezed
abstract class CategoryDetailModel with _$CategoryDetailModel {
  const factory CategoryDetailModel({
    required TournamentCategoryModel category,
    @Default([]) List<MatchTeamModel> teams,
    @Default([]) List<CategoryGroupModel> groups,
    @Default([]) List<BracketRoundModel> bracket,
  }) = _CategoryDetailModel;

  factory CategoryDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryDetailModelFromJson(json);
}

extension CategoryDetailModelX on CategoryDetailModel {
  CategoryDetail toEntity() => CategoryDetail(
        category: category.toEntity(),
        teams: teams.map((t) => t.toEntity()).toList(),
        groups: groups.map((g) => g.toEntity()).toList(),
        bracket: bracket.map((b) => b.toEntity()).toList(),
      );
}

@freezed
abstract class EligibilityModel with _$EligibilityModel {
  const factory EligibilityModel({
    @JsonKey(name: 'registration_open') @Default(false) bool registrationOpen,
    @JsonKey(name: 'is_full') @Default(false) bool isFull,
    @JsonKey(name: 'player_issues') @Default([]) List<String> playerIssues,
    @JsonKey(name: 'partner_issues') List<String>? partnerIssues,
    @JsonKey(name: 'requires_payment') @Default(false) bool requiresPayment,
    @JsonKey(name: 'registration_fee') @Default(0) num registrationFee,
  }) = _EligibilityModel;

  factory EligibilityModel.fromJson(Map<String, dynamic> json) => _$EligibilityModelFromJson(json);
}

extension EligibilityModelX on EligibilityModel {
  Eligibility toEntity() => Eligibility(
        registrationOpen: registrationOpen,
        isFull: isFull,
        playerIssues: playerIssues,
        partnerIssues: partnerIssues,
        requiresPayment: requiresPayment,
        registrationFee: registrationFee,
      );
}
