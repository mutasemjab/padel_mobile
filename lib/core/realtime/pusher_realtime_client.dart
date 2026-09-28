import 'dart:async';

import 'package:dart_pusher_channels/dart_pusher_channels.dart';
import 'package:flutter/foundation.dart';

import '../constants/api_endpoints.dart';
import 'realtime_client.dart';
import 'realtime_config.dart';

/// Pusher-protocol WebSocket client (works with Pusher, Laravel Reverb and
/// soketi). Public channels need no auth; private channels authorize against
/// `broadcasting/auth` with the bearer token.
class PusherRealtimeClient implements RealtimeClient {
  final RealtimeConfig config;
  final Future<String?> Function() tokenProvider;

  PusherRealtimeClient({required this.config, required this.tokenProvider});

  final ValueNotifier<RealtimeTransport> _transport = ValueNotifier(RealtimeTransport.idle);
  final Map<String, Channel> _channels = {};
  final Map<String, StreamController<RealtimeEvent>> _controllers = {};
  final Map<String, StreamSubscription> _bindings = {};

  PusherChannelsClient? _client;
  StreamSubscription? _lifecycle;
  StreamSubscription? _established;

  @override
  ValueListenable<RealtimeTransport> get transport => _transport;

  @override
  Duration get pollInterval => Duration(seconds: config.pollIntervalSeconds);

  PusherChannelsOptions _options() {
    final scheme = switch (config.scheme) {
      'https' || 'wss' => 'wss',
      'http' || 'ws' => 'ws',
      _ => 'wss',
    };
    final host = config.host;
    if (host != null && host.isNotEmpty) {
      return PusherChannelsOptions.fromHost(
        scheme: scheme,
        host: host,
        key: config.key!,
        port: config.port ?? (scheme == 'wss' ? 443 : 80),
        shouldSupplyMetadataQueries: true,
        metadata: PusherChannelsOptionsMetadata.byDefault(),
      );
    }
    return PusherChannelsOptions.fromCluster(
      scheme: scheme,
      cluster: config.cluster ?? 'mt1',
      key: config.key!,
      host: 'pusher.com',
      port: config.port ?? 443,
      shouldSupplyMetadataQueries: true,
      metadata: PusherChannelsOptionsMetadata.byDefault(),
    );
  }

  @override
  Future<void> connect() async {
    if (!config.canConnect || _client != null) return;
    final client = PusherChannelsClient.websocket(
      options: _options(),
      connectionErrorHandler: (exception, trace, refresh) {
        _transport.value = RealtimeTransport.idle;
        refresh();
      },
      minimumReconnectDelayDuration: const Duration(seconds: 2),
    );
    _client = client;
    _lifecycle = client.lifecycleStream.listen((state) {
      _transport.value = state == PusherChannelsClientLifeCycleState.establishedConnection
          ? RealtimeTransport.realtime
          : RealtimeTransport.idle;
    });
    _established = client.onConnectionEstablished.listen((_) {
      for (final channel in _channels.values) {
        channel.subscribeIfNotUnsubscribed();
      }
    });
    unawaited(client.connect());
  }

  @override
  Stream<RealtimeEvent> subscribe(String channel, {required String event, bool isPrivate = false}) {
    final key = '$channel|$event';
    final existing = _controllers[key];
    if (existing != null) return existing.stream;

    final controller = StreamController<RealtimeEvent>.broadcast();
    _controllers[key] = controller;

    final client = _client;
    if (client == null) return controller.stream;

    final pusherChannel = _channels.putIfAbsent(channel, () {
      if (isPrivate) {
        return client.privateChannel(
          channel,
          authorizationDelegate: _AuthDelegate(
            endpoint: Uri.parse(config.authEndpoint ?? ApiEndpoints.broadcastingAuth),
            tokenProvider: tokenProvider,
          ),
        );
      }
      return client.publicChannel(channel);
    });

    _bindings[key] = pusherChannel.bindToAll().listen((readEvent) {
      final name = readEvent.name;
      // Laravel may prefix custom names with a dot; match both forms.
      if (name != event && name != '.$event' && !name.endsWith(event)) return;
      final data = readEvent.tryGetDataAsMap();
      if (data != null) controller.add(RealtimeEvent(channel: channel, event: event, data: data));
    });

    if (_transport.value == RealtimeTransport.realtime) pusherChannel.subscribe();
    return controller.stream;
  }

  @override
  void unsubscribe(String channel) {
    final keys = _controllers.keys.where((k) => k.startsWith('$channel|')).toList();
    for (final key in keys) {
      _bindings.remove(key)?.cancel();
      _controllers.remove(key)?.close();
    }
    _channels.remove(channel)?.unsubscribe();
  }

  @override
  Future<void> disconnect() async {
    for (final channel in _channels.keys.toList()) {
      unsubscribe(channel);
    }
    await _lifecycle?.cancel();
    await _established?.cancel();
    _client?.dispose();
    _client = null;
    _transport.value = RealtimeTransport.idle;
  }
}

/// Private-channel authorization that reads the current bearer token at
/// subscribe time (the token can change between logins).
class _AuthDelegate implements EndpointAuthorizableChannelAuthorizationDelegate<PrivateChannelAuthorizationData> {
  final Uri endpoint;
  final Future<String?> Function() tokenProvider;

  _AuthDelegate({required this.endpoint, required this.tokenProvider});

  @override
  EndpointAuthFailedCallback? get onAuthFailed => null;

  @override
  Future<PrivateChannelAuthorizationData> authorizationData(String socketId, String channelName) async {
    final token = await tokenProvider();
    final delegate = EndpointAuthorizableChannelTokenAuthorizationDelegate.forPrivateChannel(
      authorizationEndpoint: endpoint,
      headers: {'Accept': 'application/json', if (token != null) 'Authorization': 'Bearer $token'},
    );
    return delegate.authorizationData(socketId, channelName);
  }
}
