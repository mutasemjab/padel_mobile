import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../notifications/presentation/bloc/unread_count_cubit.dart';
import '../../../notifications/presentation/widgets/notification_bell.dart';
import '../../domain/entities/home_feed.dart';
import '../bloc/home_cubit.dart';
import '../widgets/home_hero.dart';
import '../widgets/home_sections.dart';

/// Contextual feed from `me/home`: a hero that follows what matters right
/// now, then every section in the backend's `priority` order.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>()..load(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, ViewState<HomeFeed>>(
        listenWhen: (_, current) => current is ViewLoaded<HomeFeed>,
        listener: (context, state) {
          final feed = state.dataOrNull;
          if (feed != null) context.read<UnreadCountCubit>().set(feed.unreadNotifications);
        },
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () => context.read<HomeCubit>().refresh(),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                _HomeAppBar(feed: state.dataOrNull),
                ...switch (state) {
                  ViewInitial() || ViewLoading() => [const SliverToBoxAdapter(child: _HomeSkeleton())],
                  ViewError(:final failure) => [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: ErrorState(failure: failure, onRetry: () => context.read<HomeCubit>().load()),
                      ),
                    ],
                  ViewEmpty() => [const SliverFillRemaining(hasScrollBody: false, child: _HomeEmpty())],
                  ViewLoaded(:final data) => _content(context, data),
                },
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> _content(BuildContext context, HomeFeed feed) {
    final hero = buildHomeHero(context, feed);
    final skip = switch (hero?.$1) {
      HeroSource.live => null,
      HeroSource.nextMatch => 'next_match',
      HeroSource.partnerRequests => 'pending_partner_requests',
      null => null,
    };
    final sections = feed.ordered.where((s) => s.key != skip).toList();

    return [
      if (hero != null)
        SliverPadding(
          padding: AppSpacing.pageH,
          sliver: SliverToBoxAdapter(child: _MaxWidth(child: hero.$2.staggered(context, 0))),
        ),
      SliverPadding(
        padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.gutter, AppSpacing.xxl, AppSpacing.gutter, AppSpacing.huge),
        sliver: SliverLayoutBuilder(
          builder: (context, constraints) {
            final twoColumns = constraints.crossAxisExtent >= 900;
            if (!twoColumns) {
              return SliverList.separated(
                itemCount: sections.length,
                separatorBuilder: (_, _) => Gap.xxl,
                itemBuilder: (context, i) =>
                    _MaxWidth(child: HomeSectionView(section: sections[i]).staggered(context, i + 1)),
              );
            }
            // Tablets: two balanced columns.
            final left = [for (var i = 0; i < sections.length; i += 2) sections[i]];
            final right = [for (var i = 1; i < sections.length; i += 2) sections[i]];
            Widget column(List<HomeSection> items) => Column(
                  children: [
                    for (final s in items) ...[HomeSectionView(section: s), Gap.xxl],
                  ],
                );
            return SliverToBoxAdapter(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: column(left)),
                  Gap.xxl,
                  Expanded(child: column(right)),
                ],
              ),
            );
          },
        ),
      ),
    ];
  }
}

class _MaxWidth extends StatelessWidget {
  final Widget child;

  const _MaxWidth({required this.child});

  @override
  Widget build(BuildContext context) => Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: child,
        ),
      );
}

class _HomeAppBar extends StatelessWidget {
  final HomeFeed? feed;

  const _HomeAppBar({required this.feed});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final authName = context.select<AuthBloc, String?>((b) => b.state.currentPlayer?.name);
    final summary = feed?.player;
    final name = (summary?.name.isNotEmpty ?? false) ? summary!.name : (authName ?? '');
    final firstName = name.split(' ').first;

    return SliverAppBar(
      floating: true,
      snap: true,
      toolbarHeight: 72,
      backgroundColor: context.tokens.background,
      titleSpacing: AppSpacing.gutter,
      title: Row(
        children: [
          const AppLogo(height: 34),
          Gap.md,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.appTitle.toUpperCase(),
                  style: AppTypography.eyebrow(context, color: context.tokens.highlight),
                ),
                Text(
                  firstName.isEmpty ? l10n.navHome : l10n.homeGreeting(firstName),
                  style: context.text.headlineMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: l10n.searchPlayersTitle,
          icon: const Icon(Icons.search_rounded),
          onPressed: () => context.push(AppRoutes.playerSearch),
        ),
        const NotificationBell(),
        if (summary != null && summary.playerId.isNotEmpty)
          Padding(
            padding: const EdgeInsetsDirectional.only(end: AppSpacing.gutter, start: AppSpacing.xs),
            child: GestureDetector(
              onTap: () => context.go(AppRoutes.profile),
              child: PlayerAvatar.fromSummary(summary, size: AppSizes.avatarSm),
            ),
          ),
      ],
    );
  }
}

class _HomeSkeleton extends StatelessWidget {
  const _HomeSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: AppSpacing.pageH,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeroSkeleton(),
          Gap.xxl,
          ShimmerBox(width: 140, height: 20),
          Gap.md,
          Row(
            children: [
              Expanded(child: ShimmerBox(height: 110, borderRadius: AppRadius.lgAll)),
              Gap.sm,
              Expanded(child: ShimmerBox(height: 110, borderRadius: AppRadius.lgAll)),
            ],
          ),
          Gap.xxl,
          ShimmerBox(width: 180, height: 20),
          Gap.md,
          MatchCardSkeleton(),
          Gap.md,
          MatchCardSkeleton(),
        ],
      ),
    );
  }
}

class _HomeEmpty extends StatelessWidget {
  const _HomeEmpty();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return EmptyState(
      icon: Icons.sports_tennis_rounded,
      title: l10n.homeEmptyTitle,
      message: l10n.homeEmptyMessage,
      ctaLabel: l10n.homeFindTournament,
      onCta: () => context.go(AppRoutes.compete),
    );
  }
}
