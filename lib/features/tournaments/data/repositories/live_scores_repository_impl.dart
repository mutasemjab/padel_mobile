import 'package:flutter/foundation.dart';

import '../../../../core/realtime/realtime_client.dart';
import '../../../../core/realtime/realtime_service.dart';
import '../../../../core/utils/json_utils.dart';
import '../../domain/entities/live_payload.dart';
import '../../domain/repositories/live_scores_repository.dart';
import '../models/live_payload_model.dart';
import '../models/match_model.dart';

class LiveScoresRepositoryImpl implements LiveScoresRepository {
  final RealtimeService realtime;

  LiveScoresRepositoryImpl(this.realtime);

  RealtimeClient get _client => realtime.client;

  String _matchChannel(int matchId) => realtime.config.matchChannel.resolve({'matchId': matchId});

  String _tournamentChannel(int tournamentId) =>
      realtime.config.tournamentLiveChannel.resolve({'tournamentId': tournamentId});

  String get _event {
    final events = realtime.config.matchChannel.events;
    return events.isEmpty ? 'score.updated' : events.first;
  }

  @override
  ValueListenable<RealtimeTransport> get transport => _client.transport;

  @override
  Duration get pollInterval => _client.pollInterval;

  LivePayload? _parse(Map<String, dynamic> data) {
    if (data['match_id'] == null) return null;
    try {
      return LivePayloadModel.fromJson(data)
          .toEntity(pollIntervalSeconds: Json.integer(data['poll_interval_seconds']));
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<LivePayload> watchMatch(int matchId) => _client
      .subscribe(_matchChannel(matchId), event: _event)
      .map((e) => _parse(e.data))
      .where((p) => p != null)
      .cast<LivePayload>();

  @override
  void stopMatch(int matchId) => _client.unsubscribe(_matchChannel(matchId));

  @override
  Stream<TournamentLiveEvent> watchTournament(int tournamentId) {
    final event = realtime.config.tournamentLiveChannel.events.isEmpty
        ? 'score.updated'
        : realtime.config.tournamentLiveChannel.events.first;
    return _client.subscribe(_tournamentChannel(tournamentId), event: event).map<TournamentLiveEvent?>((e) {
      if (e.data['event'] == 'snapshot') {
        return TournamentLiveSnapshot(Json.listOfMaps(e.data['matches']).map(matchFromJson).toList());
      }
      final payload = _parse(e.data);
      return payload == null ? null : TournamentLiveScore(payload);
    }).where((e) => e != null).cast<TournamentLiveEvent>();
  }

  @override
  void stopTournament(int tournamentId) => _client.unsubscribe(_tournamentChannel(tournamentId));
}
