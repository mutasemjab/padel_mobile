import 'package:freezed_annotation/freezed_annotation.dart';

import '../error/failure.dart';

part 'view_state.freezed.dart';

/// The standard screen state: initial → loading → loaded / empty / error.
@freezed
sealed class ViewState<T> with _$ViewState<T> {
  const factory ViewState.initial() = ViewInitial<T>;

  const factory ViewState.loading() = ViewLoading<T>;

  const factory ViewState.loaded(T data) = ViewLoaded<T>;

  const factory ViewState.empty() = ViewEmpty<T>;

  const factory ViewState.error(Failure failure) = ViewError<T>;
}

extension ViewStateX<T> on ViewState<T> {
  T? get dataOrNull => switch (this) {
    ViewLoaded<T>(:final data) => data,
    _ => null,
  };

  bool get isLoading => this is ViewLoading<T> || this is ViewInitial<T>;
}

enum PagedStatus { initial, loading, loaded, empty, error }

/// A paginated list screen's state.
@freezed
abstract class PagedState<T> with _$PagedState<T> {
  const PagedState._();

  const factory PagedState({
    @Default(PagedStatus.initial) PagedStatus status,
    @Default([]) List<T> items,
    @Default(0) int page,
    @Default(false) bool hasMore,
    @Default(false) bool isLoadingMore,
    Failure? failure,

    /// Envelope `meta` of the latest page (e.g. `unread_count`).
    Map<String, dynamic>? extra,
  }) = _PagedState<T>;

  bool get isFirstLoad => status == PagedStatus.initial || status == PagedStatus.loading;
}

/// One-off action (submit, accept, cancel…) kept apart from the screen's
/// data state so a failed action never blanks loaded content.
@freezed
sealed class ActionState with _$ActionState {
  const factory ActionState.idle() = ActionIdle;

  const factory ActionState.inProgress() = ActionInProgress;

  const factory ActionState.success([Object? result]) = ActionSuccess;

  const factory ActionState.failure(Failure failure) = ActionFailure;
}
