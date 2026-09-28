import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/casual_match.dart';

part 'casual_matches_state.freezed.dart';

@freezed
sealed class CasualMatchesState with _$CasualMatchesState {
  const factory CasualMatchesState.initial() = CasualMatchesInitial;

  const factory CasualMatchesState.loading() = CasualMatchesLoading;

  const factory CasualMatchesState.loaded({
    required List<CasualMatch> items,
    String? matchTypeFilter,
    required int currentPage,
    required bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = CasualMatchesLoaded;

  const factory CasualMatchesState.error(Failure failure) = CasualMatchesError;
}
