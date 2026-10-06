import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../../core/state/base_cubits.dart';
import '../../../tournaments/domain/entities/venue.dart';
import '../../../venues/domain/usecases/venues_usecases.dart';
import '../../domain/entities/casual_match.dart';
import '../../domain/usecases/casual_actions_usecases.dart';
import '../../domain/usecases/join_casual_match_usecase.dart';

class CasualMatchDetailCubit extends ViewCubit<CasualMatch> {
  final GetCasualMatchUseCase getMatch;
  final int id;

  CasualMatchDetailCubit(this.getMatch, this.id);

  @override
  ApiResult<CasualMatch> fetch() => getMatch(id);

  @override
  bool isEmpty(CasualMatch data) => false;
}

/// Join / leave / cancel / accept-decline participants for one game.
class CasualActionCubit extends ActionCubit {
  final JoinCasualMatchUseCase join;
  final LeaveCasualMatchUseCase leave;
  final CancelCasualMatchUseCase cancel;
  final RespondToParticipantUseCase respond;
  final UpdateCasualMatchUseCase update;
  final InviteToCasualMatchUseCase invite;
  final RespondToInvitationUseCase respondInvitation;

  CasualActionCubit({
    required this.join,
    required this.leave,
    required this.cancel,
    required this.respond,
    required this.update,
    required this.invite,
    required this.respondInvitation,
  });

  Future<bool> updateMatch(int id, Map<String, dynamic> fields) => run(() => update(id, fields));

  Future<bool> invitePlayer(int id, String playerId) => run(() => invite(id, playerId));

  Future<bool> answerInvitation(int id, {required bool accept}) => run(() => respondInvitation(id, accept: accept));

  Future<bool> joinMatch(int id) => run(() => join(id));

  Future<bool> leaveMatch(int id) => run(() => leave(id));

  Future<bool> cancelMatch(int id) => run(() => cancel(id));

  Future<bool> respondTo(int id, int participantId, {required bool accept}) =>
      run(() => respond(id, participantId, accept: accept));
}

class MyCasualMatchesCubit extends PagedCubit<CasualMatch> {
  final GetMyCasualMatchesUseCase getMine;
  final bool created;

  MyCasualMatchesCubit(this.getMine, {required this.created});

  @override
  ApiResult<Paginated<CasualMatch>> fetchPage(int page) => getMine(created: created, page: page);
}

/// Venues (with courts) for pickers and the venues list.
class VenuesCubit extends PagedCubit<Venue> {
  final GetVenuesUseCase getVenues;
  String? city;
  String query = '';

  VenuesCubit(this.getVenues);

  @override
  ApiResult<Paginated<Venue>> fetchPage(int page) => getVenues(city: city, q: query, page: page);

  Future<void> search(String q) {
    query = q;
    return load();
  }
}
