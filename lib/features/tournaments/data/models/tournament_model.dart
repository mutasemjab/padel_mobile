import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/tournament.dart';
import 'match_model.dart';
import 'venue_model.dart';

part 'tournament_model.freezed.dart';
part 'tournament_model.g.dart';

@freezed
abstract class TournamentCategoryModel with _$TournamentCategoryModel {
  const factory TournamentCategoryModel({
    required int id,
    @JsonKey(name: 'tournament_id') int? tournamentId,
    required String name,
    String? level,
    @Default(<String>[]) List<String> levels,
    String? gender,
    String? format,
    @JsonKey(name: 'max_teams') @Default(0) int maxTeams,
    @JsonKey(name: 'active_teams') @Default(0) int activeTeams,
    @JsonKey(name: 'registration_fee') @Default(0) num registrationFee,
    String? currency,
    @JsonKey(name: 'requires_payment') @Default(false) bool requiresPayment,
    @JsonKey(name: 'ranking_weight') num? rankingWeight,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'is_full') @Default(false) bool isFull,
    @JsonKey(name: 'waitlist_count') @Default(0) int waitlistCount,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    MatchTeamModel? champion,
  }) = _TournamentCategoryModel;

  factory TournamentCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentCategoryModelFromJson(json);
}

extension TournamentCategoryModelX on TournamentCategoryModel {
  TournamentCategory toEntity() => TournamentCategory(
        id: id,
        tournamentId: tournamentId,
        name: name,
        level: level,
        // Older servers only send `level`.
        levels: levels.isNotEmpty ? levels : [?level],
        gender: gender,
        format: format,
        maxTeams: maxTeams,
        activeTeams: activeTeams,
        registrationFee: registrationFee,
        currency: currency,
        requiresPayment: requiresPayment,
        rankingWeight: rankingWeight,
        isActive: isActive,
        isFull: isFull,
        waitlistCount: waitlistCount,
        completedAt: completedAt,
        champion: champion?.toEntity(),
      );
}

@freezed
abstract class TournamentModel with _$TournamentModel {
  const factory TournamentModel({
    required int id,
    required String name,
    String? description,
    String? rules,
    @JsonKey(name: 'image_url') String? imageUrl,
    VenueModel? venue,
    @JsonKey(name: 'start_date') required DateTime startDate,
    @JsonKey(name: 'end_date') required DateTime endDate,
    @JsonKey(name: 'registration_opens_at') DateTime? registrationOpensAt,
    @JsonKey(name: 'registration_closes_at') DateTime? registrationClosesAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    required String status,
    @JsonKey(name: 'competition_type') String? competitionType,
    String? format,
    @JsonKey(name: 'certification_status') String? certificationStatus,
    @JsonKey(name: 'is_ranking_eligible') @Default(false) bool isRankingEligible,
    @JsonKey(name: 'registration_open') @Default(false) bool registrationOpen,
    @JsonKey(name: 'live_matches_count') @Default(0) int liveMatchesCount,
    @Default([]) List<TournamentCategoryModel> categories,
  }) = _TournamentModel;

  factory TournamentModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentModelFromJson(json);
}

extension TournamentModelX on TournamentModel {
  Tournament toEntity() => Tournament(
        id: id,
        name: name,
        description: description,
        rules: rules,
        imageUrl: imageUrl,
        venue: venue?.toEntity(),
        startDate: startDate,
        endDate: endDate,
        registrationOpensAt: registrationOpensAt,
        registrationClosesAt: registrationClosesAt,
        completedAt: completedAt,
        status: TournamentStatusX.fromApi(status),
        competitionType: CompetitionType.fromApi(competitionType, rankingEligible: isRankingEligible),
        format: format,
        certificationStatus: certificationStatus,
        isRankingEligible: isRankingEligible,
        registrationOpen: registrationOpen,
        liveMatchesCount: liveMatchesCount,
        categories: categories.map((c) => c.toEntity()).toList(),
      );
}
