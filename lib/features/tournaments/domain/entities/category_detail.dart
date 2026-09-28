import 'package:equatable/equatable.dart';

import 'match.dart';
import 'tournament.dart';

class StandingRow extends Equatable {
  final int position;
  final MatchTeam team;
  final int played;
  final int wins;
  final int losses;
  final int points;
  final int setsWon;
  final int setsLost;
  final int setDifference;
  final int gamesWon;
  final int gamesLost;
  final int gameDifference;

  const StandingRow({
    required this.position,
    required this.team,
    required this.played,
    required this.wins,
    required this.losses,
    required this.points,
    required this.setsWon,
    required this.setsLost,
    required this.setDifference,
    required this.gamesWon,
    required this.gamesLost,
    required this.gameDifference,
  });

  @override
  List<Object?> get props => [
        position,
        team,
        played,
        wins,
        losses,
        points,
        setsWon,
        setsLost,
        setDifference,
        gamesWon,
        gamesLost,
        gameDifference,
      ];
}

class CategoryGroup extends Equatable {
  final int id;
  final String name;
  final bool finished;
  final List<StandingRow> standings;
  final List<Match> matches;

  const CategoryGroup({
    required this.id,
    required this.name,
    required this.finished,
    required this.standings,
    required this.matches,
  });

  @override
  List<Object?> get props => [id, name, finished, standings, matches];
}

class BracketRound extends Equatable {
  final String round;
  final String roundLabel;
  final List<Match> matches;

  const BracketRound({required this.round, required this.roundLabel, required this.matches});

  @override
  List<Object?> get props => [round, roundLabel, matches];
}

/// `GET tournaments/{id}/categories/{catId}`. Bracket rounds come ordered
/// R32 → Final.
class CategoryDetail extends Equatable {
  final TournamentCategory category;
  final List<MatchTeam> teams;
  final List<CategoryGroup> groups;
  final List<BracketRound> bracket;

  const CategoryDetail({
    required this.category,
    required this.teams,
    required this.groups,
    required this.bracket,
  });

  @override
  List<Object?> get props => [category, teams, groups, bracket];
}

/// `GET …/categories/{c}/eligibility`.
class Eligibility extends Equatable {
  final bool registrationOpen;
  final bool isFull;
  final List<String> playerIssues;
  final List<String>? partnerIssues;
  final bool requiresPayment;
  final num registrationFee;

  const Eligibility({
    required this.registrationOpen,
    required this.isFull,
    required this.playerIssues,
    this.partnerIssues,
    required this.requiresPayment,
    required this.registrationFee,
  });

  bool get canRegister =>
      registrationOpen && playerIssues.isEmpty && (partnerIssues?.isEmpty ?? true);

  @override
  List<Object?> get props =>
      [registrationOpen, isFull, playerIssues, partnerIssues, requiresPayment, registrationFee];
}
