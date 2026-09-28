import 'package:equatable/equatable.dart';

import '../../../../core/models/player_summary.dart';

enum BookingStatus {
  pending,
  confirmed,
  completed,
  cancelled,
  rejected;

  static BookingStatus fromApi(String? raw) =>
      BookingStatus.values.firstWhere((s) => s.name == raw, orElse: () => BookingStatus.pending);
}

class TrainingProgress extends Equatable {
  final int id;
  final String skill;
  final String? skillLabel;

  /// 1–10.
  final int score;
  final String? notes;
  final int? bookingId;
  final int? coachId;
  final String? coachName;
  final DateTime? recordedAt;

  const TrainingProgress({
    required this.id,
    required this.skill,
    this.skillLabel,
    required this.score,
    this.notes,
    this.bookingId,
    this.coachId,
    this.coachName,
    this.recordedAt,
  });

  @override
  List<Object?> get props =>
      [id, skill, skillLabel, score, notes, bookingId, coachId, coachName, recordedAt];
}

class SkillScorePoint extends Equatable {
  final int score;
  final DateTime date;

  const SkillScorePoint({required this.score, required this.date});

  @override
  List<Object?> get props => [score, date];
}

class SkillProgressSummary extends Equatable {
  final String skill;
  final int? latestScore;
  final int? firstScore;
  final int assessments;
  final List<SkillScorePoint> history;

  const SkillProgressSummary({
    required this.skill,
    this.latestScore,
    this.firstScore,
    this.assessments = 0,
    this.history = const [],
  });

  int? get change => latestScore == null || firstScore == null ? null : latestScore! - firstScore!;

  @override
  List<Object?> get props => [skill, latestScore, firstScore, assessments, history];
}

class TrainingProgressReport extends Equatable {
  final List<TrainingProgress> entries;
  final List<SkillProgressSummary> bySkill;

  const TrainingProgressReport({required this.entries, required this.bySkill});

  @override
  List<Object?> get props => [entries, bySkill];
}

class BookingReview extends Equatable {
  final int rating;
  final String? comment;

  const BookingReview({required this.rating, this.comment});

  @override
  List<Object?> get props => [rating, comment];
}

class BookingCoach extends Equatable {
  final int id;
  final String name;
  final String? photoUrl;

  const BookingCoach({required this.id, required this.name, this.photoUrl});

  @override
  List<Object?> get props => [id, name, photoUrl];
}

class Booking extends Equatable {
  final int id;
  final BookingStatus status;
  final DateTime? scheduledAt;
  final int durationMinutes;
  final String? location;
  final String? trainingType;
  final num? price;
  final String? currency;
  final String? notes;
  final String? feedback;
  final int? xpAwarded;
  final BookingCoach coach;
  final PlayerSummary? player;
  final int? availabilityId;
  final DateTime? confirmedAt;
  final DateTime? completedAt;
  final DateTime? cancelledAt;

  /// `player | coach`.
  final String? cancelledBy;
  final String? cancellationReason;
  final String? rejectionReason;
  final bool canCancel;
  final bool canReview;
  final BookingReview? review;
  final List<TrainingProgress> progress;
  final DateTime? createdAt;

  const Booking({
    required this.id,
    required this.status,
    this.scheduledAt,
    this.durationMinutes = 60,
    this.location,
    this.trainingType,
    this.price,
    this.currency,
    this.notes,
    this.feedback,
    this.xpAwarded,
    required this.coach,
    this.player,
    this.availabilityId,
    this.confirmedAt,
    this.completedAt,
    this.cancelledAt,
    this.cancelledBy,
    this.cancellationReason,
    this.rejectionReason,
    this.canCancel = false,
    this.canReview = false,
    this.review,
    this.progress = const [],
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        status,
        scheduledAt,
        durationMinutes,
        location,
        trainingType,
        price,
        currency,
        notes,
        feedback,
        xpAwarded,
        coach,
        player,
        availabilityId,
        confirmedAt,
        completedAt,
        cancelledAt,
        cancelledBy,
        cancellationReason,
        rejectionReason,
        canCancel,
        canReview,
        review,
        progress,
        createdAt,
      ];
}
