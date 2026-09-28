import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/booking.dart';
import '../entities/coach.dart';

abstract class CoachesRepository {
  ApiResult<Paginated<Coach>> getCoaches({
    String? q,
    String? city,
    String? specialty,
    String? trainingType,
    num? maxPrice,
    String? sort,
    int page = 1,
  });
  ApiResult<Coach> getCoach(int id);

  /// At most 31 days per request.
  ApiResult<List<AvailabilityDay>> getAvailability(int coachId, {required DateTime from, required DateTime to});
  ApiResult<Paginated<CoachReview>> getReviews(int coachId, {int page = 1});

  /// A taken slot returns a 400 [BusinessFailure] — refresh availability.
  ApiResult<Booking> book(int coachId, {required int availabilityId, String? trainingType, String? notes});
  ApiResult<Paginated<Booking>> getMyBookings({String? status, String? scope, int page = 1});
  ApiResult<Booking> getMyBooking(int id);
  ApiResult<Booking?> cancelBooking(int id, {String? reason});
  ApiResult<Booking?> reviewBooking(int id, {required int rating, String? comment});
  ApiResult<TrainingProgressReport> getTrainingProgress({String? skill});
}
