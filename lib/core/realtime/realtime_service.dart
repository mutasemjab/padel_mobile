import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/api_endpoints.dart';
import '../constants/storage_keys.dart';
import '../network/api_envelope.dart';
import 'hybrid_realtime_client.dart';
import 'polling_realtime_client.dart';
import 'pusher_realtime_client.dart';
import 'realtime_client.dart';
import 'realtime_config.dart';

/// Loads `GET realtime/config` once at startup and builds the app-wide
/// [RealtimeClient]. If the config can't be loaded (offline boot) the app
/// runs on polling until the next launch.
class RealtimeService {
  final Dio dio;
  final FlutterSecureStorage storage;

  RealtimeService({required this.dio, required this.storage});

  RealtimeConfig _config = RealtimeConfig.disabled;
  RealtimeClient? _client;

  RealtimeConfig get config => _config;

  RealtimeClient get client => _client ??= _build();

  Future<void> bootstrap() async {
    try {
      final response = await dio.get(ApiEndpoints.realtimeConfig);
      _config = RealtimeConfig.fromJson(ApiEnvelope.map(response));
    } catch (e) {
      if (kDebugMode) debugPrint('RealtimeService: config unavailable, polling only ($e)');
    }
    _client = _build();
    await _client!.connect();
  }

  RealtimeClient _build() {
    final polling = PollingRealtimeClient(dio: dio, config: _config);
    final socket = _config.canConnect
        ? PusherRealtimeClient(
            config: _config,
            tokenProvider: () => storage.read(key: StorageKeys.authToken),
          )
        : null;
    return HybridRealtimeClient(socket: socket, polling: polling);
  }
}
