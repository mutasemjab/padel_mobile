import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_envelope.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../coaches/data/models/booking_model.dart';
import '../../../coaches/data/models/coach_model.dart';
import '../../../coaches/domain/entities/booking.dart';
import '../../../coaches/domain/entities/coach.dart';
import '../../domain/repositories/coach_portal_repository.dart';


abstract class CoachPortalRemoteDataSource {
  Future<Coach> getProfile();
  Future<Coach> updateProfile(Map<String, dynamic> fields, {String? photoPath});
  Future<List<AvailabilitySlot>> getAvailability({required DateTime from, required DateTime to});
  Future<List<AvailabilitySlot>> createAvailability({
    required DateTime date,
    required String startTime,
    required String endTime,
    bool isActive = true,
    int repeatWeeks = 0,
  });
  Future<AvailabilitySlot?> updateAvailability(int slotId, Map<String, dynamic> fields);
  Future<void> deleteAvailability(int slotId);
  Future<Paginated<Booking>> getBookings({String? status, String? scope, int page = 1});
  Future<Booking?> bookingAction(int bookingId, CoachBookingAction action, {String? text});
  Future<void> recordProgress(int bookingId, List<Map<String, dynamic>> entries);
  Future<TrainingProgressReport> getPlayerProgress(String playerId);
}

class CoachPortalRemoteDataSourceImpl implements CoachPortalRemoteDataSource {
  final Dio dio;

  CoachPortalRemoteDataSourceImpl(this.dio);

  @override
  Future<Coach> getProfile() async {
    final response = await dio.get(ApiEndpoints.coachProfile);
    return coachFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<Coach> updateProfile(Map<String, dynamic> fields, {String? photoPath}) async {
    final Object data;
    if (photoPath == null) {
      data = fields;
    } else {
      // Laravel reads array fields from multipart as `key[]`.
      final form = FormData();
      fields.forEach((key, value) {
        if (value is List) {
          for (final v in value) {
            form.fields.add(MapEntry('$key[]', '$v'));
          }
        } else if (value != null) {
          form.fields.add(MapEntry(key, '$value'));
        }
      });
      form.files.add(MapEntry('photo', await MultipartFile.fromFile(photoPath)));
      data = form;
    }
    final response = await dio.post(ApiEndpoints.coachProfile, data: data);
    return coachFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<List<AvailabilitySlot>> getAvailability({required DateTime from, required DateTime to}) async {
    final response = await dio.get(ApiEndpoints.coachPortalAvailability, queryParameters: {
      'from': DateFormatter.apiDate(from),
      'to': DateFormatter.apiDate(to),
    });
    // Accept both a flat slot list and the public `{days:[{slots}]}` shape.
    final data = ApiEnvelope.data(response);
    if (data is List) {
      return data.map((s) => availabilitySlotFromJson((s as Map).cast<String, dynamic>())).toList();
    }
    final days = (data as Map?)?['days'] as List? ?? const [];
    return [
      for (final day in days)
        for (final slot in ((day as Map)['slots'] as List? ?? const []))
          availabilitySlotFromJson((slot as Map).cast<String, dynamic>()),
    ];
  }

  @override
  Future<List<AvailabilitySlot>> createAvailability({
    required DateTime date,
    required String startTime,
    required String endTime,
    bool isActive = true,
    int repeatWeeks = 0,
  }) async {
    final response = await dio.post(ApiEndpoints.coachPortalAvailability, data: {
      'date': DateFormatter.apiDate(date),
      'start_time': startTime,
      'end_time': endTime,
      'is_active': isActive,
      'repeat_weeks': repeatWeeks,
    });
    return ApiEnvelope.listOf(response, availabilitySlotFromJson);
  }

  @override
  Future<AvailabilitySlot?> updateAvailability(int slotId, Map<String, dynamic> fields) async {
    final response = await dio.put(ApiEndpoints.coachPortalAvailabilitySlot(slotId), data: fields);
    final data = ApiEnvelope.data(response);
    return data is Map ? availabilitySlotFromJson(data.cast<String, dynamic>()) : null;
  }

  @override
  Future<void> deleteAvailability(int slotId) async {
    await dio.delete(ApiEndpoints.coachPortalAvailabilitySlot(slotId));
  }

  @override
  Future<Paginated<Booking>> getBookings({String? status, String? scope, int page = 1}) async {
    final response = await dio.get(ApiEndpoints.coachPortalBookings, queryParameters: {
      'status': ?status,
      'scope': ?scope,
      'page': page,
    });
    return ApiEnvelope.paginated(response, bookingFromJson);
  }

  @override
  Future<Booking?> bookingAction(int bookingId, CoachBookingAction action, {String? text}) async {
    final key = switch (action) {
      CoachBookingAction.reject || CoachBookingAction.cancel => 'reason',
      CoachBookingAction.complete || CoachBookingAction.feedback => 'feedback',
      CoachBookingAction.confirm => null,
    };
    final response = await dio.post(
      ApiEndpoints.coachPortalBookingAction(bookingId, action.name),
      data: {if (key != null && text != null && text.isNotEmpty) key: text},
    );
    final data = ApiEnvelope.data(response);
    return data is Map ? bookingFromJson(data.cast<String, dynamic>()) : null;
  }

  @override
  Future<void> recordProgress(int bookingId, List<Map<String, dynamic>> entries) async {
    await dio.post(ApiEndpoints.coachPortalBookingAction(bookingId, 'progress'), data: {'entries': entries});
  }

  @override
  Future<TrainingProgressReport> getPlayerProgress(String playerId) async {
    final response = await dio.get(ApiEndpoints.coachPortalPlayerProgress(playerId));
    return trainingProgressReportFromJson(ApiEnvelope.map(response));
  }
}
