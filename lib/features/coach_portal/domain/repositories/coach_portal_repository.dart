import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../coaches/domain/entities/booking.dart';
import '../../../coaches/domain/entities/coach.dart';

/// Booking actions a coach can take (`POST coach/bookings/{id}/{action}`).
enum CoachBookingAction { confirm, reject, cancel, complete, feedback }

/// One skill assessment a coach records after a session (score 1–10).
class ProgressEntryInput {
  final String skill;
  final int score;
  final String? notes;

  const ProgressEntryInput({required this.skill, required this.score, this.notes});

  Map<String, dynamic> toJson() => {
        'skill': skill,
        'score': score,
        if (notes != null && notes!.isNotEmpty) 'notes': notes,
      };
}

abstract class CoachPortalRepository {
  ApiResult<Coach> getProfile();
  ApiResult<Coach> updateProfile(Map<String, dynamic> fields, {String? photoPath});
  ApiResult<List<AvailabilitySlot>> getAvailability({required DateTime from, required DateTime to});

  /// Overlaps and past times are rejected with a 400 [BusinessFailure].
  ApiResult<List<AvailabilitySlot>> createAvailability({
    required DateTime date,
    required String startTime,
    required String endTime,
    bool isActive = true,
    int repeatWeeks = 0,
  });
  ApiResult<AvailabilitySlot?> updateAvailability(int slotId, Map<String, dynamic> fields);
  ApiResult<void> deleteAvailability(int slotId);
  ApiResult<Paginated<Booking>> getBookings({String? status, String? scope, int page = 1});
  ApiResult<Booking?> bookingAction(int bookingId, CoachBookingAction action, {String? text});
  ApiResult<void> recordProgress(int bookingId, List<ProgressEntryInput> entries);
  ApiResult<TrainingProgressReport> getPlayerProgress(String playerId);
}
