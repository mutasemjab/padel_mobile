// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoachRatingModel _$CoachRatingModelFromJson(Map<String, dynamic> json) =>
    _CoachRatingModel(
      average: json['average'] as num?,
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CoachRatingModelToJson(_CoachRatingModel instance) =>
    <String, dynamic>{'average': instance.average, 'count': instance.count};

_CoachModel _$CoachModelFromJson(Map<String, dynamic> json) => _CoachModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  bio: json['bio'] as String?,
  photoUrl: json['photo_url'] as String?,
  phone: json['phone'] as String?,
  specialties:
      (json['specialties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  trainingTypes:
      (json['training_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  languages:
      (json['languages'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  yearsExperience: (json['years_experience'] as num?)?.toInt(),
  pricePerHour: json['price_per_hour'] as num? ?? 0,
  currency: json['currency'] as String?,
  city: json['city'] as String?,
  venue: json['venue'] == null
      ? null
      : VenueModel.fromJson(json['venue'] as Map<String, dynamic>),
  rating: json['rating'] == null
      ? null
      : CoachRatingModel.fromJson(json['rating'] as Map<String, dynamic>),
  nextAvailableAt: json['next_available_at'] == null
      ? null
      : DateTime.parse(json['next_available_at'] as String),
  isActive: json['is_active'] as bool? ?? true,
);

Map<String, dynamic> _$CoachModelToJson(_CoachModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'photo_url': instance.photoUrl,
      'phone': instance.phone,
      'specialties': instance.specialties,
      'training_types': instance.trainingTypes,
      'languages': instance.languages,
      'years_experience': instance.yearsExperience,
      'price_per_hour': instance.pricePerHour,
      'currency': instance.currency,
      'city': instance.city,
      'venue': instance.venue?.toJson(),
      'rating': instance.rating?.toJson(),
      'next_available_at': instance.nextAvailableAt?.toIso8601String(),
      'is_active': instance.isActive,
    };

_AvailabilitySlotModel _$AvailabilitySlotModelFromJson(
  Map<String, dynamic> json,
) => _AvailabilitySlotModel(
  id: (json['id'] as num).toInt(),
  coachId: (json['coach_id'] as num?)?.toInt() ?? 0,
  date: DateTime.parse(json['date'] as String),
  startTime: json['start_time'] as String,
  endTime: json['end_time'] as String,
  startsAt: json['starts_at'] == null
      ? null
      : DateTime.parse(json['starts_at'] as String),
  endsAt: json['ends_at'] == null
      ? null
      : DateTime.parse(json['ends_at'] as String),
  durationMinutes: (json['duration_minutes'] as num?)?.toInt() ?? 60,
  status: json['status'] as String? ?? 'available',
  isActive: json['is_active'] as bool? ?? true,
  isBookable: json['is_bookable'] as bool? ?? false,
);

Map<String, dynamic> _$AvailabilitySlotModelToJson(
  _AvailabilitySlotModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'coach_id': instance.coachId,
  'date': instance.date.toIso8601String(),
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'starts_at': instance.startsAt?.toIso8601String(),
  'ends_at': instance.endsAt?.toIso8601String(),
  'duration_minutes': instance.durationMinutes,
  'status': instance.status,
  'is_active': instance.isActive,
  'is_bookable': instance.isBookable,
};

_AvailabilityDayModel _$AvailabilityDayModelFromJson(
  Map<String, dynamic> json,
) => _AvailabilityDayModel(
  date: DateTime.parse(json['date'] as String),
  slots:
      (json['slots'] as List<dynamic>?)
          ?.map(
            (e) => AvailabilitySlotModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
);

Map<String, dynamic> _$AvailabilityDayModelToJson(
  _AvailabilityDayModel instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'slots': instance.slots.map((e) => e.toJson()).toList(),
};

_CoachReviewModel _$CoachReviewModelFromJson(Map<String, dynamic> json) =>
    _CoachReviewModel(
      id: (json['id'] as num).toInt(),
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      comment: json['comment'] as String?,
      player: json['player'] as Map<String, dynamic>?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$CoachReviewModelToJson(_CoachReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'comment': instance.comment,
      'player': instance.player,
      'created_at': instance.createdAt?.toIso8601String(),
    };
