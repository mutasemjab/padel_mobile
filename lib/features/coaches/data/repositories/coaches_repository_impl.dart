import '../../../../core/network/api_result.dart';
import '../../../../core/network/guard.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/coach.dart';
import '../../domain/repositories/coaches_repository.dart';
import '../datasources/coaches_remote_data_source.dart';

class CoachesRepositoryImpl implements CoachesRepository {
  final CoachesRemoteDataSource remote;

  CoachesRepositoryImpl(this.remote);

  @override
  ApiResult<Paginated<Coach>> getCoaches({
    String? q,
    String? city,
    String? specialty,
    String? trainingType,
    num? maxPrice,
    String? sort,
    int page = 1,
  }) =>
      guard(() => remote.getCoaches(
            query: CoachQuery(
              q: q,
              city: city,
              specialty: specialty,
              trainingType: trainingType,
              maxPrice: maxPrice,
              sort: sort,
            ),
            page: page,
          ));

  @override
  ApiResult<Coach> getCoach(int id) => guard(() => remote.getCoach(id));

  @override
  ApiResult<List<AvailabilityDay>> getAvailability(int coachId, {required DateTime from, required DateTime to}) =>
      guard(() => remote.getAvailability(coachId, from: from, to: to));

  @override
  ApiResult<Paginated<CoachReview>> getReviews(int coachId, {int page = 1}) =>
      guard(() => remote.getReviews(coachId, page: page));

  @override
  ApiResult<Booking> book(int coachId, {required int availabilityId, String? trainingType, String? notes}) =>
      guard(() => remote.book(coachId, availabilityId: availabilityId, trainingType: trainingType, notes: notes));

  @override
  ApiResult<Paginated<Booking>> getMyBookings({String? status, String? scope, int page = 1}) =>
      guard(() => remote.getMyBookings(status: status, scope: scope, page: page));

  @override
  ApiResult<Booking> getMyBooking(int id) => guard(() => remote.getMyBooking(id));

  @override
  ApiResult<Booking?> cancelBooking(int id, {String? reason}) => guard(() => remote.cancelBooking(id, reason: reason));

  @override
  ApiResult<Booking?> reviewBooking(int id, {required int rating, String? comment}) =>
      guard(() => remote.reviewBooking(id, rating: rating, comment: comment));

  @override
  ApiResult<TrainingProgressReport> getTrainingProgress({String? skill}) =>
      guard(() => remote.getTrainingProgress(skill: skill));
}
