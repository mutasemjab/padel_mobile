import 'package:equatable/equatable.dart';

enum DuoMediaStatus {
  queued,
  processing,
  completed,
  failed;

  static DuoMediaStatus fromApi(String? raw) =>
      DuoMediaStatus.values.firstWhere((s) => s.name == raw, orElse: () => DuoMediaStatus.queued);

  bool get isPending => this == queued || this == processing;
}

/// What the generator returned — Higgsfield produces video and stills; a
/// `.glb` model is supported too so the provider can change later.
enum DuoMediaType {
  video,
  image,
  model;

  static DuoMediaType fromApi(String? raw) =>
      DuoMediaType.values.firstWhere((t) => t.name == raw, orElse: () => DuoMediaType.video);
}

/// One duo generation job for the player and their main partner.
class DuoMedia extends Equatable {
  final int id;
  final DuoMediaStatus status;
  final DuoMediaType mediaType;
  final String? mediaUrl;
  final String? thumbnailUrl;
  final String? error;
  final DateTime? requestedAt;
  final DateTime? completedAt;

  const DuoMedia({
    required this.id,
    required this.status,
    this.mediaType = DuoMediaType.video,
    this.mediaUrl,
    this.thumbnailUrl,
    this.error,
    this.requestedAt,
    this.completedAt,
  });

  @override
  List<Object?> get props => [id, status, mediaType, mediaUrl, thumbnailUrl, error, requestedAt, completedAt];
}

/// `GET me/main-partner/duo-3d`.
class DuoMediaState extends Equatable {
  /// False until the backend has a Higgsfield key — the UI shows "coming soon".
  final bool providerConfigured;

  /// Both players need a profile photo; the generator works from them.
  final bool requiresPhotos;

  /// The job in flight (or the latest attempt).
  final DuoMedia? current;

  /// Last successful result, kept visible while a new one generates.
  final DuoMedia? latestCompleted;

  const DuoMediaState({
    required this.providerConfigured,
    this.requiresPhotos = false,
    this.current,
    this.latestCompleted,
  });

  @override
  List<Object?> get props => [providerConfigured, requiresPhotos, current, latestCompleted];
}
