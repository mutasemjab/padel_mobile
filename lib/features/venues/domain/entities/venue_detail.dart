import 'package:equatable/equatable.dart';

import '../../../tournaments/domain/entities/tournament.dart';
import '../../../tournaments/domain/entities/venue.dart';

/// `GET venues/{id}` — the venue plus its upcoming tournaments.
class VenueDetail extends Equatable {
  final Venue venue;
  final List<Tournament> upcomingTournaments;

  const VenueDetail({required this.venue, required this.upcomingTournaments});

  @override
  List<Object?> get props => [venue, upcomingTournaments];
}
