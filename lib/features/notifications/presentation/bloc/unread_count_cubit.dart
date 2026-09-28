import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_notifications_usecase.dart';

/// App-wide unread badge. Refreshed on login, app resume, push arrival and
/// realtime `notification.created`; lists push their `meta.unread_count` in.
class UnreadCountCubit extends Cubit<int> {
  final GetUnreadCountUseCase getUnreadCount;

  UnreadCountCubit(this.getUnreadCount) : super(0);

  Future<void> refresh() async {
    final result = await getUnreadCount();
    if (isClosed) return;
    result.match((_) => null, emit);
  }

  void set(int count) {
    if (!isClosed) emit(count < 0 ? 0 : count);
  }

  void increment() => set(state + 1);

  void decrement() => set(state - 1);

  void clear() => set(0);
}
