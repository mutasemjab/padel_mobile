import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../tournaments/data/models/venue_model.dart';
import '../../domain/entities/coach.dart';

part 'coach_model.freezed.dart';
part 'coach_model.g.dart';

@freezed
abstract class CoachRatingModel with _$CoachRatingModel {
  const factory CoachRatingModel({num? average, @Default(0) int count}) = _CoachRatingModel;

  factory CoachRatingModel.fromJson(Map<String, dynamic> json) => _$CoachRatingModelFromJson(json);
}

@freezed
abstract class CoachModel with _$CoachModel {
  const factory CoachModel({
    required int id,
    required String name,
    String? bio,
    @JsonKey(name: 'photo_url') String? photoUrl,
    String? phone,
    @Default([]) List<String> specialties,
    @JsonKey(name: 'training_types') @Default([]) List<String> trainingTypes,
    @Default([]) List<String> languages,
    @JsonKey(name: 'years_experience') int? yearsExperience,
    @JsonKey(name: 'price_per_hour') @Default(0) num pricePerHour,
    String? currency,
    String? city,
    VenueModel? venue,
    CoachRatingModel? rating,
    @JsonKey(name: 'next_available_at') DateTime? nextAvailableAt,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
  }) = _CoachModel;

  factory CoachModel.fromJson(Map<String, dynamic> json) => _$CoachModelFromJson(json);
}

extension CoachModelX on CoachModel {
  Coach toEntity() => Coach(
        id: id,
        name: name,
        bio: bio,
        photoUrl: photoUrl,
        phone: phone,
        specialties: specialties,
        trainingTypes: trainingTypes,
        languages: languages,
        yearsExperience: yearsExperience,
        pricePerHour: pricePerHour,
        currency: currency,
        city: city,
        venue: venue?.toEntity(),
        rating: CoachRating(average: rating?.average?.toDouble(), count: rating?.count ?? 0),
        nextAvailableAt: nextAvailableAt,
        isActive: isActive,
      );
}

Coach coachFromJson(Map<String, dynamic> json) => CoachModel.fromJson(json).toEntity();

@freezed
abstract class AvailabilitySlotModel with _$AvailabilitySlotModel {
  const factory AvailabilitySlotModel({
    required int id,
    @JsonKey(name: 'coach_id') @Default(0) int coachId,
    required DateTime date,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'starts_at') DateTime? startsAt,
    @JsonKey(name: 'ends_at') DateTime? endsAt,
    @JsonKey(name: 'duration_minutes') @Default(60) int durationMinutes,
    @Default('available') String status,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'is_bookable') @Default(false) bool isBookable,
  }) = _AvailabilitySlotModel;

  factory AvailabilitySlotModel.fromJson(Map<String, dynamic> json) =>
      _$AvailabilitySlotModelFromJson(json);
}

extension AvailabilitySlotModelX on AvailabilitySlotModel {
  AvailabilitySlot toEntity() => AvailabilitySlot(
        id: id,
        coachId: coachId,
        date: date,
        startTime: startTime,
        endTime: endTime,
        startsAt: startsAt,
        endsAt: endsAt,
        durationMinutes: durationMinutes,
        status: SlotStatus.fromApi(status),
        isActive: isActive,
        isBookable: isBookable,
      );
}

AvailabilitySlot availabilitySlotFromJson(Map<String, dynamic> json) =>
    AvailabilitySlotModel.fromJson(json).toEntity();

@freezed
abstract class AvailabilityDayModel with _$AvailabilityDayModel {
  const factory AvailabilityDayModel({
    required DateTime date,
    @Default([]) List<AvailabilitySlotModel> slots,
  }) = _AvailabilityDayModel;

  factory AvailabilityDayModel.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityDayModelFromJson(json);
}

extension AvailabilityDayModelX on AvailabilityDayModel {
  AvailabilityDay toEntity() =>
      AvailabilityDay(date: date, slots: slots.map((s) => s.toEntity()).toList());
}

@freezed
abstract class CoachReviewModel with _$CoachReviewModel {
  const factory CoachReviewModel({
    required int id,
    @Default(0) int rating,
    String? comment,
    Map<String, dynamic>? player,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _CoachReviewModel;

  factory CoachReviewModel.fromJson(Map<String, dynamic> json) => _$CoachReviewModelFromJson(json);
}

extension CoachReviewModelX on CoachReviewModel {
  CoachReview toEntity() => CoachReview(
        id: id,
        rating: rating,
        comment: comment,
        playerName: player?['name']?.toString() ?? '',
        playerPhotoUrl: player?['photo_url']?.toString(),
        createdAt: createdAt,
      );
}
