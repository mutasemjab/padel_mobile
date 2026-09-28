import 'package:equatable/equatable.dart';

import '../../../../core/models/player_summary.dart';
import '../../../../core/models/section_state.dart';

/// Head-to-head record with one partner. `winRate` is null when there is
/// nothing to compute it from — render "—", never 0%.
class PartnerRecord extends Equatable {
  final PlayerSummary partner;
  final int matchesPlayed;
  final int matchesWon;
  final double? winRate;

  const PartnerRecord({required this.partner, this.matchesPlayed = 0, this.matchesWon = 0, this.winRate});

  @override
  List<Object?> get props => [partner, matchesPlayed, matchesWon, winRate];
}

/// One partner card (Main / Best historical / Most played) with its explicit
/// state. [record] is null unless [state] is ok.
class PartnerSlot extends Equatable {
  final SectionState state;
  final PartnerRecord? record;

  /// Best historical only: verified matches together needed to qualify.
  final int? minMatchesRequired;

  const PartnerSlot({required this.state, this.record, this.minMatchesRequired});

  const PartnerSlot.empty() : this(state: SectionState.empty);

  @override
  List<Object?> get props => [state, record, minMatchesRequired];
}

class PartnersOverview extends Equatable {
  final PartnerSlot mainPartner;
  final PartnerSlot bestHistorical;
  final PartnerSlot mostPlayedWith;
  final List<PartnerRecord> history;

  const PartnersOverview({
    required this.mainPartner,
    required this.bestHistorical,
    required this.mostPlayedWith,
    this.history = const [],
  });

  @override
  List<Object?> get props => [mainPartner, bestHistorical, mostPlayedWith, history];
}

/// Why a candidate was recommended. Rendered as chips — never a made-up
/// "compatibility %".
enum RecommendationReason {
  complementarySide,
  similarSkillRating,
  previousPartnership,
  activeRecently,
  sameCountry,
  unknown;

  static RecommendationReason fromApi(String raw) => switch (raw) {
    'complementary_side' => complementarySide,
    'similar_skill_rating' => similarSkillRating,
    'previous_partnership' => previousPartnership,
    'active_recently' => activeRecently,
    'same_country' => sameCountry,
    _ => unknown,
  };
}

class CandidateFacts extends Equatable {
  final int? ratingDifference;
  final String? candidateSide;
  final int? candidateVerifiedMatches;
  final double? candidateWinRate;
  final int? matchesTogether;
  final int? winsTogether;
  final DateTime? candidateLastPlayedAt;

  const CandidateFacts({
    this.ratingDifference,
    this.candidateSide,
    this.candidateVerifiedMatches,
    this.candidateWinRate,
    this.matchesTogether,
    this.winsTogether,
    this.candidateLastPlayedAt,
  });

  @override
  List<Object?> get props => [
    ratingDifference,
    candidateSide,
    candidateVerifiedMatches,
    candidateWinRate,
    matchesTogether,
    winsTogether,
    candidateLastPlayedAt,
  ];
}

class PartnerCandidate extends Equatable {
  final PlayerSummary player;
  final List<RecommendationReason> reasons;
  final CandidateFacts facts;

  const PartnerCandidate({required this.player, required this.reasons, required this.facts});

  @override
  List<Object?> get props => [player, reasons, facts];
}

class RecommendationBasis extends Equatable {
  final int? playerRating;
  final int? ratingWindow;
  final int playerVerifiedMatches;

  const RecommendationBasis({this.playerRating, this.ratingWindow, this.playerVerifiedMatches = 0});

  @override
  List<Object?> get props => [playerRating, ratingWindow, playerVerifiedMatches];
}

class PartnerRecommendations extends Equatable {
  final SectionState state;
  final RecommendationBasis basis;
  final List<PartnerCandidate> candidates;

  const PartnerRecommendations({required this.state, required this.basis, required this.candidates});

  @override
  List<Object?> get props => [state, basis, candidates];
}

enum PartnerRequestStatus {
  pending,
  accepted,
  declined,
  cancelled;

  static PartnerRequestStatus fromApi(String? raw) =>
      PartnerRequestStatus.values.firstWhere((s) => s.name == raw, orElse: () => PartnerRequestStatus.pending);
}

class PartnerRequest extends Equatable {
  final int id;
  final PartnerRequestStatus status;
  final String? message;
  final PlayerSummary requester;
  final PlayerSummary target;
  final DateTime? createdAt;
  final DateTime? respondedAt;

  const PartnerRequest({
    required this.id,
    required this.status,
    this.message,
    required this.requester,
    required this.target,
    this.createdAt,
    this.respondedAt,
  });

  @override
  List<Object?> get props => [id, status, message, requester, target, createdAt, respondedAt];
}
