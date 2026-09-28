import 'package:equatable/equatable.dart';

import '../../../tournaments/domain/entities/venue.dart';

/// `average` is null when there are no reviews yet — show "New coach",
/// never 0 stars.
class CoachRating extends Equatable {
  final double? average;
  final int count;

  const CoachRating({this.average, this.count = 0});

  bool get hasReviews => average != null && count > 0;

  @override
  List<Object?> get props => [average, count];
}

class Coach extends Equatable {
  final int id;
  final String name;
  final String? bio;
  final String? photoUrl;
  final String? phone;
  final List<String> specialties;
  final List<String> trainingTypes;
  final List<String> languages;
  final int? yearsExperience;
  final num pricePerHour;
  final String? currency;
  final String? city;
  final Venue? venue;
  final CoachRating rating;
  final DateTime? nextAvailableAt;
  final bool isActive;

  const Coach({
    required this.id,
    required this.name,
    this.bio,
    this.photoUrl,
    this.phone,
    this.specialties = const [],
    this.trainingTypes = const [],
    this.languages = const [],
    this.yearsExperience,
    required this.pricePerHour,
    this.currency,
    this.city,
    this.venue,
    this.rating = const CoachRating(),
    this.nextAvailableAt,
    this.isActive = true,
  });

  String? get location => venue?.displayName ?? city;

  @override
  List<Object?> get props => [
        id,
        name,
        bio,
        photoUrl,
        phone,
        specialties,
        trainingTypes,
        languages,
        yearsExperience,
        pricePerHour,
        currency,
        city,
        venue,
        rating,
        nextAvailableAt,
        isActive,
      ];
}

enum SlotStatus {
  available,
  booked,
  cancelled;

  static SlotStatus fromApi(String? raw) =>
      SlotStatus.values.firstWhere((s) => s.name == raw, orElse: () => SlotStatus.available);
}

class AvailabilitySlot extends Equatable {
  final int id;
  final int coachId;
  final DateTime date;
  final String startTime;
  final String endTime;
  final DateTime? startsAt;
  final DateTime? endsAt;
  final int durationMinutes;
  final SlotStatus status;
  final bool isActive;
  final bool isBookable;

  const AvailabilitySlot({
    required this.id,
    required this.coachId,
    required this.date,
    required this.startTime,
    required this.endTime,
    this.startsAt,
    this.endsAt,
    this.durationMinutes = 60,
    this.status = SlotStatus.available,
    this.isActive = true,
    this.isBookable = false,
  });

  @override
  List<Object?> get props =>
      [id, coachId, date, startTime, endTime, startsAt, endsAt, durationMinutes, status, isActive, isBookable];
}

class AvailabilityDay extends Equatable {
  final DateTime date;
  final List<AvailabilitySlot> slots;

  const AvailabilityDay({required this.date, required this.slots});

  @override
  List<Object?> get props => [date, slots];
}

class CoachReview extends Equatable {
  final int id;
  final int rating;
  final String? comment;
  final String playerName;
  final String? playerPhotoUrl;
  final DateTime? createdAt;

  const CoachReview({
    required this.id,
    required this.rating,
    this.comment,
    required this.playerName,
    this.playerPhotoUrl,
    this.createdAt,
  });

  @override
  List<Object?> get props => [id, rating, comment, playerName, playerPhotoUrl, createdAt];
}
