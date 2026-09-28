import '../../../../core/network/api_result.dart';
import '../../../../core/network/guard.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../coaches/domain/entities/booking.dart';
import '../../../coaches/domain/entities/coach.dart';
import '../../domain/repositories/coach_portal_repository.dart';
import '../datasources/coach_portal_remote_data_source.dart';

class CoachPortalRepositoryImpl implements CoachPortalRepository {
  final CoachPortalRemoteDataSource remote;

  CoachPortalRepositoryImpl(this.remote);

  @override
  ApiResult<Coach> getProfile() => guard(remote.getProfile);

  @override
  ApiResult<Coach> updateProfile(Map<String, dynamic> fields, {String? photoPath}) =>
      guard(() => remote.updateProfile(fields, photoPath: photoPath));

  @override
  ApiResult<List<AvailabilitySlot>> getAvailability({required DateTime from, required DateTime to}) =>
      guard(() => remote.getAvailability(from: from, to: to));

  @override
  ApiResult<List<AvailabilitySlot>> createAvailability({
    required DateTime date,
    required String startTime,
    required String endTime,
    bool isActive = true,
    int repeatWeeks = 0,
  }) =>
      guard(() => remote.createAvailability(
            date: date,
            startTime: startTime,
            endTime: endTime,
            isActive: isActive,
            repeatWeeks: repeatWeeks,
          ));

  @override
  ApiResult<AvailabilitySlot?> updateAvailability(int slotId, Map<String, dynamic> fields) =>
      guard(() => remote.updateAvailability(slotId, fields));

  @override
  ApiResult<void> deleteAvailability(int slotId) => guard(() => remote.deleteAvailability(slotId));

  @override
  ApiResult<Paginated<Booking>> getBookings({String? status, String? scope, int page = 1}) =>
      guard(() => remote.getBookings(status: status, scope: scope, page: page));

  @override
  ApiResult<Booking?> bookingAction(int bookingId, CoachBookingAction action, {String? text}) =>
      guard(() => remote.bookingAction(bookingId, action, text: text));

  @override
  ApiResult<void> recordProgress(int bookingId, List<ProgressEntryInput> entries) =>
      guard(() => remote.recordProgress(bookingId, entries.map((e) => e.toJson()).toList()));

  @override
  ApiResult<TrainingProgressReport> getPlayerProgress(String playerId) =>
      guard(() => remote.getPlayerProgress(playerId));
}
