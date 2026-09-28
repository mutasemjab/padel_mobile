// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrainingProgressModel _$TrainingProgressModelFromJson(
  Map<String, dynamic> json,
) => _TrainingProgressModel(
  id: (json['id'] as num).toInt(),
  skill: json['skill'] as String,
  skillLabel: json['skill_label'] as String?,
  score: (json['score'] as num?)?.toInt() ?? 0,
  notes: json['notes'] as String?,
  bookingId: (json['booking_id'] as num?)?.toInt(),
  coach: json['coach'] as Map<String, dynamic>?,
  recordedAt: json['recorded_at'] == null
      ? null
      : DateTime.parse(json['recorded_at'] as String),
);

Map<String, dynamic> _$TrainingProgressModelToJson(
  _TrainingProgressModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'skill': instance.skill,
  'skill_label': instance.skillLabel,
  'score': instance.score,
  'notes': instance.notes,
  'booking_id': instance.bookingId,
  'coach': instance.coach,
  'recorded_at': instance.recordedAt?.toIso8601String(),
};

_BookingModel _$BookingModelFromJson(Map<String, dynamic> json) =>
    _BookingModel(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String? ?? 'pending',
      scheduledAt: json['scheduled_at'] == null
          ? null
          : DateTime.parse(json['scheduled_at'] as String),
      durationMinutes: (json['duration_minutes'] as num?)?.toInt() ?? 60,
      location: json['location'] as String?,
      trainingType: json['training_type'] as String?,
      price: json['price'] as num?,
      currency: json['currency'] as String?,
      notes: json['notes'] as String?,
      feedback: json['feedback'] as String?,
      xpAwarded: (json['xp_awarded'] as num?)?.toInt(),
      coach: json['coach'] as Map<String, dynamic>,
      player: json['player'] == null
          ? null
          : PlayerSummaryModel.fromJson(json['player'] as Map<String, dynamic>),
      availabilityId: (json['availability_id'] as num?)?.toInt(),
      confirmedAt: json['confirmed_at'] == null
          ? null
          : DateTime.parse(json['confirmed_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      cancelledAt: json['cancelled_at'] == null
          ? null
          : DateTime.parse(json['cancelled_at'] as String),
      cancelledBy: json['cancelled_by'] as String?,
      cancellationReason: json['cancellation_reason'] as String?,
      rejectionReason: json['rejection_reason'] as String?,
      canCancel: json['can_cancel'] as bool? ?? false,
      canReview: json['can_review'] as bool? ?? false,
      review: json['review'] as Map<String, dynamic>?,
      progress:
          (json['progress'] as List<dynamic>?)
              ?.map(
                (e) =>
                    TrainingProgressModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$BookingModelToJson(_BookingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'scheduled_at': instance.scheduledAt?.toIso8601String(),
      'duration_minutes': instance.durationMinutes,
      'location': instance.location,
      'training_type': instance.trainingType,
      'price': instance.price,
      'currency': instance.currency,
      'notes': instance.notes,
      'feedback': instance.feedback,
      'xp_awarded': instance.xpAwarded,
      'coach': instance.coach,
      'player': instance.player?.toJson(),
      'availability_id': instance.availabilityId,
      'confirmed_at': instance.confirmedAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
      'cancelled_at': instance.cancelledAt?.toIso8601String(),
      'cancelled_by': instance.cancelledBy,
      'cancellation_reason': instance.cancellationReason,
      'rejection_reason': instance.rejectionReason,
      'can_cancel': instance.canCancel,
      'can_review': instance.canReview,
      'review': instance.review,
      'progress': instance.progress.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt?.toIso8601String(),
    };
