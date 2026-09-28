import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/get_tournaments_usecase.dart';
import 'tournaments_event.dart';
import 'tournaments_state.dart';

/// Paginated tournament list (live/open first, as ordered by the backend)
/// with status, competition-type and text filters.
class TournamentsBloc extends Bloc<TournamentsEvent, TournamentsState> {
  final GetTournamentsUseCase getTournaments;

  String? _status;
  String? _competitionType;
  String _query = '';

  TournamentsBloc(this.getTournaments) : super(const TournamentsState.initial()) {
    on<TournamentsRequested>(_onRequested);
    on<TournamentsStatusFilterChanged>(
      (event, emit) => add(TournamentsEvent.requested(status: event.status, competitionType: _competitionType, query: _query)),
    );
    on<TournamentsCompetitionTypeChanged>(
      (event, emit) => add(TournamentsEvent.requested(status: _status, competitionType: event.competitionType, query: _query)),
    );
    on<TournamentsQueryChanged>(
      (event, emit) => add(TournamentsEvent.requested(status: _status, competitionType: _competitionType, query: event.query)),
    );
    on<TournamentsMoreRequested>(_onMoreRequested);
    on<TournamentsRefreshed>(
      (event, emit) => add(TournamentsEvent.requested(status: _status, competitionType: _competitionType, query: _query)),
    );
  }

  Future<void> _onRequested(TournamentsRequested event, Emitter<TournamentsState> emit) async {
    _status = event.status;
    _competitionType = event.competitionType;
    _query = event.query ?? '';
    emit(TournamentsState.loading(statusFilter: _status, competitionTypeFilter: _competitionType, query: _query));
    final result = await getTournaments(
      status: _status,
      competitionType: _competitionType,
      q: _query.isEmpty ? null : _query,
      page: 1,
    );
    result.match(
      (failure) => emit(TournamentsState.error(failure)),
      (page) => emit(TournamentsState.loaded(
        items: page.items,
        statusFilter: _status,
        competitionTypeFilter: _competitionType,
        query: _query,
        currentPage: page.meta.currentPage,
        hasMore: page.meta.hasMore,
      )),
    );
  }

  Future<void> _onMoreRequested(TournamentsMoreRequested event, Emitter<TournamentsState> emit) async {
    final current = state;
    if (current is! TournamentsLoaded || !current.hasMore || current.isLoadingMore) return;

    emit(current.copyWith(isLoadingMore: true));
    final result = await getTournaments(
      status: current.statusFilter,
      competitionType: current.competitionTypeFilter,
      q: current.query.isEmpty ? null : current.query,
      page: current.currentPage + 1,
    );
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
