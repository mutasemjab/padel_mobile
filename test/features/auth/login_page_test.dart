import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mocktail/mocktail.dart';
import 'package:padel/core/error/failure.dart';
import 'package:padel/core/theme/app_theme.dart';
import 'package:padel/core/utils/jo_phone_formatter.dart';
import 'package:padel/features/auth/data/models/auth_session_model.dart';
import 'package:padel/features/auth/data/models/otp_challenge_model.dart';
import 'package:padel/features/auth/domain/entities/auth_session.dart';
import 'package:padel/features/auth/domain/entities/otp_challenge.dart';
import 'package:padel/features/auth/domain/entities/social_credential.dart';
import 'package:padel/features/auth/domain/repositories/auth_repository.dart';
import 'package:padel/features/auth/domain/usecases/get_current_player_usecase.dart';
import 'package:padel/features/auth/domain/usecases/logout_usecase.dart';
import 'package:padel/features/auth/domain/usecases/sign_in_usecases.dart';
import 'package:padel/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:padel/features/auth/presentation/bloc/auth_event.dart';
import 'package:padel/features/auth/presentation/bloc/auth_state.dart';
import 'package:padel/features/auth/presentation/pages/login_page.dart';
import 'package:padel/l10n/gen/app_localizations.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

const _challenge = OtpChallenge(sessionId: 's1', resendAvailableIn: 30);

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  group('JoPhoneFormatter', () {
    TextEditingValue fmt(String input) =>
        JoPhoneFormatter().formatEditUpdate(TextEditingValue.empty, TextEditingValue(text: input));

    test('groups as 7X XXX XXXX, drops a leading 0 and caps at 9 digits', () {
      expect(fmt('0791234567').text, '79 123 4567');
      expect(fmt('79123456789').text, '79 123 4567');
      expect(fmt('791').text, '79 1');
      expect(fmt('7a9-1').text, '79 1');
    });

    test('accepts a pasted international number', () {
      expect(fmt('+962 79 123 4567').text, '79 123 4567');
    });

    test('validates ^7[789]\\d{7}\$ and builds E.164', () {
      expect(JoPhoneFormatter.isValid('791234567'), isTrue);
      expect(JoPhoneFormatter.isValid('771234567'), isTrue);
      expect(JoPhoneFormatter.isValid('761234567'), isFalse);
      expect(JoPhoneFormatter.isValid('79123456'), isFalse);
      expect(JoPhoneFormatter.e164('791234567'), '+962791234567');
    });
  });

  group('OTP contract parsing', () {
    test('otp/send payload', () {
      final c = OtpChallengeModel.fromJson({
        'session_id': 'abc',
        'masked_phone': '+962 79 *** 4567',
        'expires_in': 300,
        'resend_available_in': 30,
        'code_length': 6,
      }).toEntity();
      expect(c.sessionId, 'abc');
      expect(c.resendAvailableIn, 30);
    });

    test('otp/verify flags; defaults when absent', () {
      final verified = AuthSessionModel.fromJson({
        'token': 't',
        'account_type': 'player',
        'is_new_user': true,
        'profile_completed': false,
      }).toEntity();
      expect(verified.isNewUser, isTrue);
      expect(verified.profileCompleted, isFalse);

      final restored = AuthSessionModel.fromJson({'token': 't'}).toEntity();
      expect(restored.isNewUser, isFalse);
      expect(restored.profileCompleted, isTrue);
    });
  });

  group('LoginPage', () {
    late _MockAuthRepository repo;
    late AuthBloc bloc;

    setUp(() {
      repo = _MockAuthRepository();
      bloc = AuthBloc(
        logoutUseCase: LogoutUseCase(repo),
        getCurrentPlayerUseCase: GetCurrentPlayerUseCase(repo),
        authRepository: repo,
      );
    });

    tearDown(() => bloc.close());

    Future<AppLocalizations> pump(WidgetTester tester, String locale) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);
      final router = GoRouter(
        initialLocation: '/login',
        routes: [
          GoRoute(
            path: '/login',
            builder: (_, _) => LoginPage(
              sendOtp: SendOtpUseCase(repo),
              resendOtp: ResendOtpUseCase(repo),
              verifyOtp: VerifyOtpUseCase(repo),
              socialSignIn: SocialSignInUseCase(repo),
            ),
          ),
        ],
      );
      await tester.pumpWidget(
        BlocProvider.value(
          value: bloc,
          child: MaterialApp.router(
            routerConfig: router,
            theme: AppTheme.dark(languageCode: locale),
            locale: Locale(locale),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(disableAnimations: true),
              child: child!,
            ),
          ),
        ),
      );
      // Entrance delays run on timers; the next timed frame lets them finish.
      await tester.pump(const Duration(seconds: 2));
      await tester.pump(const Duration(milliseconds: 100));
      return AppLocalizations.delegate.load(Locale(locale));
    }

    Future<void> tap(WidgetTester tester, Finder finder) async {
      await tester.ensureVisible(finder);
      await tester.pump();
      await tester.tap(finder);
    }

    Future<void> dispose(WidgetTester tester) async {
      await tester.pumpWidget(const SizedBox());
      await tester.pump(const Duration(seconds: 1));
    }

    for (final locale in ['ar', 'en']) {
      testWidgets('phone → code → welcome → signed in ($locale)', (tester) async {
        when(() => repo.sendOtp(phone: any(named: 'phone'))).thenAnswer((_) async => const Right(_challenge));
        when(
          () => repo.verifyOtp(sessionId: 's1', phone: '+962791234567', code: '123456'),
        ).thenAnswer((_) async => const Right(AuthSession(token: 't', accountType: AccountType.coach)));
        final l10n = await pump(tester, locale);
        expect(tester.takeException(), isNull);

        // Wrong prefix → inline error, nothing sent.
        await tester.enterText(find.byType(TextField).first, '761234567');
        await tester.pump();
        expect(find.text(l10n.pmPhoneInvalid), findsOneWidget);
        await tap(tester, find.text(l10n.pmContinue));
        await tester.pump();
        verifyNever(() => repo.sendOtp(phone: any(named: 'phone')));

        await tester.enterText(find.byType(TextField).first, '0791234567');
        await tester.pump();
        expect(find.text('79 123 4567'), findsOneWidget);
        await tap(tester, find.text(l10n.pmContinue));
        await tester.pump(const Duration(milliseconds: 500));
        verify(() => repo.sendOtp(phone: '+962791234567')).called(1);
        expect(find.text('+962 79 123 4567'), findsOneWidget);
        expect(find.text('0:30'), findsOneWidget);

        // 6th digit auto-verifies; after the welcome view the bloc signs in.
        await tester.enterText(find.byType(TextField).last, '123456');
        await tester.pump(const Duration(seconds: 1));
        await tester.pump(const Duration(seconds: 1));
        expect(find.text(l10n.pmWelcomeTitle), findsOneWidget);
        await tester.pump(const Duration(seconds: 4));
        await tester.pump();
        expect(bloc.state, isA<AuthAuthenticated>());
        expect(tester.takeException(), isNull);
        await dispose(tester);
      });
    }

    testWidgets('a rejected code shows the server message and clears the boxes', (tester) async {
      when(() => repo.sendOtp(phone: any(named: 'phone'))).thenAnswer((_) async => const Right(_challenge));
      when(
        () => repo.verifyOtp(
          sessionId: any(named: 'sessionId'),
          phone: any(named: 'phone'),
          code: any(named: 'code'),
        ),
      ).thenAnswer((_) async => const Left(ValidationFailure('Wrong code, 4 attempts left', {}, 'OTP_INVALID')));
      final l10n = await pump(tester, 'en');
      await tester.enterText(find.byType(TextField).first, '791234567');
      await tester.pump();
      await tap(tester, find.text(l10n.pmContinue));
      await tester.pump(const Duration(milliseconds: 500));
      await tester.enterText(find.byType(TextField).last, '000000');
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text('Wrong code, 4 attempts left'), findsOneWidget);
      await tester.pump(const Duration(seconds: 1));
      expect(find.text('0'), findsNothing);
      expect(bloc.state, isNot(isA<AuthAuthenticated>()));
      await dispose(tester);
    });

    testWidgets('a failed send stays on the phone step with a localized error', (tester) async {
      when(() => repo.sendOtp(phone: any(named: 'phone'))).thenAnswer(
        (_) async => const Left(ProviderUnavailableFailure('down', ApiErrorCodes.otpProviderUnavailable)),
      );
      final l10n = await pump(tester, 'en');
      await tester.enterText(find.byType(TextField).first, '781234567');
      await tester.pump();
      await tap(tester, find.text(l10n.pmContinue));
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.text(l10n.failureOtpProviderUnavailable), findsOneWidget);
      expect(find.text(l10n.pmPhoneHint), findsNothing);
      await dispose(tester);
    });

    testWidgets('Google sign-in plays the welcome view and signs in', (tester) async {
      when(() => repo.socialSignIn(SocialProvider.google)).thenAnswer(
        (_) async => const Right(AuthSession(token: 't', accountType: AccountType.player)),
      );
      final l10n = await pump(tester, 'en');
      await tap(tester, find.text('Google'));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 100));
      expect(find.text(l10n.pmWelcomeTitle), findsOneWidget);
      await tester.pump(const Duration(seconds: 4));
      await tester.pump();
      expect(bloc.state, isA<AuthAuthenticated>());
      await dispose(tester);
    });

    testWidgets('closing the Apple sheet leaves the page as it was', (tester) async {
      when(() => repo.socialSignIn(SocialProvider.apple)).thenAnswer((_) async => const Right(null));
      final l10n = await pump(tester, 'en');
      await tap(tester, find.text('Apple'));
      await tester.pump(const Duration(seconds: 1));
      expect(find.text(l10n.pmPhoneHint), findsOneWidget);
      expect(bloc.state, isNot(isA<AuthAuthenticated>()));
      await dispose(tester);
    });

    testWidgets('the phone input draws no border of its own when focused', (tester) async {
      await pump(tester, 'en');
      await tester.tap(find.byType(TextField).first, warnIfMissed: false);
      await tester.pump();
      final decorator = tester.widget<InputDecorator>(
        find.descendant(of: find.byType(TextField).first, matching: find.byType(InputDecorator)),
      );
      expect(decorator.decoration.focusedBorder, InputBorder.none);
      expect(decorator.decoration.filled, isFalse);
      await dispose(tester);
    });
  });

  test('sessionEstablished switches AuthBloc to the verified session', () async {
    final repo = _MockAuthRepository();
    final bloc = AuthBloc(
      logoutUseCase: LogoutUseCase(repo),
      getCurrentPlayerUseCase: GetCurrentPlayerUseCase(repo),
      authRepository: repo,
    );
    bloc.add(const AuthEvent.sessionEstablished(AuthSession(token: 't', accountType: AccountType.coach)));
    final state = await bloc.stream.first;
    expect(state, isA<AuthAuthenticated>());
    expect((state as AuthAuthenticated).accountType, AccountType.coach);
    await bloc.close();
  });
}
