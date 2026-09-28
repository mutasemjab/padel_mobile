import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:padel/core/error/failure.dart';
import 'package:padel/core/network/pagination_meta.dart';
import 'package:padel/core/state/view_state.dart';
import 'package:padel/features/notifications/domain/entities/notification_item.dart';
import 'package:padel/features/notifications/domain/usecases/get_notifications_usecase.dart';
import 'package:padel/features/notifications/domain/usecases/mark_notification_read_usecase.dart';
import 'package:padel/features/notifications/presentation/bloc/notifications_cubit.dart';
import 'package:padel/features/notifications/presentation/bloc/unread_count_cubit.dart';
import 'package:padel/features/players/domain/entities/player.dart';
import 'package:padel/features/players/domain/entities/player_profile.dart';
import 'package:padel/features/players/domain/usecases/player_insight_usecases.dart';
import 'package:padel/features/players/domain/usecases/social_actions_usecases.dart';
import 'package:padel/features/players/presentation/bloc/player_profile_cubit.dart';
import 'package:padel/features/players/presentation/bloc/player_profile_state.dart';
import 'package:padel/features/rankings/domain/entities/ranking_entry.dart';
import 'package:padel/features/rankings/domain/usecases/get_rankings_usecase.dart';
import 'package:padel/features/rankings/presentation/bloc/rankings_cubits.dart';

class _MockGetRankings extends Mock implements GetRankingsUseCase {}

class _MockGetNotifications extends Mock implements GetNotificationsUseCase {}

class _MockMarkRead extends Mock implements MarkNotificationReadUseCase {}

class _MockMarkAll extends Mock implements MarkAllNotificationsReadUseCase {}

class _MockUnreadCount extends Mock implements GetUnreadCountUseCase {}

class _MockGetProfile extends Mock implements GetPlayerProfileUseCase {}

class _MockFollow extends Mock implements FollowPlayerUseCase {}

class _MockUnfollow extends Mock implements UnfollowPlayerUseCase {}

class _MockRespect extends Mock implements RespectPlayerUseCase {}

RankingEntry _entry(int position) => RankingEntry(
      playerId: 'PDL-$position',
      name: 'Player $position',
      level: 'B',
      skillRating: 1000 + position,
      seasonRankingPoints: 100 - position,
      xp: 10,
      position: position,
    );

NotificationItem _notification(String id, {bool read = false}) => NotificationItem(
      id: id,
      type: NotificationType.matchLive,
      data: const {},
      readAt: read ? DateTime(2026) : null,
      createdAt: DateTime(2026, 9, 1),
    );

void main() {
  group('RankingBoardCubit', () {
    late _MockGetRankings getRankings;
    setUp(() => getRankings = _MockGetRankings());

    blocTest<RankingBoardCubit, PagedState<RankingEntry>>(
      'loads the skill board with filters and appends the next page',
      build: () {
        when(() => getRankings(type: RankingType.skill, season: null, level: 'B', q: '', page: 1)).thenAnswer(
          (_) async => Right(Paginated(
            items: [_entry(1), _entry(2)],
            meta: const PaginationMeta(currentPage: 1, lastPage: 2, perPage: 2, total: 3),
          )),
        );
        when(() => getRankings(type: RankingType.skill, season: null, level: 'B', q: '', page: 2)).thenAnswer(
          (_) async => Right(Paginated(
            items: [_entry(3)],
            meta: const PaginationMeta(currentPage: 2, lastPage: 2, perPage: 2, total: 3),
          )),
        );
        return RankingBoardCubit(getRankings, RankingType.skill);
      },
      act: (cubit) async {
        await cubit.apply(level: 'B');
        await cubit.loadMore();
      },
      skip: 1,
      expect: () => [
        isA<PagedState<RankingEntry>>().having((s) => s.items.length, 'items', 2).having((s) => s.hasMore, 'hasMore', true),
        isA<PagedState<RankingEntry>>().having((s) => s.isLoadingMore, 'loadingMore', true),
        isA<PagedState<RankingEntry>>()
            .having((s) => s.items.length, 'items', 3)
            .having((s) => s.hasMore, 'hasMore', false),
      ],
    );

    blocTest<RankingBoardCubit, PagedState<RankingEntry>>(
      'an empty board is an empty state, not an error',
      build: () {
        when(() => getRankings(type: RankingType.xp, season: null, level: null, q: '', page: 1)).thenAnswer(
          (_) async => const Right(Paginated(items: [], meta: PaginationMeta(currentPage: 1, lastPage: 1, perPage: 15, total: 0))),
        );
        return RankingBoardCubit(getRankings, RankingType.xp);
      },
      act: (cubit) => cubit.load(),
      skip: 1,
      expect: () => [isA<PagedState<RankingEntry>>().having((s) => s.status, 'status', PagedStatus.empty)],
    );

    test('each board shows exactly one metric', () {
      final e = _entry(1);
      expect(e.valueFor(RankingType.skill), 1001);
      expect(e.valueFor(RankingType.season), 99);
      expect(e.valueFor(RankingType.xp), 10);
    });
  });

  group('NotificationsCubit', () {
    late _MockGetNotifications getNotifications;
    late _MockMarkRead markRead;
    late _MockMarkAll markAll;
    late UnreadCountCubit unread;

    setUp(() {
      getNotifications = _MockGetNotifications();
      markRead = _MockMarkRead();
      markAll = _MockMarkAll();
      unread = UnreadCountCubit(_MockUnreadCount());
      when(() => getNotifications(unreadOnly: false, page: 1)).thenAnswer(
        (_) async => Right(Paginated(
          items: [_notification('a'), _notification('b', read: true)],
          meta: const PaginationMeta(currentPage: 1, lastPage: 1, perPage: 15, total: 2),
          extra: const {'unread_count': 1},
        )),
      );
    });

    NotificationsCubit build() => NotificationsCubit(
          getNotifications: getNotifications,
          markNotificationRead: markRead,
          markAllRead: markAll,
          unreadCount: unread,
        );

    test('syncs the badge from meta.unread_count', () async {
      final cubit = build();
      await cubit.load();
      expect(unread.state, 1);
      await cubit.close();
    });

    test('mark as read is optimistic and reverts on failure', () async {
      when(() => markRead('a')).thenAnswer((_) async => const Left(NetworkFailure()));
      final cubit = build();
      await cubit.load();
      final future = cubit.markAsRead('a');
      expect(cubit.state.items.first.isRead, isTrue);
      expect(unread.state, 0);
      await future;
      expect(cubit.state.items.first.isRead, isFalse);
      expect(unread.state, 1);
      await cubit.close();
    });

    test('mark all read clears the badge', () async {
      when(() => markAll()).thenAnswer((_) async => const Right(null));
      final cubit = build();
      await cubit.load();
      await cubit.markAll();
      expect(cubit.state.items.every((n) => n.isRead), isTrue);
      expect(unread.state, 0);
      await cubit.close();
    });
  });

  group('PlayerProfileCubit', () {
    late _MockGetProfile getProfile;
    late _MockFollow follow;

    const profile = PlayerProfile(
      player: Player(playerId: 'PDL-1', name: 'Omar', email: ''),
      social: SocialSummary(followers: 3),
    );

    setUp(() {
      getProfile = _MockGetProfile();
      follow = _MockFollow();
      when(() => getProfile('PDL-1')).thenAnswer((_) async => const Right(profile));
    });

    blocTest<PlayerProfileCubit, PlayerProfileState>(
      'follow is optimistic and rolls back on failure',
      build: () {
        when(() => follow('PDL-1')).thenAnswer((_) async => const Left(ServerFailure()));
        return PlayerProfileCubit(
          getProfile: getProfile,
          followPlayer: follow,
          unfollowPlayer: _MockUnfollow(),
          respectPlayer: _MockRespect(),
        );
      },
      act: (cubit) async {
        await cubit.load('PDL-1');
        await cubit.toggleFollow();
      },
      expect: () => [
        const PlayerProfileState.loading(),
        const PlayerProfileState.loaded(profile: profile),
        isA<PlayerProfileLoaded>()
            .having((s) => s.profile.social.isFollowing, 'following', true)
            .having((s) => s.profile.social.followers, 'followers', 4),
        const PlayerProfileState.loaded(profile: profile),
      ],
    );
  });
}
