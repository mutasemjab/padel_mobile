import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/models/player_summary.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../tournaments/domain/entities/venue.dart';

enum CasualMatchType { lookingForMatch, lookingForPartner, need1, need2, need3 }

extension CasualMatchTypeX on CasualMatchType {
  static CasualMatchType fromApi(String? raw) {
    switch (raw) {
      case 'looking_for_partner':
        return CasualMatchType.lookingForPartner;
      case 'need_1':
        return CasualMatchType.need1;
      case 'need_2':
        return CasualMatchType.need2;
      case 'need_3':
        return CasualMatchType.need3;
      case 'looking_for_match':
      default:
        return CasualMatchType.lookingForMatch;
    }
  }

  String get apiValue => switch (this) {
        CasualMatchType.lookingForMatch => 'looking_for_match',
        CasualMatchType.lookingForPartner => 'looking_for_partner',
        CasualMatchType.need1 => 'need_1',
        CasualMatchType.need2 => 'need_2',
        CasualMatchType.need3 => 'need_3',
      };

  String label(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      CasualMatchType.lookingForMatch => l10n.casualFilterLookingForMatch,
      CasualMatchType.lookingForPartner => l10n.casualFilterLookingForPartner,
      CasualMatchType.need1 => l10n.casualFilterNeed1,
      CasualMatchType.need2 => l10n.casualFilterNeed2,
      CasualMatchType.need3 => l10n.casualFilterNeed3,
    };
  }
}

enum ParticipantStatus {
  requested,
  accepted,
  declined;

  static ParticipantStatus fromApi(String? raw) =>
      ParticipantStatus.values.firstWhere((s) => s.name == raw, orElse: () => ParticipantStatus.requested);
}

class CasualParticipant extends Equatable {
  final int id;
  final ParticipantStatus status;
  final PlayerSummary? player;

  const CasualParticipant({required this.id, required this.status, this.player});

  @override
  List<Object?> get props => [id, status, player];
}

/// A social pickup-match post — purely casual (`is_official: false`), never
/// mixed with tournament data or a player's rating/ranking.
class CasualMatch extends Equatable {
  final int id;
  final PlayerSummary creator;
  final Venue? venue;
  final Court? court;
  final CasualMatchType matchType;
  final DateTime scheduledAt;
  final String? requiredLevel;
  final String? preferredSide;
  final int playersNeeded;
  final int acceptedCount;
  final int? spotsLeft;
  final String status;
  final String? notes;
  final bool isCreator;
  final CasualParticipant? myParticipation;
  final List<CasualParticipant> participants;

  const CasualMatch({
    required this.id,
    required this.creator,
    this.venue,
    this.court,
    required this.matchType,
    required this.scheduledAt,
    this.requiredLevel,
    this.preferredSide,
    this.playersNeeded = 0,
    this.acceptedCount = 0,
    this.spotsLeft,
    required this.status,
    this.notes,
    this.isCreator = false,
    this.myParticipation,
    this.participants = const [],
  });

  bool get isOpen => status == 'open';

  String? get courtName => court?.name;

  List<CasualParticipant> get pendingRequests =>
      participants.where((p) => p.status == ParticipantStatus.requested).toList();

  @override
  List<Object?> get props => [
        id,
        creator,
        venue,
        court,
        matchType,
        scheduledAt,
        requiredLevel,
        preferredSide,
        playersNeeded,
        acceptedCount,
        spotsLeft,
        status,
        notes,
        isCreator,
        myParticipation,
        participants,
      ];
}
