import 'package:equatable/equatable.dart';

/// Minimal, feature-agnostic snapshot of a player — the backend's
/// PlayerSummary shape, embedded in teams, rankings, partners, casual
/// matches, requests… Features render it without importing each other.
class PlayerSummary extends Equatable {
  final String playerId;
  final String name;
  final String? photoUrl;
  final String? level;
  final int? skillRating;
  final String? side;
  final String? country;
  final bool isPremium;

  const PlayerSummary({
    required this.playerId,
    required this.name,
    this.photoUrl,
    this.level,
    this.skillRating,
    this.side,
    this.country,
    this.isPremium = false,
  });

  String get initials {
    final parts = name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.characters1;
    return '${parts.first.characters1}${parts.last.characters1}';
  }

  @override
  List<Object?> get props => [playerId, name, photoUrl, level, skillRating, side, country, isPremium];
}

extension on String {
  String get characters1 => isEmpty ? '' : String.fromCharCode(runes.first).toUpperCase();
}
