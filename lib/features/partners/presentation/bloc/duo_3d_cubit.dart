import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/state/view_state.dart';
import '../../domain/entities/duo_media.dart';
import '../../domain/usecases/partners_usecases.dart';

class Duo3dState {
  final ViewState<DuoMediaState> view;
  final bool requesting;

  /// Failure of the last "generate" tap (the view itself stays loaded).
  final Failure? lastFailure;

  const Duo3dState({this.view = const ViewState.initial(), this.requesting = false, this.lastFailure});

  Duo3dState copyWith({ViewState<DuoMediaState>? view, bool? requesting, Failure? lastFailure}) =>
      Duo3dState(view: view ?? this.view, requesting: requesting ?? this.requesting, lastFailure: lastFailure);
}

/// Duo 3D scene of the player + main partner. Generation runs on the
/// backend (Higgsfield); while a job is queued / processing this polls.
class Duo3dCubit extends Cubit<Duo3dState> {
  static const pollInterval = Duration(seconds: 5);

  final GetDuo3dUseCase getDuo;
  final RequestDuo3dUseCase requestDuo;
  Timer? _poll;

  Duo3dCubit({required this.getDuo, required this.requestDuo}) : super(const Duo3dState());

  Future<void> load({bool silent = false}) async {
    if (!silent) emit(state.copyWith(view: const ViewState.loading()));
    final result = await getDuo();
    if (isClosed) return;
    result.match(
      (failure) {
        if (!silent) emit(state.copyWith(view: ViewState.error(failure)));
      },
      (data) {
        emit(state.copyWith(view: ViewState.loaded(data)));
        _schedulePoll(data.current);
      },
    );
  }

  Future<void> generate() async {
    if (state.requesting) return;
    emit(state.copyWith(requesting: true));
    final result = await requestDuo();
    if (isClosed) return;
    result.match((failure) => emit(state.copyWith(requesting: false, lastFailure: failure)), (job) {
      final current = state.view.dataOrNull;
      emit(
        state.copyWith(
          requesting: false,
          view: ViewState.loaded(
            DuoMediaState(
              providerConfigured: current?.providerConfigured ?? true,
              requiresPhotos: false,
              current: job,
              latestCompleted: current?.latestCompleted,
            ),
          ),
        ),
      );
      _schedulePoll(job);
    });
  }

  void _schedulePoll(DuoMedia? job) {
    _poll?.cancel();
    if (job != null && job.status.isPending) _poll = Timer(pollInterval, () => load(silent: true));
  }

  @override
  Future<void> close() {
    _poll?.cancel();
    return super.close();
  }
}
