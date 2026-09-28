import 'package:freezed_annotation/freezed_annotation.dart';

part 'tournaments_event.freezed.dart';

@freezed
sealed class TournamentsEvent with _$TournamentsEvent {
  const factory TournamentsEvent.requested({
    String? status,
    String? competitionType,
    String? query,
  }) = TournamentsRequested;

  const factory TournamentsEvent.statusFilterChanged(String? status) = TournamentsStatusFilterChanged;

  /// `ranked | certified | social`, or null for all.
  const factory TournamentsEvent.competitionTypeChanged(String? competitionType) =
      TournamentsCompetitionTypeChanged;

  const factory TournamentsEvent.queryChanged(String query) = TournamentsQueryChanged;

  const factory TournamentsEvent.moreRequested() = TournamentsMoreRequested;

  const factory TournamentsEvent.refreshed() = TournamentsRefreshed;
}
