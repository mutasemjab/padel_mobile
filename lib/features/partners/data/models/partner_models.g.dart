// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartnerRecordModel _$PartnerRecordModelFromJson(Map<String, dynamic> json) => _PartnerRecordModel(
  partner: PlayerSummaryModel.fromJson(json['partner'] as Map<String, dynamic>),
  matchesPlayed: (json['matches_played'] as num?)?.toInt() ?? 0,
  matchesWon: (json['matches_won'] as num?)?.toInt() ?? 0,
  winRate: json['win_rate'] as num?,
);

Map<String, dynamic> _$PartnerRecordModelToJson(_PartnerRecordModel instance) => <String, dynamic>{
  'partner': instance.partner.toJson(),
  'matches_played': instance.matchesPlayed,
  'matches_won': instance.matchesWon,
  'win_rate': instance.winRate,
};

_CandidateFactsModel _$CandidateFactsModelFromJson(Map<String, dynamic> json) => _CandidateFactsModel(
  ratingDifference: (json['rating_difference'] as num?)?.toInt(),
  candidateSide: json['candidate_side'] as String?,
  candidateVerifiedMatches: (json['candidate_verified_matches'] as num?)?.toInt(),
  candidateWinRate: json['candidate_win_rate'] as num?,
  matchesTogether: (json['matches_together'] as num?)?.toInt(),
  winsTogether: (json['wins_together'] as num?)?.toInt(),
  candidateLastPlayedAt: json['candidate_last_played_at'] == null
      ? null
      : DateTime.parse(json['candidate_last_played_at'] as String),
);

Map<String, dynamic> _$CandidateFactsModelToJson(_CandidateFactsModel instance) => <String, dynamic>{
  'rating_difference': instance.ratingDifference,
  'candidate_side': instance.candidateSide,
  'candidate_verified_matches': instance.candidateVerifiedMatches,
  'candidate_win_rate': instance.candidateWinRate,
  'matches_together': instance.matchesTogether,
  'wins_together': instance.winsTogether,
  'candidate_last_played_at': instance.candidateLastPlayedAt?.toIso8601String(),
};

_PartnerCandidateModel _$PartnerCandidateModelFromJson(Map<String, dynamic> json) => _PartnerCandidateModel(
  player: PlayerSummaryModel.fromJson(json['player'] as Map<String, dynamic>),
  reasons: (json['reasons'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  facts: json['facts'] == null ? null : CandidateFactsModel.fromJson(json['facts'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PartnerCandidateModelToJson(_PartnerCandidateModel instance) => <String, dynamic>{
  'player': instance.player.toJson(),
  'reasons': instance.reasons,
  'facts': instance.facts?.toJson(),
};

_PartnerRecommendationsModel _$PartnerRecommendationsModelFromJson(Map<String, dynamic> json) =>
    _PartnerRecommendationsModel(
      state: json['state'] as String? ?? 'ok',
      basis: json['basis'] as Map<String, dynamic>?,
      candidates:
          (json['candidates'] as List<dynamic>?)
              ?.map((e) => PartnerCandidateModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PartnerRecommendationsModelToJson(_PartnerRecommendationsModel instance) => <String, dynamic>{
  'state': instance.state,
  'basis': instance.basis,
  'candidates': instance.candidates.map((e) => e.toJson()).toList(),
};

_PartnerRequestModel _$PartnerRequestModelFromJson(Map<String, dynamic> json) => _PartnerRequestModel(
  id: (json['id'] as num).toInt(),
  status: json['status'] as String? ?? 'pending',
  message: json['message'] as String?,
  requester: PlayerSummaryModel.fromJson(json['requester'] as Map<String, dynamic>),
  target: PlayerSummaryModel.fromJson(json['target'] as Map<String, dynamic>),
  createdAt: json['created_at'] == null ? null : DateTime.parse(json['created_at'] as String),
  respondedAt: json['responded_at'] == null ? null : DateTime.parse(json['responded_at'] as String),
);

Map<String, dynamic> _$PartnerRequestModelToJson(_PartnerRequestModel instance) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'message': instance.message,
  'requester': instance.requester.toJson(),
  'target': instance.target.toJson(),
  'created_at': instance.createdAt?.toIso8601String(),
  'responded_at': instance.respondedAt?.toIso8601String(),
};
