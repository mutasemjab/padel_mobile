import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_envelope.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/coach.dart';
import '../models/booking_model.dart';
import '../models/coach_model.dart';

class CoachQuery {
  final String? q;
  final String? city;
  final String? specialty;
  final String? trainingType;
  final num? maxPrice;

  /// `rating | price | name`.
  final String? sort;

  const CoachQuery({this.q, this.city, this.specialty, this.trainingType, this.maxPrice, this.sort});

  Map<String, dynamic> toQuery() => {
        if (q != null && q!.isNotEmpty) 'q': q,
        if (city != null && city!.isNotEmpty) 'city': city,
        'specialty': ?specialty,
        'training_type': ?trainingType,
        'max_price': ?maxPrice,
        'sort': ?sort,
      };
}

abstract class CoachesRemoteDataSource {
  Future<Paginated<Coach>> getCoaches({CoachQuery query = const CoachQuery(), int page = 1});
  Future<Coach> getCoach(int id);
  Future<List<AvailabilityDay>> getAvailability(int coachId, {required DateTime from, required DateTime to, bool onlyBookable = true});
  Future<Paginated<CoachReview>> getReviews(int coachId, {int page = 1});
  Future<Booking> book(int coachId, {required int availabilityId, String? trainingType, String? notes});
  Future<Paginated<Booking>> getMyBookings({String? status, String? scope, int page = 1});
  Future<Booking> getMyBooking(int id);
  Future<Booking?> cancelBooking(int id, {String? reason});
  Future<Booking?> reviewBooking(int id, {required int rating, String? comment});
  Future<TrainingProgressReport> getTrainingProgress({String? skill});
}

class CoachesRemoteDataSourceImpl implements CoachesRemoteDataSource {
  final Dio dio;

  CoachesRemoteDataSourceImpl(this.dio);

  Booking? _optionalBooking(Response response) {
    final data = ApiEnvelope.data(response);
    return data is Map ? bookingFromJson(data.cast<String, dynamic>()) : null;
  }

  @override
  Future<Paginated<Coach>> getCoaches({CoachQuery query = const CoachQuery(), int page = 1}) async {
    final response = await dio.get(ApiEndpoints.coaches, queryParameters: {...query.toQuery(), 'page': page});
    return ApiEnvelope.paginated(response, coachFromJson);
  }

  @override
  Future<Coach> getCoach(int id) async {
    final response = await dio.get(ApiEndpoints.coach(id));
    return coachFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<List<AvailabilityDay>> getAvailability(
    int coachId, {
    required DateTime from,
    required DateTime to,
    bool onlyBookable = true,
  }) async {
    final response = await dio.get(ApiEndpoints.coachAvailability(coachId), queryParameters: {
      'from': DateFormatter.apiDate(from),
      'to': DateFormatter.apiDate(to),
      if (onlyBookable) 'only_bookable': 1,
    });
    final days = ApiEnvelope.map(response)['days'] as List? ?? const [];
    return days
        .map((d) => AvailabilityDayModel.fromJson((d as Map).cast<String, dynamic>()).toEntity())
        .toList();
  }

  @override
  Future<Paginated<CoachReview>> getReviews(int coachId, {int page = 1}) async {
    final response = await dio.get(ApiEndpoints.coachReviews(coachId), queryParameters: {'page': page});
    return ApiEnvelope.paginated(response, (j) => CoachReviewModel.fromJson(j).toEntity());
  }

  @override
  Future<Booking> book(int coachId, {required int availabilityId, String? trainingType, String? notes}) async {
    final response = await dio.post(ApiEndpoints.coachBookings(coachId), data: {
      'availability_id': availabilityId,
      'training_type': ?trainingType,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
    return bookingFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<Paginated<Booking>> getMyBookings({String? status, String? scope, int page = 1}) async {
    final response = await dio.get(ApiEndpoints.myBookings, queryParameters: {
      'status': ?status,
      'scope': ?scope,
      'page': page,
    });
    return ApiEnvelope.paginated(response, bookingFromJson);
  }

  @override
  Future<Booking> getMyBooking(int id) async {
    final response = await dio.get(ApiEndpoints.myBooking(id));
    return bookingFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<Booking?> cancelBooking(int id, {String? reason}) async {
    final response = await dio.post(
      ApiEndpoints.myBookingCancel(id),
      data: {if (reason != null && reason.isNotEmpty) 'reason': reason},
    );
    return _optionalBooking(response);
  }

  @override
  Future<Booking?> reviewBooking(int id, {required int rating, String? comment}) async {
    final response = await dio.post(ApiEndpoints.myBookingReview(id), data: {
      'rating': rating,
      if (comment != null && comment.isNotEmpty) 'comment': comment,
    });
    return _optionalBooking(response);
  }

  @override
  Future<TrainingProgressReport> getTrainingProgress({String? skill}) async {
    final response = await dio.get(ApiEndpoints.myTrainingProgress, queryParameters: {'skill': ?skill});
    return trainingProgressReportFromJson(ApiEnvelope.map(response));
  }
}
