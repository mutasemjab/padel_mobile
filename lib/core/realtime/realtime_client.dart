import 'package:flutter/foundation.dart';

/// How live data is currently arriving — shown as a small indicator
/// ("Live · realtime" / "Live · updating every 5 s").
enum RealtimeTransport { realtime, polling, idle }

/// One decoded broadcast event.
class RealtimeEvent {
  final String channel;
  final String event;
  final Map<String, dynamic> data;

  const RealtimeEvent({required this.channel, required this.event, required this.data});
}

/// Transport-agnostic subscription API. Screens subscribe to a channel +
/// event and get decoded payload maps; whether they come from a Pusher
/// socket or from polling is the implementation's business.
abstract class RealtimeClient {
  ValueListenable<RealtimeTransport> get transport;

  /// Poll interval used when falling back to HTTP.
  Duration get pollInterval;

  Stream<RealtimeEvent> subscribe(String channel, {required String event, bool isPrivate = false});

  void unsubscribe(String channel);

  Future<void> connect();

  Future<void> disconnect();
}
