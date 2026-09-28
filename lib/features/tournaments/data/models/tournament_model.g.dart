// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TournamentCategoryModel _$TournamentCategoryModelFromJson(
  Map<String, dynamic> json,
) => _TournamentCategoryModel(
  id: (json['id'] as num).toInt(),
  tournamentId: (json['tournament_id'] as num?)?.toInt(),
  name: json['name'] as String,
  level: json['level'] as String?,
  gender: json['gender'] as String?,
  format: json['format'] as String?,
  maxTeams: (json['max_teams'] as num?)?.toInt() ?? 0,
  activeTeams: (json['active_teams'] as num?)?.toInt() ?? 0,
  registrationFee: json['registration_fee'] as num? ?? 0,
  currency: json['currency'] as String?,
  requiresPayment: json['requires_payment'] as bool? ?? false,
  rankingWeight: json['ranking_weight'] as num?,
  isActive: json['is_active'] as bool? ?? true,
  isFull: json['is_full'] as bool? ?? false,
  waitlistCount: (json['waitlist_count'] as num?)?.toInt() ?? 0,
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  champion: json['champion'] == null
      ? null
      : MatchTeamModel.fromJson(json['champion'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TournamentCategoryModelToJson(
  _TournamentCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'tournament_id': instance.tournamentId,
  'name': instance.name,
  'level': instance.level,
  'gender': instance.gender,
  'format': instance.format,
  'max_teams': instance.maxTeams,
  'active_teams': instance.activeTeams,
  'registration_fee': instance.registrationFee,
  'currency': instance.currency,
  'requires_payment': instance.requiresPayment,
  'ranking_weight': instance.rankingWeight,
  'is_active': instance.isActive,
  'is_full': instance.isFull,
  'waitlist_count': instance.waitlistCount,
  'completed_at': instance.completedAt?.toIso8601String(),
  'champion': instance.champion?.toJson(),
};

_TournamentModel _$TournamentModelFromJson(Map<String, dynamic> json) =>
    _TournamentModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      rules: json['rules'] as String?,
      imageUrl: json['image_url'] as String?,
      venue: json['venue'] == null
          ? null
          : VenueModel.fromJson(json['venue'] as Map<String, dynamic>),
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      registrationOpensAt: json['registration_opens_at'] == null
          ? null
          : DateTime.parse(json['registration_opens_at'] as String),
      registrationClosesAt: json['registration_closes_at'] == null
          ? null
          : DateTime.parse(json['registration_closes_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      status: json['status'] as String,
      competitionType: json['competition_type'] as String?,
      format: json['format'] as String?,
      certificationStatus: json['certification_status'] as String?,
      isRankingEligible: json['is_ranking_eligible'] as bool? ?? false,
      registrationOpen: json['registration_open'] as bool? ?? false,
      liveMatchesCount: (json['live_matches_count'] as num?)?.toInt() ?? 0,
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map(
                (e) =>
                    TournamentCategoryModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TournamentModelToJson(
  _TournamentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'rules': instance.rules,
  'image_url': instance.imageUrl,
  'venue': instance.venue?.toJson(),
  'start_date': instance.startDate.toIso8601String(),
  'end_date': instance.endDate.toIso8601String(),
  'registration_opens_at': instance.registrationOpensAt?.toIso8601String(),
  'registration_closes_at': instance.registrationClosesAt?.toIso8601String(),
  'completed_at': instance.completedAt?.toIso8601String(),
  'status': instance.status,
  'competition_type': instance.competitionType,
  'format': instance.format,
  'certification_status': instance.certificationStatus,
  'is_ranking_eligible': instance.isRankingEligible,
  'registration_open': instance.registrationOpen,
  'live_matches_count': instance.liveMatchesCount,
  'categories': instance.categories.map((e) => e.toJson()).toList(),
};
