import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/match.dart';
import '../../domain/entities/registration.dart';
import '../../domain/entities/tournament.dart';

part 'tournament_detail_state.freezed.dart';

@freezed
sealed class TournamentDetailState with _$TournamentDetailState {
  const factory TournamentDetailState.initial() = TournamentDetailInitial;

  const factory TournamentDetailState.loading() = TournamentDetailLoading;

  const factory TournamentDetailState.loaded({
    required Tournament tournament,
    @Default([]) List<Match> liveMatches,

    /// The player's own registrations in this tournament (drives the
    /// per-category CTA: register / waitlist / registered / payment pending).
    @Default([]) List<Registration> myRegistrations,
  }) = TournamentDetailLoaded;

  const factory TournamentDetailState.error(Failure failure) = TournamentDetailError;
}
