import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../coaches/domain/entities/booking.dart';
import '../../../coaches/domain/entities/coach.dart';
import '../repositories/coach_portal_repository.dart';

class GetCoachProfileUseCase {
  final CoachPortalRepository repository;
  GetCoachProfileUseCase(this.repository);
  ApiResult<Coach> call() => repository.getProfile();
}

class UpdateCoachProfileUseCase {
  final CoachPortalRepository repository;
  UpdateCoachProfileUseCase(this.repository);
  ApiResult<Coach> call(Map<String, dynamic> fields, {String? photoPath}) =>
      repository.updateProfile(fields, photoPath: photoPath);
}

class GetCoachSlotsUseCase {
  final CoachPortalRepository repository;
  GetCoachSlotsUseCase(this.repository);
  ApiResult<List<AvailabilitySlot>> call({required DateTime from, required DateTime to}) =>
      repository.getAvailability(from: from, to: to);
}

class CreateCoachSlotsUseCase {
  final CoachPortalRepository repository;
  CreateCoachSlotsUseCase(this.repository);
  ApiResult<List<AvailabilitySlot>> call({
    required DateTime date,
    required String startTime,
    required String endTime,
    bool isActive = true,
    int repeatWeeks = 0,
  }) =>
      repository.createAvailability(
        date: date,
        startTime: startTime,
        endTime: endTime,
        isActive: isActive,
        repeatWeeks: repeatWeeks,
      );
}

class UpdateCoachSlotUseCase {
  final CoachPortalRepository repository;
  UpdateCoachSlotUseCase(this.repository);
  ApiResult<AvailabilitySlot?> call(int slotId, Map<String, dynamic> fields) =>
      repository.updateAvailability(slotId, fields);
}

class DeleteCoachSlotUseCase {
  final CoachPortalRepository repository;
  DeleteCoachSlotUseCase(this.repository);
  ApiResult<void> call(int slotId) => repository.deleteAvailability(slotId);
}

class GetCoachBookingsUseCase {
  final CoachPortalRepository repository;
  GetCoachBookingsUseCase(this.repository);
  ApiResult<Paginated<Booking>> call({String? status, String? scope, int page = 1}) =>
      repository.getBookings(status: status, scope: scope, page: page);
}

class CoachBookingActionUseCase {
  final CoachPortalRepository repository;
  CoachBookingActionUseCase(this.repository);
  ApiResult<Booking?> call(int bookingId, CoachBookingAction action, {String? text}) =>
      repository.bookingAction(bookingId, action, text: text);
}

class RecordProgressUseCase {
  final CoachPortalRepository repository;
  RecordProgressUseCase(this.repository);
  ApiResult<void> call(int bookingId, List<ProgressEntryInput> entries) =>
      repository.recordProgress(bookingId, entries);
}

class GetPlayerProgressUseCase {
  final CoachPortalRepository repository;
  GetPlayerProgressUseCase(this.repository);
  ApiResult<TrainingProgressReport> call(String playerId) => repository.getPlayerProgress(playerId);
}
