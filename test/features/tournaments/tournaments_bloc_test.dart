import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:padel/core/error/failure.dart';
import 'package:padel/core/network/pagination_meta.dart';
import 'package:padel/features/tournaments/domain/entities/tournament.dart';
import 'package:padel/features/tournaments/domain/usecases/get_tournaments_usecase.dart';
import 'package:padel/features/tournaments/presentation/bloc/tournaments_bloc.dart';
import 'package:padel/features/tournaments/presentation/bloc/tournaments_event.dart';
import 'package:padel/features/tournaments/presentation/bloc/tournaments_state.dart';

class _MockGetTournamentsUseCase extends Mock implements GetTournamentsUseCase {}

Tournament _tournament(int id) => Tournament(
      id: id,
      name: 'Tournament $id',
      startDate: DateTime(2026, 10, 1),
      endDate: DateTime(2026, 10, 3),
      status: TournamentStatus.registrationOpen,
    );

void main() {
  late _MockGetTournamentsUseCase getTournaments;

  setUp(() {
    getTournaments = _MockGetTournamentsUseCase();
  });

  blocTest<TournamentsBloc, TournamentsState>(
    'emits [loading, loaded] on a successful first page',
    build: () {
      when(() => getTournaments(status: null, page: 1)).thenAnswer(
        (_) async => Right(Paginated(
          items: [_tournament(1), _tournament(2)],
          meta: const PaginationMeta(currentPage: 1, lastPage: 2, perPage: 2, total: 4),
        )),
      );
      return TournamentsBloc(getTournaments);
    },
    act: (bloc) => bloc.add(const TournamentsEvent.requested()),
    expect: () => [
      const TournamentsState.loading(),
      isA<TournamentsLoaded>()
          .having((s) => s.items.length, 'items.length', 2)
          .having((s) => s.hasMore, 'hasMore', true)
          .having((s) => s.currentPage, 'currentPage', 1),
    ],
  );

  blocTest<TournamentsBloc, TournamentsState>(
    'competition-type filter keeps the status filter and queries ranked only',
    build: () {
      when(() => getTournaments(status: 'ongoing', competitionType: 'ranked', q: null, page: 1)).thenAnswer(
        (_) async => Right(Paginated(
          items: [_tournament(1)],
          meta: const PaginationMeta(currentPage: 1, lastPage: 1, perPage: 15, total: 1),
        )),
      );
      when(() => getTournaments(status: 'ongoing', competitionType: null, q: null, page: 1)).thenAnswer(
        (_) async => Right(Paginated(
          items: [_tournament(1), _tournament(2)],
          meta: const PaginationMeta(currentPage: 1, lastPage: 1, perPage: 15, total: 2),
        )),
      );
      return TournamentsBloc(getTournaments);
    },
    act: (bloc) async {
      bloc.add(const TournamentsEvent.requested(status: 'ongoing'));
      await Future<void>.delayed(Duration.zero);
      bloc.add(const TournamentsEvent.competitionTypeChanged('ranked'));
    },
    skip: 2,
    expect: () => [
      isA<TournamentsLoading>().having((s) => s.competitionTypeFilter, 'type', 'ranked'),
      isA<TournamentsLoaded>()
          .having((s) => s.statusFilter, 'status', 'ongoing')
          .having((s) => s.competitionTypeFilter, 'type', 'ranked')
          .having((s) => s.items.length, 'items', 1),
    ],
  );

  blocTest<TournamentsBloc, TournamentsState>(
    'emits [loading, error] when the first page fails',
    build: () {
      when(() => getTournaments(status: null, page: 1))
          .thenAnswer((_) async => const Left(ServerFailure()));
      return TournamentsBloc(getTournaments);
    },
    act: (bloc) => bloc.add(const TournamentsEvent.requested()),
    expect: () => [
      const TournamentsState.loading(),
      isA<TournamentsError>(),
    ],
  );

  blocTest<TournamentsBloc, TournamentsState>(
    'appends the next page and flips hasMore to false once the last page loads',
    build: () {
      when(() => getTournaments(status: null, page: 1)).thenAnswer(
        (_) async => Right(Paginated(
          items: [_tournament(1)],
          meta: const PaginationMeta(currentPage: 1, lastPage: 2, perPage: 1, total: 2),
        )),
      );
      when(() => getTournaments(status: null, page: 2)).thenAnswer(
        (_) async => Right(Paginated(
          items: [_tournament(2)],
          meta: const PaginationMeta(currentPage: 2, lastPage: 2, perPage: 1, total: 2),
        )),
      );
      return TournamentsBloc(getTournaments);
    },
    act: (bloc) async {
      bloc.add(const TournamentsEvent.requested());
      await Future<void>.delayed(Duration.zero);
      bloc.add(const TournamentsEvent.moreRequested());
    },
    expect: () => [
      const TournamentsState.loading(),
      isA<TournamentsLoaded>().having((s) => s.items.length, 'items.length', 1),
      isA<TournamentsLoaded>().having((s) => s.isLoadingMore, 'isLoadingMore', true),
      isA<TournamentsLoaded>()
          .having((s) => s.items.length, 'items.length', 2)
          .having((s) => s.hasMore, 'hasMore', false)
          .having((s) => s.isLoadingMore, 'isLoadingMore', false),
    ],
  );
}
