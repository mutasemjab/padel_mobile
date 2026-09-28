import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/player_summary_model.dart';
import '../../../../core/models/section_state.dart';
import '../../domain/entities/partner.dart';

part 'partner_models.freezed.dart';
part 'partner_models.g.dart';

@freezed
abstract class PartnerRecordModel with _$PartnerRecordModel {
  const factory PartnerRecordModel({
    required PlayerSummaryModel partner,
    @JsonKey(name: 'matches_played') @Default(0) int matchesPlayed,
    @JsonKey(name: 'matches_won') @Default(0) int matchesWon,
    @JsonKey(name: 'win_rate') num? winRate,
  }) = _PartnerRecordModel;

  factory PartnerRecordModel.fromJson(Map<String, dynamic> json) => _$PartnerRecordModelFromJson(json);
}

extension PartnerRecordModelX on PartnerRecordModel {
  PartnerRecord toEntity() => PartnerRecord(
    partner: partner.toEntity(),
    matchesPlayed: matchesPlayed,
    matchesWon: matchesWon,
    winRate: winRate?.toDouble(),
  );
}

/// Accepts both slot shapes the backend uses:
/// - profile: `{state, partner, matches_played, matches_won, win_rate, min_matches_required}`
/// - partners endpoint: `{state, record: {...}|null, min_matches_required}`
PartnerSlot partnerSlotFromJson(dynamic raw) {
  if (raw is! Map) return const PartnerSlot.empty();
  final json = raw.cast<String, dynamic>();
  final state = SectionState.fromApi(json['state'] as String?);
  PartnerRecord? record;
  final nested = json['record'];
  if (nested is Map) {
    record = PartnerRecordModel.fromJson(nested.cast<String, dynamic>()).toEntity();
  } else if (json['partner'] is Map) {
    record = PartnerRecordModel.fromJson(json).toEntity();
  }
  return PartnerSlot(state: state, record: record, minMatchesRequired: (json['min_matches_required'] as num?)?.toInt());
}

PartnersOverview partnersOverviewFromJson(Map<String, dynamic> json) => PartnersOverview(
  mainPartner: partnerSlotFromJson(json['main_partner']),
  bestHistorical: partnerSlotFromJson(json['best_historical_partner']),
  mostPlayedWith: partnerSlotFromJson(json['most_played_with']),
  history: ((json['history'] as List?) ?? const [])
      .map((e) => PartnerRecordModel.fromJson((e as Map).cast<String, dynamic>()).toEntity())
      .toList(),
);

@freezed
abstract class CandidateFactsModel with _$CandidateFactsModel {
  const factory CandidateFactsModel({
    @JsonKey(name: 'rating_difference') int? ratingDifference,
    @JsonKey(name: 'candidate_side') String? candidateSide,
    @JsonKey(name: 'candidate_verified_matches') int? candidateVerifiedMatches,
    @JsonKey(name: 'candidate_win_rate') num? candidateWinRate,
    @JsonKey(name: 'matches_together') int? matchesTogether,
    @JsonKey(name: 'wins_together') int? winsTogether,
    @JsonKey(name: 'candidate_last_played_at') DateTime? candidateLastPlayedAt,
  }) = _CandidateFactsModel;

  factory CandidateFactsModel.fromJson(Map<String, dynamic> json) => _$CandidateFactsModelFromJson(json);
}

@freezed
abstract class PartnerCandidateModel with _$PartnerCandidateModel {
  const factory PartnerCandidateModel({
    required PlayerSummaryModel player,
    @Default([]) List<String> reasons,
    CandidateFactsModel? facts,
  }) = _PartnerCandidateModel;

  factory PartnerCandidateModel.fromJson(Map<String, dynamic> json) => _$PartnerCandidateModelFromJson(json);
}

extension PartnerCandidateModelX on PartnerCandidateModel {
  PartnerCandidate toEntity() => PartnerCandidate(
    player: player.toEntity(),
    reasons: reasons.map(RecommendationReason.fromApi).toList(),
    facts: CandidateFacts(
      ratingDifference: facts?.ratingDifference,
      candidateSide: facts?.candidateSide,
      candidateVerifiedMatches: facts?.candidateVerifiedMatches,
      candidateWinRate: facts?.candidateWinRate?.toDouble(),
      matchesTogether: facts?.matchesTogether,
      winsTogether: facts?.winsTogether,
      candidateLastPlayedAt: facts?.candidateLastPlayedAt,
    ),
  );
}

@freezed
abstract class PartnerRecommendationsModel with _$PartnerRecommendationsModel {
  const factory PartnerRecommendationsModel({
    @Default('ok') String state,
    Map<String, dynamic>? basis,
    @Default([]) List<PartnerCandidateModel> candidates,
  }) = _PartnerRecommendationsModel;

  factory PartnerRecommendationsModel.fromJson(Map<String, dynamic> json) =>
      _$PartnerRecommendationsModelFromJson(json);
}

extension PartnerRecommendationsModelX on PartnerRecommendationsModel {
  PartnerRecommendations toEntity() => PartnerRecommendations(
    state: SectionState.fromApi(state),
    basis: RecommendationBasis(
      playerRating: (basis?['player_rating'] as num?)?.toInt(),
      ratingWindow: (basis?['rating_window'] as num?)?.toInt(),
      playerVerifiedMatches: (basis?['player_verified_matches'] as num?)?.toInt() ?? 0,
    ),
    candidates: candidates.map((c) => c.toEntity()).toList(),
  );
}

@freezed
abstract class PartnerRequestModel with _$PartnerRequestModel {
  const factory PartnerRequestModel({
    required int id,
    @Default('pending') String status,
    String? message,
    required PlayerSummaryModel requester,
    required PlayerSummaryModel target,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'responded_at') DateTime? respondedAt,
  }) = _PartnerRequestModel;

  factory PartnerRequestModel.fromJson(Map<String, dynamic> json) => _$PartnerRequestModelFromJson(json);
}

extension PartnerRequestModelX on PartnerRequestModel {
  PartnerRequest toEntity() => PartnerRequest(
    id: id,
    status: PartnerRequestStatus.fromApi(status),
    message: message,
    requester: requester.toEntity(),
    target: target.toEntity(),
    createdAt: createdAt,
    respondedAt: respondedAt,
  );
}
