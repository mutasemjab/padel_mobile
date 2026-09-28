import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padel/core/models/player_summary.dart';
import 'package:padel/core/theme/app_tokens.dart';
import 'package:padel/core/widgets/badges.dart';
import 'package:padel/core/widgets/metric_widgets.dart';
import 'package:padel/core/widgets/movement_indicator.dart';
import 'package:padel/core/widgets/player_card.dart';
import 'package:padel/core/widgets/state_views.dart';
import 'package:padel/core/error/failure.dart';
import 'package:padel/features/tournaments/domain/entities/match.dart';
import 'package:padel/l10n/gen/app_localizations.dart';

const _team = MatchTeam(
  id: 1,
  label: 'عمر حداد / علي ناصر',
  players: [PlayerSummary(playerId: 'PDL-1', name: 'عمر حداد', level: 'B+')],
);

Widget _host(Widget child, {String locale = 'ar'}) => MaterialApp(
      locale: Locale(locale),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: ThemeData(extensions: const [AppTokens.dark]),
      home: Scaffold(
        body: MediaQuery(
          data: const MediaQueryData(size: Size(360, 780), disableAnimations: true),
          child: SingleChildScrollView(child: Padding(padding: const EdgeInsets.all(16), child: child)),
        ),
      ),
    );

void main() {
  setUpAll(() => GoogleFonts.config.allowRuntimeFetching = false);

  for (final locale in ['ar', 'en']) {
    testWidgets('core widgets render in $locale without overflow', (tester) async {
      await tester.pumpWidget(_host(
        Column(
          children: [
            const CompetitionBadge(competitionType: 'ranked', large: true),
            const CompetitionBadge(competitionType: 'social'),
            const Row(
              children: [
                Expanded(child: MetricTile(kind: MetricKind.skill, value: 1016, level: 'B+', movement: 2, compact: true)),
                Expanded(child: MetricTile(kind: MetricKind.season, value: 70, compact: true)),
                Expanded(child: MetricTile(kind: MetricKind.xp, value: 340, compact: true)),
              ],
            ),
            const MovementIndicator(movement: null),
            const MovementIndicator(movement: -3),
            const PlayerCard(player: PlayerSummary(playerId: 'PDL-1', name: 'عمر حداد', level: 'B', skillRating: 1016, country: 'JO')),
            const ErrorState(failure: NetworkFailure(), compact: true),
            const PremiumRequiredState(compact: true),
            Text(_team.label),
          ],
        ),
        locale: locale,
      ));
      await tester.pump(const Duration(seconds: 2));
      expect(tester.takeException(), isNull);
      // Season points without a position shows "Unranked", never "#0".
      expect(find.textContaining('#0'), findsNothing);
    });
  }
}
