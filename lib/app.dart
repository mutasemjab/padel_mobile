import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'core/di/injection.dart';
import 'core/localization/locale_controller.dart';
import 'core/meta/enums_service.dart';
import 'core/push/push_notification_service.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'features/auth/domain/entities/auth_session.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/bloc/auth_event.dart';
import 'features/auth/presentation/bloc/auth_state.dart';
import 'features/notifications/domain/entities/notification_item.dart';
import 'features/notifications/presentation/bloc/unread_count_cubit.dart';
import 'features/notifications/presentation/notification_router.dart';
import 'features/notifications/presentation/widgets/achievement_celebration_overlay.dart';
import 'l10n/gen/app_localizations.dart';

class PadelApp extends StatefulWidget {
  const PadelApp({super.key});

  @override
  State<PadelApp> createState() => _PadelAppState();
}

class _PadelAppState extends State<PadelApp> with WidgetsBindingObserver {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late final AuthBloc _authBloc;
  late final GoRouter _router;
  late final UnreadCountCubit _unread = sl<UnreadCountCubit>();
  final _push = sl<PushNotificationService>();
  final List<StreamSubscription<dynamic>> _subs = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _authBloc = sl<AuthBloc>()..add(const AuthEvent.appStarted());
    _router = buildAppRouter(_authBloc, navigatorKey: _navigatorKey);
    _subs
      ..add(_push.onTap.listen(_openFromPush))
      ..add(_push.onForegroundMessage.listen(_onForegroundPush));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && _authBloc.state is AuthAuthenticated) _unread.refresh();
  }

  void _onAuthChanged(BuildContext context, AuthState state) {
    if (state is AuthAuthenticated) {
      _push.onSignedIn();
      _unread.refresh();
      final launch = _push.takeLaunchData();
      if (launch != null) _openFromPush(launch);
    } else if (state is AuthUnauthenticated) {
      _push.onSignedOut();
      _unread.clear();
    }
  }

  void _openFromPush(Map<String, dynamic> data) {
    final auth = _authBloc.state;
    if (auth is! AuthAuthenticated) return;
    final item = NotificationRouter.fromPush(data);
    final route = NotificationRouter.routeFor(
      item,
      coachAccount: auth.accountType == AccountType.coach,
      myPlayerId: auth.player?.playerId,
    );
    if (route == null) return;
    NotificationRouter.isInsideTabs(route) ? _router.go(route) : _router.push(route);
  }

  void _onForegroundPush(Map<String, dynamic> data) {
    _unread.increment();
    final item = NotificationRouter.fromPush(data);
    final context = _navigatorKey.currentContext;
    if (item.type == NotificationType.achievementUnlocked && context != null) {
      final lang = LocaleController.instance.languageCode.value;
      showAchievementCelebration(context, achievementMessage: item.title(lang) ?? item.message(lang) ?? '');
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    for (final s in _subs) {
      s.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _authBloc),
        BlocProvider.value(value: _unread),
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listenWhen: (a, b) => a.runtimeType != b.runtimeType,
        listener: _onAuthChanged,
        child: ValueListenableBuilder<String>(
          valueListenable: LocaleController.instance.languageCode,
          builder: (context, languageCode, _) => ValueListenableBuilder<ThemeMode>(
            valueListenable: ThemeController.instance.themeMode,
            builder: (context, themeMode, _) => ListenableBuilder(
              // Rebuild once enum labels arrive / change language.
              listenable: sl<EnumsService>(),
              builder: (context, _) => MaterialApp.router(
                title: 'Padel Platform',
                debugShowCheckedModeBanner: false,
                theme: AppTheme.light(languageCode: languageCode),
                darkTheme: AppTheme.dark(languageCode: languageCode),
                themeMode: themeMode,
                locale: Locale(languageCode),
                supportedLocales: const [Locale('ar'), Locale('en')],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  CountryLocalizations.delegate,
                ],
                routerConfig: _router,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
