import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mocktail/mocktail.dart';
import 'package:padel/core/di/injection.dart';
import 'package:padel/core/state/view_state.dart';
import 'package:padel/core/theme/app_theme.dart';
import 'package:padel/features/partners/presentation/bloc/partners_cubits.dart';
import 'package:padel/features/players/domain/entities/player.dart';
import 'package:padel/features/players/domain/entities/player_profile.dart';
import 'package:padel/features/players/presentation/bloc/player_profile_cubit.dart';
import 'package:padel/features/players/presentation/bloc/player_profile_state.dart';
import 'package:padel/features/players/presentation/pages/player_profile_page.dart';
import 'package:padel/l10n/gen/app_localizations.dart';

class _MockPlayerProfileCubit extends Mock implements PlayerProfileCubit {}
class _MockPartnerActionCubit extends Mock implements PartnerActionCubit {}

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  late _MockPlayerProfileCubit mockProfileCubit;
  late _MockPartnerActionCubit mockPartnerActionCubit;

  const profile = PlayerProfile(
    player: Player(
      playerId: 'PDL-1',
      name: 'Omar Test',
      email: 'omar@example.com',
      isOwner: true,
    ),
    social: SocialSummary(followers: 12),
    achievements: AchievementsSummary(unlocked: 3, total: 10),
    recentResults: [],
  );

  setUp(() {
    mockProfileCubit = _MockPlayerProfileCubit();
    mockPartnerActionCubit = _MockPartnerActionCubit();

    when(() => mockProfileCubit.state).thenReturn(const PlayerProfileState.loaded(profile: profile));
    when(() => mockProfileCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockProfileCubit.load(any(), silent: any(named: 'silent'))).thenAnswer((_) async {});
    when(() => mockProfileCubit.close()).thenAnswer((_) async {});

    when(() => mockPartnerActionCubit.state).thenReturn(const ActionState.idle());
    when(() => mockPartnerActionCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockPartnerActionCubit.close()).thenAnswer((_) async {});

    if (sl.isRegistered<PlayerProfileCubit>()) {
      sl.unregister<PlayerProfileCubit>();
    }
    sl.registerFactory<PlayerProfileCubit>(() => mockProfileCubit);

    if (sl.isRegistered<PartnerActionCubit>()) {
      sl.unregister<PartnerActionCubit>();
    }
    sl.registerFactory<PartnerActionCubit>(() => mockPartnerActionCubit);
  });

  tearDown(() {
    if (sl.isRegistered<PlayerProfileCubit>()) {
      sl.unregister<PlayerProfileCubit>();
    }
    if (sl.isRegistered<PartnerActionCubit>()) {
      sl.unregister<PartnerActionCubit>();
    }
  });

  testWidgets('PlayerProfile content renders and scrolls in NestedScrollView without layoutExtent exception', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.dark(languageCode: 'en'),
        home: const Scaffold(
          body: PlayerProfilePage(playerId: 'PDL-1'),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify header and athlete name render
    expect(find.text('Omar Test'), findsWidgets);

    // Scroll down to test NestedScrollView sliver geometry under scroll
    await tester.drag(find.byType(NestedScrollView), const Offset(0, -300));
    await tester.pumpAndSettle();

    // Overscroll pull up and pull down (causes stretch/bounce physics test)
    await tester.drag(find.byType(NestedScrollView), const Offset(0, 500));
    await tester.pumpAndSettle();
  });
}
