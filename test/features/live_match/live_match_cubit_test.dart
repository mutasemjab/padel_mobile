import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:padel/core/realtime/realtime_client.dart';
import 'package:padel/features/live_match/presentation/bloc/live_match_cubit.dart';
import 'package:padel/features/live_match/presentation/bloc/live_match_state.dart';
import 'package:padel/features/tournaments/domain/entities/live_payload.dart';
import 'package:padel/features/tournaments/domain/entities/match.dart';
import 'package:padel/features/tournaments/domain/repositories/live_scores_repository.dart';
import 'package:padel/features/tournaments/domain/usecases/competition_usecases.dart';
import 'package:padel/features/tournaments/domain/usecases/get_match_usecase.dart';

class _MockGetMatch extends Mock implements GetMatchUseCase {}

class _MockGetMatchById extends Mock implements GetMatchByIdUseCase {}

class _MockGetPoints extends Mock implements GetMatchPointsUseCase {}

class _FakeLiveScores implements LiveScoresRepository {
  final controller = StreamController<LivePayload>.broadcast();
  final ValueNotifier<RealtimeTransport> _transport = ValueNotifier(RealtimeTransport.realtime);

  @override
  ValueListenable<RealtimeTransport> get transport => _transport;

  @override
  Duration get pollInterval => const Duration(seconds: 5);

  @override
  Stream<LivePayload> watchMatch(int matchId) => controller.stream;

  @override
  void stopMatch(int matchId) {}

  @override
  Stream<TournamentLiveEvent> watchTournament(int tournamentId) => const Stream.empty();

  @override
  void stopTournament(int tournamentId) {}
}

const _teamOne = MatchTeam(id: 1, label: 'A');
const _teamTwo = MatchTeam(id: 3, label: 'B');

Match _match({int version = 1, String p1 = '0'}) => Match(
      id: 2,
      tournamentId: 1,
      status: MatchStatus.inProgress,
      teamOne: _teamOne,
      teamTwo: _teamTwo,
      version: version,
      currentGameDisplay: PointDisplay(teamOne: p1, teamTwo: '0'),
    );

LivePayload _payload(int version, {LiveEventType event = LiveEventType.point, String p1 = '15'}) => LivePayload(
      event: event,
      matchId: 2,
      status: MatchStatus.inProgress,
      version: version,
      currentGameDisplay: PointDisplay(teamOne: p1, teamTwo: '0'),
    );

void main() {
  late _MockGetMatch getMatch;
  late _MockGetMatchById getMatchById;
  late _MockGetPoints getPoints;
  late _FakeLiveScores live;
  late LiveMatchCubit cubit;

  setUp(() async {
    getMatch = _MockGetMatch();
    getMatchById = _MockGetMatchById();
    getPoints = _MockGetPoints();
    live = _FakeLiveScores();
    when(() => getMatch(1, 2)).thenAnswer((_) async => Right(_match()));
    when(() => getPoints(2)).thenAnswer((_) async => const Right([]));
    cubit = LiveMatchCubit(
      getMatch: getMatch,
      getMatchById: getMatchById,
      getPoints: getPoints,
      liveScores: live,
      matchId: 2,
      tournamentId: 1,
    );
    await cubit.start();
  });

  tearDown(() => cubit.close());

  LiveMatchLoaded loaded() => cubit.state as LiveMatchLoaded;

  test('loads the match and reports the transport', () {
    expect(loaded().match.version, 1);
    expect(loaded().transport, RealtimeTransport.realtime);
  });

  test('applies the next version in place without refetching', () async {
    await cubit.onPayload(_payload(2, p1: '15'));
    expect(loaded().match.version, 2);
    expect(loaded().match.currentGameDisplay?.teamOne, '15');
    expect(loaded().lastEvent, LiveEventType.point);
    verify(() => getMatch(1, 2)).called(1); // only the initial load
  });

  test('ignores duplicates (socket + poll overlap)', () async {
    await cubit.onPayload(_payload(2));
    final seq = loaded().eventSeq;
    await cubit.onPayload(_payload(2));
    expect(loaded().eventSeq, seq);
  });

  test('refetches once when the version jumps by more than one', () async {
    when(() => getMatch(1, 2)).thenAnswer((_) async => Right(_match(version: 5, p1: '30')));
    await cubit.onPayload(_payload(5));
    expect(loaded().match.version, 5);
    expect(loaded().match.currentGameDisplay?.teamOne, '30');
    verify(() => getMatch(1, 2)).called(2);
  });

  test('an undo may move the version backwards', () async {
    await cubit.onPayload(_payload(2, p1: '15'));
    await cubit.onPayload(_payload(1, event: LiveEventType.undo, p1: '0'));
    expect(loaded().match.version, 1);
    expect(loaded().lastEvent, LiveEventType.undo);
  });

  test('a backwards version without undo/correction triggers a refetch', () async {
    await cubit.onPayload(_payload(3, event: LiveEventType.point));
    // version 3 is a gap from 1 → refetch returns version 1 again
    clearInteractions(getMatch);
    when(() => getMatch(1, 2)).thenAnswer((_) async => Right(_match(version: 4)));
    await cubit.onPayload(_payload(0));
    verify(() => getMatch(1, 2)).called(1);
  });

  test('payloads for other matches are ignored', () async {
    await cubit.onPayload(const LivePayload(
      event: LiveEventType.point,
      matchId: 99,
      status: MatchStatus.inProgress,
      version: 2,
    ));
    expect(loaded().match.version, 1);
  });
}
