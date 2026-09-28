import 'package:freezed_annotation/freezed_annotation.dart';

part 'casual_matches_event.freezed.dart';

@freezed
sealed class CasualMatchesEvent with _$CasualMatchesEvent {
  const factory CasualMatchesEvent.requested({String? matchType}) = CasualMatchesRequested;

  const factory CasualMatchesEvent.matchTypeFilterChanged(String? matchType) =
      CasualMatchesMatchTypeFilterChanged;

  const factory CasualMatchesEvent.moreRequested() = CasualMatchesMoreRequested;

  const factory CasualMatchesEvent.refreshed() = CasualMatchesRefreshed;
}
