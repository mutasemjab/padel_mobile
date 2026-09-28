import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_casual_matches_usecase.dart';
import 'casual_matches_event.dart';
import 'casual_matches_state.dart';

class CasualMatchesBloc extends Bloc<CasualMatchesEvent, CasualMatchesState> {
  final GetCasualMatchesUseCase getCasualMatches;

  CasualMatchesBloc(this.getCasualMatches) : super(const CasualMatchesState.initial()) {
    on<CasualMatchesRequested>(_onRequested);
    on<CasualMatchesMatchTypeFilterChanged>(_onMatchTypeFilterChanged);
    on<CasualMatchesMoreRequested>(_onMoreRequested);
    on<CasualMatchesRefreshed>(_onRefreshed);
  }

  Future<void> _onRequested(CasualMatchesRequested event, Emitter<CasualMatchesState> emit) async {
    emit(const CasualMatchesState.loading());
    final result = await getCasualMatches(matchType: event.matchType, page: 1);
    result.match(
      (failure) => emit(CasualMatchesState.error(failure)),
      (page) => emit(CasualMatchesState.loaded(
        items: page.items,
        matchTypeFilter: event.matchType,
        currentPage: page.meta.currentPage,
        hasMore: page.meta.hasMore,
      )),
    );
  }

  Future<void> _onMatchTypeFilterChanged(
    CasualMatchesMatchTypeFilterChanged event,
    Emitter<CasualMatchesState> emit,
  ) async {
    add(CasualMatchesEvent.requested(matchType: event.matchType));
  }

  Future<void> _onRefreshed(CasualMatchesRefreshed event, Emitter<CasualMatchesState> emit) async {
    final current = state;
    final matchType = current is CasualMatchesLoaded ? current.matchTypeFilter : null;
    add(CasualMatchesEvent.requested(matchType: matchType));
  }

  Future<void> _onMoreRequested(
    CasualMatchesMoreRequested event,
    Emitter<CasualMatchesState> emit,
  ) async {
    final current = state;
    if (current is! CasualMatchesLoaded || !current.hasMore || current.isLoadingMore) return;

    emit(current.copyWith(isLoadingMore: true));
    final nextPage = current.currentPage + 1;
    final result = await getCasualMatches(matchType: current.matchTypeFilter, page: nextPage);
    result.match(
      (failure) => emit(current.copyWith(isLoadingMore: false)),
      (page) => emit(current.copyWith(
        items: [...current.items, ...page.items],
        currentPage: page.meta.currentPage,
        hasMore: page.meta.hasMore,
        isLoadingMore: false,
      )),
    );
  }
}
