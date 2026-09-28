import 'dart:async';

import 'package:flutter/foundation.dart';

import 'polling_realtime_client.dart';
import 'pusher_realtime_client.dart';
import 'realtime_client.dart';

/// The client the app actually uses: socket when connected, polling while
/// the socket is down or realtime is disabled. Consumers de-duplicate by
/// payload `version`, so a brief overlap during a switch is harmless.
class HybridRealtimeClient implements RealtimeClient {
  final PusherRealtimeClient? socket;
  final PollingRealtimeClient polling;

  HybridRealtimeClient({required this.socket, required this.polling}) {
    socket?.transport.addListener(_onSocketTransport);
    polling.transport.addListener(_recompute);
  }

  final ValueNotifier<RealtimeTransport> _transport = ValueNotifier(RealtimeTransport.idle);
  final Map<String, _HybridSubscription> _subs = {};

  bool get _socketUp => socket?.transport.value == RealtimeTransport.realtime;

  @override
  ValueListenable<RealtimeTransport> get transport => _transport;

  @override
  Duration get pollInterval => polling.pollInterval;

  void _onSocketTransport() {
    for (final sub in _subs.values) {
      _updatePolling(sub);
    }
    _recompute();
  }

  void _recompute() {
    _transport.value = _socketUp
        ? RealtimeTransport.realtime
        : polling.transport.value == RealtimeTransport.polling
        ? RealtimeTransport.polling
        : RealtimeTransport.idle;
  }

  void _updatePolling(_HybridSubscription sub) {
    if (_socketUp || sub.isPrivate) {
      if (sub.pollingSub != null) {
        sub.pollingSub!.cancel();
        sub.pollingSub = null;
        polling.unsubscribe(sub.channel);
      }
    } else {
      sub.pollingSub ??= polling.subscribe(sub.channel, event: sub.event).listen(sub.controller.add);
    }
  }

  @override
  Stream<RealtimeEvent> subscribe(String channel, {required String event, bool isPrivate = false}) {
    final key = '$channel|$event';
    final existing = _subs[key];
    if (existing != null) return existing.controller.stream;

    final sub = _HybridSubscription(channel: channel, event: event, isPrivate: isPrivate);
    _subs[key] = sub;
    sub.socketSub = socket?.subscribe(channel, event: event, isPrivate: isPrivate).listen(sub.controller.add);
    _updatePolling(sub);
    _recompute();
    return sub.controller.stream;
  }

  @override
  void unsubscribe(String channel) {
    final keys = _subs.keys.where((k) => k.startsWith('$channel|')).toList();
    for (final key in keys) {
      final sub = _subs.remove(key)!;
      sub.socketSub?.cancel();
      sub.pollingSub?.cancel();
      sub.controller.close();
    }
    socket?.unsubscribe(channel);
    polling.unsubscribe(channel);
    _recompute();
  }

  @override
  Future<void> connect() async => socket?.connect();

  @override
  Future<void> disconnect() async {
    for (final key in _subs.keys.toList()) {
      unsubscribe(key.split('|').first);
    }
    await socket?.disconnect();
    await polling.disconnect();
  }
}

class _HybridSubscription {
  final String channel;
  final String event;
  final bool isPrivate;
  final StreamController<RealtimeEvent> controller = StreamController.broadcast();
  StreamSubscription<RealtimeEvent>? socketSub;
  StreamSubscription<RealtimeEvent>? pollingSub;

  _HybridSubscription({required this.channel, required this.event, required this.isPrivate});
}
