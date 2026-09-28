import 'package:flutter/foundation.dart';

import '../../../../core/realtime/realtime_client.dart';
import '../entities/live_payload.dart';
import '../entities/match.dart';

/// Something happened on a tournament's live channel.
sealed class TournamentLiveEvent {
  const TournamentLiveEvent();
}

/// Full list of live matches (polling fallback snapshot).
class TournamentLiveSnapshot extends TournamentLiveEvent {
  final List<Match> matches;

  const TournamentLiveSnapshot(this.matches);
}

/// One match's score changed (socket `score.updated`).
class TournamentLiveScore extends TournamentLiveEvent {
  final LivePayload payload;

  const TournamentLiveScore(this.payload);
}

/// Live score streams over the realtime socket with the polling fallback —
/// callers get identical payloads either way.
abstract class LiveScoresRepository {
  ValueListenable<RealtimeTransport> get transport;

  Duration get pollInterval;

  Stream<LivePayload> watchMatch(int matchId);

  void stopMatch(int matchId);

  Stream<TournamentLiveEvent> watchTournament(int tournamentId);

  void stopTournament(int tournamentId);
}
