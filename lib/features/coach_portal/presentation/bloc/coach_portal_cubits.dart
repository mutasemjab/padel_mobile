import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../../core/state/base_cubits.dart';
import '../../../coaches/domain/entities/booking.dart';
import '../../../coaches/domain/entities/coach.dart';
import '../../domain/repositories/coach_portal_repository.dart';
import '../../domain/usecases/coach_portal_usecases.dart';

class CoachProfileCubit extends ViewCubit<Coach> {
  final GetCoachProfileUseCase getProfile;

  CoachProfileCubit(this.getProfile);

  @override
  ApiResult<Coach> fetch() => getProfile();

  @override
  bool isEmpty(Coach data) => false;
}

/// Booking inbox filtered by status (`pending`, `confirmed`, …) and scope.
class CoachBookingsCubit extends PagedCubit<Booking> {
  final GetCoachBookingsUseCase getBookings;
  String? status;
  String? scope;

  CoachBookingsCubit(this.getBookings, {this.status, this.scope});

  @override
  ApiResult<Paginated<Booking>> fetchPage(int page) => getBookings(status: status, scope: scope, page: page);

  Future<void> filter(String? status) {
    this.status = status;
    return load();
  }
}

/// Slots for a 7-day window that can be moved week by week.
class CoachSlotsCubit extends ViewCubit<List<AvailabilitySlot>> {
  final GetCoachSlotsUseCase getSlots;
  late DateTime weekStart;

  CoachSlotsCubit(this.getSlots) {
    final now = DateTime.now();
    weekStart = DateTime(now.year, now.month, now.day);
  }

  @override
  ApiResult<List<AvailabilitySlot>> fetch() => getSlots(from: weekStart, to: weekStart.add(const Duration(days: 6)));

  @override
  bool isEmpty(List<AvailabilitySlot> data) => false;

  Future<void> shiftWeek(int weeks) {
    weekStart = weekStart.add(Duration(days: 7 * weeks));
    return load();
  }
}

class PlayerProgressCubit extends ViewCubit<TrainingProgressReport> {
  final GetPlayerProgressUseCase getProgress;
  final String playerId;

  PlayerProgressCubit(this.getProgress, this.playerId);

  @override
  ApiResult<TrainingProgressReport> fetch() => getProgress(playerId);

  @override
  bool isEmpty(TrainingProgressReport data) => data.entries.isEmpty && data.bySkill.isEmpty;
}

/// Every coach-side mutation: slots, booking actions, progress, profile.
class CoachPortalActionCubit extends ActionCubit {
  final CreateCoachSlotsUseCase createSlots;
  final UpdateCoachSlotUseCase updateSlot;
  final DeleteCoachSlotUseCase deleteSlot;
  final CoachBookingActionUseCase bookingAction;
  final RecordProgressUseCase recordProgress;
  final UpdateCoachProfileUseCase updateProfile;

  CoachPortalActionCubit({
    required this.createSlots,
    required this.updateSlot,
    required this.deleteSlot,
    required this.bookingAction,
    required this.recordProgress,
    required this.updateProfile,
  });

  Future<bool> addSlots({
    required DateTime date,
    required String startTime,
    required String endTime,
    bool isActive = true,
    int repeatWeeks = 0,
  }) =>
      run(() => createSlots(date: date, startTime: startTime, endTime: endTime, isActive: isActive, repeatWeeks: repeatWeeks));

  Future<bool> toggleSlot(AvailabilitySlot slot) => run(() => updateSlot(slot.id, {'is_active': !slot.isActive}));

  Future<bool> removeSlot(int id) => run(() => deleteSlot(id));

  Future<bool> act(int bookingId, CoachBookingAction action, {String? text}) =>
      run(() => bookingAction(bookingId, action, text: text));

  Future<bool> saveProgress(int bookingId, List<ProgressEntryInput> entries) =>
      run(() => recordProgress(bookingId, entries));

  Future<bool> saveProfile(Map<String, dynamic> fields, {String? photoPath}) =>
      run(() => updateProfile(fields, photoPath: photoPath));
}
