import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/booking.dart';
import '../entities/coach.dart';
import '../repositories/coaches_repository.dart';

class GetCoachAvailabilityUseCase {
  final CoachesRepository repository;
  GetCoachAvailabilityUseCase(this.repository);
  ApiResult<List<AvailabilityDay>> call(int coachId, {required DateTime from, required DateTime to}) =>
      repository.getAvailability(coachId, from: from, to: to);
}

class GetCoachReviewsUseCase {
  final CoachesRepository repository;
  GetCoachReviewsUseCase(this.repository);
  ApiResult<Paginated<CoachReview>> call(int coachId, {int page = 1}) => repository.getReviews(coachId, page: page);
}

class BookCoachUseCase {
  final CoachesRepository repository;
  BookCoachUseCase(this.repository);
  ApiResult<Booking> call(int coachId, {required int availabilityId, String? trainingType, String? notes}) =>
      repository.book(coachId, availabilityId: availabilityId, trainingType: trainingType, notes: notes);
}

class GetMyBookingsUseCase {
  final CoachesRepository repository;
  GetMyBookingsUseCase(this.repository);

  /// [upcoming]: `scope=upcoming|past`.
  ApiResult<Paginated<Booking>> call({required bool upcoming, String? status, int page = 1}) =>
      repository.getMyBookings(status: status, scope: upcoming ? 'upcoming' : 'past', page: page);
}

class GetMyBookingUseCase {
  final CoachesRepository repository;
  GetMyBookingUseCase(this.repository);
  ApiResult<Booking> call(int id) => repository.getMyBooking(id);
}

class CancelBookingUseCase {
  final CoachesRepository repository;
  CancelBookingUseCase(this.repository);
  ApiResult<Booking?> call(int id, {String? reason}) => repository.cancelBooking(id, reason: reason);
}

class ReviewBookingUseCase {
  final CoachesRepository repository;
  ReviewBookingUseCase(this.repository);
  ApiResult<Booking?> call(int id, {required int rating, String? comment}) =>
      repository.reviewBooking(id, rating: rating, comment: comment);
}

class GetTrainingProgressUseCase {
  final CoachesRepository repository;
  GetTrainingProgressUseCase(this.repository);
  ApiResult<TrainingProgressReport> call({String? skill}) => repository.getTrainingProgress(skill: skill);
}
