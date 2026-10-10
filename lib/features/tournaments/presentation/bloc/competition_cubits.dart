import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../../core/state/base_cubits.dart';
import '../../../../core/state/view_state.dart';
import '../../../premium/domain/entities/premium.dart';
import '../../domain/entities/category_detail.dart';
import '../../domain/entities/match.dart';
import '../../domain/entities/registration.dart';
import '../../domain/usecases/competition_usecases.dart';

class CategoryDetailCubit extends ViewCubit<CategoryDetail> {
  final GetCategoryDetailUseCase getDetail;
  final int tournamentId;
  final int categoryId;

  CategoryDetailCubit(this.getDetail, {required this.tournamentId, required this.categoryId});

  @override
  ApiResult<CategoryDetail> fetch() => getDetail(tournamentId, categoryId);

  @override
  bool isEmpty(CategoryDetail data) => false;
}

/// Schedule with an optional category filter.
class TournamentMatchesCubit extends ViewCubit<List<Match>> {
  final GetTournamentMatchesUseCase getMatches;
  final int tournamentId;
  int? categoryId;

  TournamentMatchesCubit(this.getMatches, this.tournamentId);

  @override
  ApiResult<List<Match>> fetch() => getMatches(tournamentId, categoryId: categoryId);

  Future<void> filterCategory(int? id) {
    categoryId = id;
    return load();
  }
}

/// Verified results only.
class TournamentResultsCubit extends ViewCubit<List<Match>> {
  final GetTournamentResultsUseCase getResults;
  final int tournamentId;

  TournamentResultsCubit(this.getResults, this.tournamentId);

  @override
  ApiResult<List<Match>> fetch() => getResults(tournamentId);
}

/// Global "live now" list (`GET matches/live`), refreshed on the poll
/// interval while the tab is open.
class LiveMatchesCubit extends ViewCubit<List<Match>> {
  final GetAllLiveMatchesUseCase getLive;
  final Duration interval;
  Timer? _timer;

  LiveMatchesCubit(this.getLive, {this.interval = const Duration(seconds: 10)});

  @override
  ApiResult<List<Match>> fetch() => getLive();

  void start() {
    load();
    _timer?.cancel();
    _timer = Timer.periodic(interval, (_) => refresh());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

class MyRegistrationsCubit extends PagedCubit<Registration> {
  final GetMyRegistrationsUseCase getRegistrations;

  MyRegistrationsCubit(this.getRegistrations);

  @override
  ApiResult<Paginated<Registration>> fetchPage(int page) => getRegistrations(page: page);
}

/// Eligibility check + register / cancel / change partner / pay.
class RegistrationCubit extends Cubit<RegistrationFlowState> {
  final CheckEligibilityUseCase checkEligibility;
  final RegisterForCategoryUseCase register;
  final CancelRegistrationUseCase cancelRegistration;
  final ChangeRegistrationPartnerUseCase changePartner;
  final PayRegistrationUseCase pay;
  final RespondAsPartnerUseCase? respondAsPartner;
  final RenameTeamUseCase? renameTeam;

  RegistrationCubit({
    required this.checkEligibility,
    required this.register,
    required this.cancelRegistration,
    required this.changePartner,
    required this.pay,
    this.respondAsPartner,
    this.renameTeam,
  }) : super(const RegistrationFlowState());

  Future<void> check(int tournamentId, int categoryId, {String? partnerPlayerId}) async {
    emit(state.copyWith(eligibility: const ViewState.loading(), action: const ActionState.idle()));
    final result = await checkEligibility(tournamentId, categoryId, partnerPlayerId: partnerPlayerId);
    if (isClosed) return;
    result.match(
      (failure) => emit(state.copyWith(eligibility: ViewState.error(failure))),
      (e) => emit(state.copyWith(eligibility: ViewState.loaded(e))),
    );
  }

  Future<Registration?> submit(int tournamentId, int categoryId, {String? partnerPlayerId, String? notes, String? teamName, String? paymentMethod}) =>
      _run(() => register(tournamentId, categoryId, partnerPlayerId: partnerPlayerId, notes: notes, teamName: teamName, paymentMethod: paymentMethod));

  Future<bool> changeTeamName(int registrationId, String teamName) async {
    final rename = renameTeam;
    if (rename == null) return false;
    await _run<Registration?>(() => rename(registrationId, teamName));
    return state.action is ActionSuccess;
  }

  /// True when the backend accepted the cancellation.
  Future<bool> cancel(int registrationId) async {
    await _run<Registration?>(() => cancelRegistration(registrationId));
    return state.action is ActionSuccess;
  }

  /// The invited partner confirms (or declines) playing together.
  Future<bool> answerAsPartner(int registrationId, {required bool accept}) async {
    final respond = respondAsPartner;
    if (respond == null) return false;
    await _run<Registration?>(() => respond(registrationId, accept: accept));
    return state.action is ActionSuccess;
  }

  Future<bool> updatePartner(int registrationId, String partnerPlayerId) async {
    await _run<Registration?>(() => changePartner(registrationId, partnerPlayerId));
    return state.action is ActionSuccess;
  }

  /// Payment to complete in the browser, or null on failure (including the
  /// 503 "provider not configured", surfaced as a coming-soon message).
  Future<Payment?> startPayment(int registrationId) async {
    emit(state.copyWith(action: const ActionState.inProgress()));
    final result = await pay(registrationId);
    if (isClosed) return null;
    return result.match(
      (failure) {
        emit(state.copyWith(action: ActionState.failure(failure)));
        return null;
      },
      (payment) {
        emit(state.copyWith(action: ActionState.success(payment)));
        return payment;
      },
    );
  }

  Future<R?> _run<R>(ApiResult<R> Function() call) async {
    emit(state.copyWith(action: const ActionState.inProgress()));
    final result = await call();
    if (isClosed) return null;
    return result.match(
      (failure) {
        emit(state.copyWith(action: ActionState.failure(failure)));
        return null;
      },
      (value) {
        emit(state.copyWith(action: ActionState.success(value)));
        return value;
      },
    );
  }
}

class RegistrationFlowState {
  final ViewState<Eligibility> eligibility;
  final ActionState action;

  const RegistrationFlowState({
    this.eligibility = const ViewState.initial(),
    this.action = const ActionState.idle(),
  });

  RegistrationFlowState copyWith({ViewState<Eligibility>? eligibility, ActionState? action}) =>
      RegistrationFlowState(eligibility: eligibility ?? this.eligibility, action: action ?? this.action);
}
