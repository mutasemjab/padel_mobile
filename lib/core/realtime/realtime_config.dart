import 'package:equatable/equatable.dart';

import '../utils/json_utils.dart';

class RealtimeChannelSpec extends Equatable {
  /// Template such as `match.{matchId}`.
  final String name;
  final String type;
  final List<String> events;

  const RealtimeChannelSpec({required this.name, required this.type, required this.events});

  String resolve(Map<String, Object> params) {
    var result = name;
    params.forEach((key, value) => result = result.replaceAll('{$key}', '$value'));
    return result;
  }

  @override
  List<Object?> get props => [name, type, events];
}

/// `GET realtime/config`. When [enabled] is false the app polls only.
class RealtimeConfig extends Equatable {
  final bool enabled;
  final String? driver;
  final String protocol;
  final String? key;
  final String? cluster;
  final String? host;
  final int? port;
  final String? scheme;
  final String? authEndpoint;
  final Map<String, RealtimeChannelSpec> channels;
  final int pollIntervalSeconds;

  const RealtimeConfig({
    required this.enabled,
    this.driver,
    this.protocol = 'pusher',
    this.key,
    this.cluster,
    this.host,
    this.port,
    this.scheme,
    this.authEndpoint,
    this.channels = const {},
    this.pollIntervalSeconds = 5,
  });

  static const RealtimeConfig disabled = RealtimeConfig(enabled: false);

  bool get canConnect => enabled && protocol == 'pusher' && (key?.isNotEmpty ?? false);

  RealtimeChannelSpec get matchChannel =>
      channels['match'] ??
      const RealtimeChannelSpec(name: 'match.{matchId}', type: 'public', events: ['score.updated']);

  RealtimeChannelSpec get tournamentLiveChannel =>
      channels['tournament_live'] ??
      const RealtimeChannelSpec(name: 'tournament.{tournamentId}.live', type: 'public', events: ['score.updated']);

  RealtimeChannelSpec get userChannel =>
      channels['user'] ??
      const RealtimeChannelSpec(
        name: 'private-App.Models.User.{userId}',
        type: 'private',
        events: ['notification.created'],
      );

  factory RealtimeConfig.fromJson(Map<String, dynamic> json) {
    final rawChannels = Json.map(json['channels']) ?? const {};
    return RealtimeConfig(
      enabled: Json.boolean(json['enabled']),
      driver: Json.string(json['driver']),
      protocol: Json.string(json['protocol']) ?? 'pusher',
      key: Json.string(json['key']),
      cluster: Json.string(json['cluster']),
      host: Json.string(json['host']),
      port: Json.integer(json['port']),
      scheme: Json.string(json['scheme']),
      authEndpoint: Json.string(json['auth_endpoint']),
      channels: {
        for (final e in rawChannels.entries)
          if (e.value is Map)
            e.key: RealtimeChannelSpec(
              name: Json.string((e.value as Map)['name']) ?? '',
              type: Json.string((e.value as Map)['type']) ?? 'public',
              events: Json.strings((e.value as Map)['events']),
            ),
      },
      pollIntervalSeconds: Json.integer(json['poll_interval_seconds']) ?? 5,
    );
  }

  @override
  List<Object?> get props => [
    enabled,
    driver,
    protocol,
    key,
    cluster,
    host,
    port,
    scheme,
    authEndpoint,
    channels,
    pollIntervalSeconds,
  ];
}
