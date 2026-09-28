import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../../core/state/base_cubits.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/coach.dart';
import '../../domain/usecases/booking_usecases.dart';
import '../../domain/usecases/get_coach_detail_usecase.dart';
import '../../domain/usecases/get_coaches_usecase.dart';

/// Marketplace list with search, filters and sort (paginated).
class CoachesCubit extends PagedCubit<Coach> {
  final GetCoachesUseCase getCoaches;
  String query = '';
  String? specialty;
  String? trainingType;
  String? sort;

  CoachesCubit(this.getCoaches);

  @override
  ApiResult<Paginated<Coach>> fetchPage(int page) => getCoaches(
        q: query,
        specialty: specialty,
        trainingType: trainingType,
        sort: sort,
        page: page,
      );

  Future<void> apply({String? query, String? trainingType, String? sort, bool clearType = false}) {
    if (query != null) this.query = query;
    if (trainingType != null || clearType) this.trainingType = trainingType;
    if (sort != null) this.sort = sort;
    return load();
  }
}

class CoachDetailCubit extends ViewCubit<Coach> {
  final GetCoachDetailUseCase getCoachDetail;
  final int coachId;

  CoachDetailCubit({required this.getCoachDetail, required this.coachId});

  @override
  ApiResult<Coach> fetch() => getCoachDetail(coachId);

  @override
  bool isEmpty(Coach data) => false;
}

/// 14 days of bookable slots starting today.
class CoachAvailabilityCubit extends ViewCubit<List<AvailabilityDay>> {
  final GetCoachAvailabilityUseCase getAvailability;
  final int coachId;
  final int days;

  CoachAvailabilityCubit(this.getAvailability, this.coachId, {this.days = 14});

  @override
  ApiResult<List<AvailabilityDay>> fetch() {
    final now = DateTime.now();
    final from = DateTime(now.year, now.month, now.day);
    return getAvailability(coachId, from: from, to: from.add(Duration(days: days - 1)));
  }

  @override
  bool isEmpty(List<AvailabilityDay> data) => false;
}

class CoachReviewsCubit extends PagedCubit<CoachReview> {
  final GetCoachReviewsUseCase getReviews;
  final int coachId;

  CoachReviewsCubit(this.getReviews, this.coachId);

  @override
  ApiResult<Paginated<CoachReview>> fetchPage(int page) => getReviews(coachId, page: page);
}

class BookCoachCubit extends ActionCubit {
  final BookCoachUseCase book;

  BookCoachCubit(this.book);

  Future<bool> request(int coachId, {required int availabilityId, String? trainingType, String? notes}) =>
      run(() => book(coachId, availabilityId: availabilityId, trainingType: trainingType, notes: notes));
}

class MyBookingsCubit extends PagedCubit<Booking> {
  final GetMyBookingsUseCase getBookings;
  final bool upcoming;

  MyBookingsCubit(this.getBookings, {required this.upcoming});

  @override
  ApiResult<Paginated<Booking>> fetchPage(int page) => getBookings(upcoming: upcoming, page: page);
}

class BookingDetailCubit extends ViewCubit<Booking> {
  final GetMyBookingUseCase getBooking;
  final int id;

  BookingDetailCubit(this.getBooking, this.id);

  @override
  ApiResult<Booking> fetch() => getBooking(id);

  @override
  bool isEmpty(Booking data) => false;
}

/// Cancel (honouring `can_cancel`) and review (when `can_review`).
class BookingActionCubit extends ActionCubit {
  final CancelBookingUseCase cancelBooking;
  final ReviewBookingUseCase reviewBooking;

  BookingActionCubit({required this.cancelBooking, required this.reviewBooking});

  Future<bool> cancel(int id, {String? reason}) => run(() => cancelBooking(id, reason: reason));

  Future<bool> review(int id, {required int rating, String? comment}) =>
      run(() => reviewBooking(id, rating: rating, comment: comment));
}

class TrainingProgressCubit extends ViewCubit<TrainingProgressReport> {
  final GetTrainingProgressUseCase getProgress;

  TrainingProgressCubit(this.getProgress);

  @override
  ApiResult<TrainingProgressReport> fetch() => getProgress();

  @override
  bool isEmpty(TrainingProgressReport data) => data.entries.isEmpty && data.bySkill.isEmpty;
}
