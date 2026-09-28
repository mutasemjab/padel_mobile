import 'package:flutter_bloc/flutter_bloc.dart';

import '../network/api_result.dart';
import '../network/pagination_meta.dart';
import 'view_state.dart';

/// Loads a single resource into a [ViewState]. Subclasses implement [fetch]
/// (and optionally [isEmpty]).
abstract class ViewCubit<T> extends Cubit<ViewState<T>> {
  ViewCubit() : super(ViewState<T>.initial());

  ApiResult<T> fetch();

  bool isEmpty(T data) => data is List && data.isEmpty;

  Future<void> load({bool silent = false}) async {
    if (!silent || state is! ViewLoaded<T>) emit(ViewState<T>.loading());
    final result = await fetch();
    if (isClosed) return;
    result.match((failure) {
      // A failed background refresh keeps showing what we already have.
      if (silent && state is ViewLoaded<T>) return;
      emit(ViewState<T>.error(failure));
    }, (data) => emit(isEmpty(data) ? ViewState<T>.empty() : ViewState<T>.loaded(data)));
  }

  Future<void> refresh() => load(silent: true);

  /// Replaces loaded data locally (optimistic updates).
  void replace(T data) {
    if (!isClosed) emit(ViewState<T>.loaded(data));
  }
}

/// Infinite-scroll list with refresh and load-more, shared by every
/// paginated endpoint.
abstract class PagedCubit<T> extends Cubit<PagedState<T>> {
  PagedCubit() : super(PagedState<T>());

  ApiResult<Paginated<T>> fetchPage(int page);

  Future<void> load() async {
    emit(state.copyWith(status: PagedStatus.loading, failure: null));
    await _loadFirst();
  }

  Future<void> refresh() async {
    if (state.items.isEmpty) return load();
    await _loadFirst();
  }

  Future<void> _loadFirst() async {
    final result = await fetchPage(1);
    if (isClosed) return;
    result.match(
      (failure) {
        if (state.items.isNotEmpty) {
          emit(state.copyWith(failure: failure));
        } else {
          emit(state.copyWith(status: PagedStatus.error, failure: failure));
        }
      },
      (page) => emit(
        PagedState<T>(
          status: page.items.isEmpty ? PagedStatus.empty : PagedStatus.loaded,
          items: page.items,
          page: page.meta.currentPage,
          hasMore: page.meta.hasMore,
          extra: page.extra,
        ),
      ),
    );
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoadingMore || state.status != PagedStatus.loaded) return;
    emit(state.copyWith(isLoadingMore: true));
    final result = await fetchPage(state.page + 1);
    if (isClosed) return;
    result.match(
      (failure) => emit(state.copyWith(isLoadingMore: false, failure: failure)),
      (page) => emit(
        state.copyWith(
          items: [...state.items, ...page.items],
          page: page.meta.currentPage,
          hasMore: page.meta.hasMore,
          isLoadingMore: false,
          extra: page.extra ?? state.extra,
        ),
      ),
    );
  }

  void updateWhere(bool Function(T item) test, T Function(T item) update) {
    emit(state.copyWith(items: [for (final i in state.items) test(i) ? update(i) : i]));
  }

  void removeWhere(bool Function(T item) test) {
    final items = state.items.where((i) => !test(i)).toList();
    emit(state.copyWith(items: items, status: items.isEmpty ? PagedStatus.empty : state.status));
  }
}

/// Runs one-off actions and reports them through [ActionState].
class ActionCubit extends Cubit<ActionState> {
  ActionCubit() : super(const ActionState.idle());

  Future<bool> run<R>(ApiResult<R> Function() action) async {
    emit(const ActionState.inProgress());
    final result = await action();
    if (isClosed) return result.isRight();
    return result.match(
      (failure) {
        emit(ActionState.failure(failure));
        return false;
      },
      (value) {
        emit(ActionState.success(value));
        return true;
      },
    );
  }

  void reset() => emit(const ActionState.idle());
}
