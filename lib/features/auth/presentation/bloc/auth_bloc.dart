import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/force_logout_notifier.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/get_current_player_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// App-root session Bloc: drives which shell (login / player app / coach
/// portal) is shown. Sign-in itself happens on the phone + OTP login page,
/// which hands the verified session over via [AuthSessionEstablished]. Also listens for
/// the global force-logout stream so a 401 anywhere routes back to login.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LogoutUseCase logoutUseCase;
  final GetCurrentPlayerUseCase getCurrentPlayerUseCase;
  final AuthRepository authRepository;

  StreamSubscription<void>? _forceLogoutSubscription;

  AuthBloc({required this.logoutUseCase, required this.getCurrentPlayerUseCase, required this.authRepository})
    : super(const AuthState.unknown()) {
    on<AuthAppStarted>(_onAppStarted);
    on<AuthSessionEstablished>((event, emit) => emit(_fromSession(event.session)));
    on<AuthLogoutRequested>(_onLogoutRequested);
    on<AuthForceLogoutTriggered>(_onForceLogoutTriggered);
    on<AuthPlayerUpdated>(_onPlayerUpdated);
    on<AuthRefreshRequested>(_onRefreshRequested);

    _forceLogoutSubscription = ForceLogoutNotifier.instance.onForceLogout.listen(
      (_) => add(const AuthEvent.forceLogoutTriggered()),
    );
  }

  AuthState _fromSession(AuthSession session) =>
      AuthState.authenticated(player: session.player, accountType: session.accountType, coach: session.coach);

  Future<void> _onAppStarted(AuthAppStarted event, Emitter<AuthState> emit) async {
    final hasSession = await authRepository.hasStoredSession();
    if (!hasSession) {
      emit(const AuthState.unauthenticated());
      return;
    }

    final result = await authRepository.restoreSession();
    result.match((failure) => emit(const AuthState.unauthenticated()), (session) => emit(_fromSession(session)));
  }

  Future<void> _onLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) async {
    await logoutUseCase();
    emit(const AuthState.unauthenticated());
  }

  Future<void> _onForceLogoutTriggered(AuthForceLogoutTriggered event, Emitter<AuthState> emit) async {
    if (state is AuthUnauthenticated) return;
    await logoutUseCase();
    emit(const AuthState.unauthenticated());
  }

  void _onPlayerUpdated(AuthPlayerUpdated event, Emitter<AuthState> emit) {
    final current = state;
    if (current is AuthAuthenticated) emit(current.copyWith(player: event.player));
  }

  Future<void> _onRefreshRequested(AuthRefreshRequested event, Emitter<AuthState> emit) async {
    final current = state;
    if (current is! AuthAuthenticated || !current.accountType.hasPlayerProfile) return;
    final result = await getCurrentPlayerUseCase();
    result.match((_) => null, (player) => emit(current.copyWith(player: player)));
  }

  @override
  Future<void> close() {
    _forceLogoutSubscription?.cancel();
    return super.close();
  }
}
