import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../l10n/gen/app_localizations.dart';
import 'match.dart';
import 'venue.dart';

enum TournamentStatus {
  draft,
  registrationOpen,
  registrationClosed,
  ongoing,
  completed,
  cancelled,
}

extension TournamentStatusX on TournamentStatus {
  static TournamentStatus fromApi(String? raw) {
    switch (raw) {
      case 'registration_open':
        return TournamentStatus.registrationOpen;
      case 'registration_closed':
        return TournamentStatus.registrationClosed;
      case 'ongoing':
        return TournamentStatus.ongoing;
      case 'completed':
        return TournamentStatus.completed;
      case 'cancelled':
        return TournamentStatus.cancelled;
      case 'draft':
      default:
        return TournamentStatus.draft;
    }
  }

  String get apiValue => switch (this) {
        TournamentStatus.draft => 'draft',
        TournamentStatus.registrationOpen => 'registration_open',
        TournamentStatus.registrationClosed => 'registration_closed',
        TournamentStatus.ongoing => 'ongoing',
        TournamentStatus.completed => 'completed',
        TournamentStatus.cancelled => 'cancelled',
      };

  String label(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (this) {
      TournamentStatus.draft => l10n.statusDraft,
      TournamentStatus.registrationOpen => l10n.statusRegistrationOpen,
      TournamentStatus.registrationClosed => l10n.statusRegistrationClosed,
      TournamentStatus.ongoing => l10n.statusOngoing,
      TournamentStatus.completed => l10n.statusCompleted,
      TournamentStatus.cancelled => l10n.statusCancelled,
    };
  }
}

/// Only `ranked` tournaments move Skill Rating / Season Ranking.
enum CompetitionType {
  ranked,
  certified,
  social;

  static CompetitionType fromApi(String? raw, {bool rankingEligible = false}) => switch (raw) {
        'ranked' => CompetitionType.ranked,
        'certified' => CompetitionType.certified,
        'social' => CompetitionType.social,
        _ => rankingEligible ? CompetitionType.ranked : CompetitionType.social,
      };

  String get apiValue => name;
}

class TournamentCategory extends Equatable {
  final int id;
  final int? tournamentId;
  final String name;
  final String? level;

  /// Levels allowed in this category (empty = every level).
  final List<String> levels;
  final String? gender;
  final String? format;
  final int maxTeams;
  final int activeTeams;
  final num registrationFee;
  final String? currency;
  final bool requiresPayment;
  final num? rankingWeight;
  final bool isActive;
  final bool isFull;
  final int waitlistCount;
  final DateTime? completedAt;
  final MatchTeam? champion;

  const TournamentCategory({
    required this.id,
    this.tournamentId,
    required this.name,
    this.level,
    this.levels = const [],
    this.gender,
    this.format,
    required this.maxTeams,
    required this.activeTeams,
    required this.registrationFee,
    this.currency,
    this.requiresPayment = false,
    this.rankingWeight,
    this.isActive = true,
    required this.isFull,
    this.waitlistCount = 0,
    this.completedAt,
    this.champion,
  });

  int get spotsLeft => (maxTeams - activeTeams).clamp(0, maxTeams);

  @override
  List<Object?> get props => [
        id,
        tournamentId,
        name,
        level,
        levels,
        gender,
        format,
        maxTeams,
        activeTeams,
        registrationFee,
        currency,
        requiresPayment,
        rankingWeight,
        isActive,
        isFull,
        waitlistCount,
        completedAt,
        champion,
      ];
}

class Tournament extends Equatable {
  final int id;
  final String name;
  final String? description;
  final String? rules;
  final String? imageUrl;
  final Venue? venue;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime? registrationOpensAt;
  final DateTime? registrationClosesAt;
  final DateTime? completedAt;
  final TournamentStatus status;
  final CompetitionType competitionType;
  final String? format;
  final String? certificationStatus;
  final bool isRankingEligible;
  final bool registrationOpen;
  final int liveMatchesCount;
  final List<TournamentCategory> categories;

  /// Paid tournament: every team pays [entryFee] (cash at the venue or online).
  final bool isPaid;
  final num entryFee;
  final String currency;

  const Tournament({
    required this.id,
    required this.name,
    this.description,
    this.rules,
    this.imageUrl,
    this.venue,
    required this.startDate,
    required this.endDate,
    this.registrationOpensAt,
    this.registrationClosesAt,
    this.completedAt,
    required this.status,
    this.competitionType = CompetitionType.social,
    this.format,
    this.certificationStatus,
    this.isRankingEligible = false,
    this.registrationOpen = false,
    this.liveMatchesCount = 0,
    this.categories = const [],
    this.isPaid = false,
    this.entryFee = 0,
    this.currency = 'JOD',
  });

  bool get isRanked => competitionType == CompetitionType.ranked;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        rules,
        imageUrl,
        venue,
        startDate,
        endDate,
        registrationOpensAt,
        registrationClosesAt,
        completedAt,
        status,
        competitionType,
        format,
        certificationStatus,
        isRankingEligible,
        registrationOpen,
        liveMatchesCount,
        categories,
        isPaid,
        entryFee,
        currency,
      ];
}
