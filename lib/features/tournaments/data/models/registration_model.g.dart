// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegistrationTournamentModel _$RegistrationTournamentModelFromJson(
  Map<String, dynamic> json,
) => _RegistrationTournamentModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  startDate: json['start_date'] == null
      ? null
      : DateTime.parse(json['start_date'] as String),
);

Map<String, dynamic> _$RegistrationTournamentModelToJson(
  _RegistrationTournamentModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'start_date': instance.startDate?.toIso8601String(),
};

_RegistrationCategoryModel _$RegistrationCategoryModelFromJson(
  Map<String, dynamic> json,
) => _RegistrationCategoryModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  registrationFee: json['registration_fee'] as num? ?? 0,
  tournament: RegistrationTournamentModel.fromJson(
    json['tournament'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$RegistrationCategoryModelToJson(
  _RegistrationCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'registration_fee': instance.registrationFee,
  'tournament': instance.tournament.toJson(),
};

_RegistrationModel _$RegistrationModelFromJson(Map<String, dynamic> json) =>
    _RegistrationModel(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String? ?? 'pending',
      paymentStatus: json['payment_status'] as String? ?? 'not_required',
      registeredAt: json['registered_at'] == null
          ? null
          : DateTime.parse(json['registered_at'] as String),
      promotedAt: json['promoted_at'] == null
          ? null
          : DateTime.parse(json['promoted_at'] as String),
      notes: json['notes'] as String?,
      player: json['player'] == null
          ? null
          : PlayerSummaryModel.fromJson(json['player'] as Map<String, dynamic>),
      partner: json['partner'] == null
          ? null
          : PlayerSummaryModel.fromJson(
              json['partner'] as Map<String, dynamic>,
            ),
      category: RegistrationCategoryModel.fromJson(
        json['category'] as Map<String, dynamic>,
      ),
      canCancel: json['can_cancel'] as bool? ?? false,
    );

Map<String, dynamic> _$RegistrationModelToJson(_RegistrationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'payment_status': instance.paymentStatus,
      'registered_at': instance.registeredAt?.toIso8601String(),
      'promoted_at': instance.promotedAt?.toIso8601String(),
      'notes': instance.notes,
      'player': instance.player?.toJson(),
      'partner': instance.partner?.toJson(),
      'category': instance.category.toJson(),
      'can_cancel': instance.canCancel,
    };
