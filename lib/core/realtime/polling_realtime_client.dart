import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/api_endpoints.dart';
import '../network/api_envelope.dart';
import 'realtime_client.dart';
import 'realtime_config.dart';

/// HTTP fallback with the same contract as the socket client:
/// - `match.{id}` polls `GET matches/{id}/live?since_version=N` and emits the
///   payload only when `changed == true`; it stops once the match is no
///   longer `in_progress`.
/// - `tournament.{id}.live` polls `GET tournaments/{id}/live` and emits a
///   `{event: "snapshot", matches: [...]}` payload.
/// Private channels have no HTTP equivalent (push notifications cover them).
class PollingRealtimeClient implements RealtimeClient {
  final Dio dio;
  final RealtimeConfig config;

  PollingRealtimeClient({required this.dio, required this.config});

  final ValueNotifier<RealtimeTransport> _transport = ValueNotifier(RealtimeTransport.idle);
  final Map<String, _Poller> _pollers = {};

  @override
  ValueListenable<RealtimeTransport> get transport => _transport;

  @override
  Duration get pollInterval => Duration(seconds: config.pollIntervalSeconds.clamp(2, 60));

  static RegExp _pattern(String template) {
    final escaped = RegExp.escape(template).replaceAllMapped(RegExp(r'\\\{\w+\\\}|\{\w+\}'), (_) => r'(\d+)');
    return RegExp('^$escaped\$');
  }

  @override
  Stream<RealtimeEvent> subscribe(String channel, {required String event, bool isPrivate = false}) {
    if (isPrivate) return const Stream.empty();
    final existing = _pollers[channel];
    if (existing != null) return existing.controller.stream;

    final matchId = _pattern(config.matchChannel.name).firstMatch(channel)?.group(1);
    final tournamentId = _pattern(config.tournamentLiveChannel.name).firstMatch(channel)?.group(1);

    final _Poller poller;
    if (matchId != null) {
      poller = _MatchPoller(dio: dio, matchId: int.parse(matchId), channel: channel, event: event);
    } else if (tournamentId != null) {
      poller = _TournamentPoller(dio: dio, tournamentId: int.parse(tournamentId), channel: channel, event: event);
    } else {
      return const Stream.empty();
    }
    _pollers[channel] = poller;
    poller.start(pollInterval);
    _refreshTransport();
    return poller.controller.stream;
  }

  @override
  void unsubscribe(String channel) {
    _pollers.remove(channel)?.stop();
    _refreshTransport();
  }

  void _refreshTransport() {
    _transport.value = _pollers.isEmpty ? RealtimeTransport.idle : RealtimeTransport.polling;
  }

  @override
  Future<void> connect() async {}

  @override
  Future<void> disconnect() async {
    for (final channel in _pollers.keys.toList()) {
      unsubscribe(channel);
    }
  }
}

abstract class _Poller {
  final String channel;
  final String event;
  final StreamController<RealtimeEvent> controller = StreamController.broadcast();
  Timer? _timer;
  bool _inFlight = false;

  _Poller({required this.channel, required this.event});

  void start(Duration interval) {
    _tick();
    _timer = Timer.periodic(interval, (_) => _tick());
  }

  Future<void> _tick() async {
    if (_inFlight) return;
    _inFlight = true;
    try {
      await poll();
    } catch (_) {
      // A transient failure must not blank a live score; try again next tick.
    } finally {
      _inFlight = false;
    }
  }

  Future<void> poll();

  void emit(Map<String, dynamic> data) {
    if (!controller.isClosed) controller.add(RealtimeEvent(channel: channel, event: event, data: data));
  }

  void halt() => _timer?.cancel();

  void stop() {
    _timer?.cancel();
    controller.close();
  }
}

class _MatchPoller extends _Poller {
  final Dio dio;
  final int matchId;
  int _sinceVersion = 0;

  _MatchPoller({required this.dio, required this.matchId, required super.channel, required super.event});

  @override
  Future<void> poll() async {
    final response = await dio.get(ApiEndpoints.matchLive(matchId), queryParameters: {'since_version': _sinceVersion});
    final data = ApiEnvelope.map(response);
    final meta = ApiEnvelope.meta(response);
    final changed = data['changed'] != false;
    final version = (data['version'] as num?)?.toInt();
    if (version != null) _sinceVersion = version;
    if (changed) {
      emit({
        ...data,
        if (meta?['poll_interval_seconds'] != null) 'poll_interval_seconds': meta!['poll_interval_seconds'],
      });
    }
    if (data['status'] != null && data['status'] != 'in_progress') halt();
  }
}

class _TournamentPoller extends _Poller {
  final Dio dio;
  final int tournamentId;

  _TournamentPoller({required this.dio, required this.tournamentId, required super.channel, required super.event});

  @override
  Future<void> poll() async {
    final response = await dio.get(ApiEndpoints.tournamentLive(tournamentId));
    emit({'event': 'snapshot', 'matches': ApiEnvelope.list(response)});
  }
}
