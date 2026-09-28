import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/player_summary_model.dart';
import '../../../../core/utils/json_utils.dart';
import '../../domain/entities/booking.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
abstract class TrainingProgressModel with _$TrainingProgressModel {
  const factory TrainingProgressModel({
    required int id,
    required String skill,
    @JsonKey(name: 'skill_label') String? skillLabel,
    @Default(0) int score,
    String? notes,
    @JsonKey(name: 'booking_id') int? bookingId,
    Map<String, dynamic>? coach,
    @JsonKey(name: 'recorded_at') DateTime? recordedAt,
  }) = _TrainingProgressModel;

  factory TrainingProgressModel.fromJson(Map<String, dynamic> json) =>
      _$TrainingProgressModelFromJson(json);
}

extension TrainingProgressModelX on TrainingProgressModel {
  TrainingProgress toEntity() => TrainingProgress(
        id: id,
        skill: skill,
        skillLabel: skillLabel,
        score: score,
        notes: notes,
        bookingId: bookingId,
        coachId: Json.integer(coach?['id']),
        coachName: Json.string(coach?['name']),
        recordedAt: recordedAt,
      );
}

TrainingProgress trainingProgressFromJson(Map<String, dynamic> json) =>
    TrainingProgressModel.fromJson(json).toEntity();

/// `by_skill` is keyed by skill code, so it's parsed by hand.
TrainingProgressReport trainingProgressReportFromJson(Map<String, dynamic> json) {
  final bySkill = Json.map(json['by_skill']) ?? const {};
  return TrainingProgressReport(
    entries: Json.listOfMaps(json['entries']).map(trainingProgressFromJson).toList(),
    bySkill: [
      for (final e in bySkill.entries)
        if (e.value is Map)
          SkillProgressSummary(
            skill: e.key,
            latestScore: Json.integer((e.value as Map)['latest_score']),
            firstScore: Json.integer((e.value as Map)['first_score']),
            assessments: Json.integer((e.value as Map)['assessments']) ?? 0,
            history: Json.listOfMaps((e.value as Map)['history'])
                .where((h) => Json.date(h['date']) != null)
                .map((h) => SkillScorePoint(score: Json.integer(h['score']) ?? 0, date: Json.date(h['date'])!))
                .toList(),
          ),
    ],
  );
}

@freezed
abstract class BookingModel with _$BookingModel {
  const factory BookingModel({
    required int id,
    @Default('pending') String status,
    @JsonKey(name: 'scheduled_at') DateTime? scheduledAt,
    @JsonKey(name: 'duration_minutes') @Default(60) int durationMinutes,
    String? location,
    @JsonKey(name: 'training_type') String? trainingType,
    num? price,
    String? currency,
    String? notes,
    String? feedback,
    @JsonKey(name: 'xp_awarded') int? xpAwarded,
    required Map<String, dynamic> coach,
    PlayerSummaryModel? player,
    @JsonKey(name: 'availability_id') int? availabilityId,
    @JsonKey(name: 'confirmed_at') DateTime? confirmedAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'cancelled_at') DateTime? cancelledAt,
    @JsonKey(name: 'cancelled_by') String? cancelledBy,
    @JsonKey(name: 'cancellation_reason') String? cancellationReason,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'can_cancel') @Default(false) bool canCancel,
    @JsonKey(name: 'can_review') @Default(false) bool canReview,
    Map<String, dynamic>? review,
    @Default([]) List<TrainingProgressModel> progress,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
}

extension BookingModelX on BookingModel {
  Booking toEntity() => Booking(
        id: id,
        status: BookingStatus.fromApi(status),
        scheduledAt: scheduledAt,
        durationMinutes: durationMinutes,
        location: location,
        trainingType: trainingType,
        price: price,
        currency: currency,
        notes: notes,
        feedback: feedback,
        xpAwarded: xpAwarded,
        coach: BookingCoach(
          id: Json.integer(coach['id']) ?? 0,
          name: Json.string(coach['name']) ?? '',
          photoUrl: Json.string(coach['photo_url']),
        ),
        player: player?.toEntity(),
        availabilityId: availabilityId,
        confirmedAt: confirmedAt,
        completedAt: completedAt,
        cancelledAt: cancelledAt,
        cancelledBy: cancelledBy,
        cancellationReason: cancellationReason,
        rejectionReason: rejectionReason,
        canCancel: canCancel,
        canReview: canReview,
        review: review == null
            ? null
            : BookingReview(rating: Json.integer(review!['rating']) ?? 0, comment: Json.string(review!['comment'])),
        progress: progress.map((p) => p.toEntity()).toList(),
        createdAt: createdAt,
      );
}

Booking bookingFromJson(Map<String, dynamic> json) => BookingModel.fromJson(json).toEntity();
