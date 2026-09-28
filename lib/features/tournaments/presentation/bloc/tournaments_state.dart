import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/tournament.dart';

part 'tournaments_state.freezed.dart';

@freezed
sealed class TournamentsState with _$TournamentsState {
  const factory TournamentsState.initial() = TournamentsInitial;

  const factory TournamentsState.loading({
    String? statusFilter,
    String? competitionTypeFilter,
    @Default('') String query,
  }) = TournamentsLoading;

  const factory TournamentsState.loaded({
    required List<Tournament> items,
    String? statusFilter,
    String? competitionTypeFilter,
    @Default('') String query,
    required int currentPage,
    required bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = TournamentsLoaded;

  const factory TournamentsState.error(Failure failure) = TournamentsError;
}
