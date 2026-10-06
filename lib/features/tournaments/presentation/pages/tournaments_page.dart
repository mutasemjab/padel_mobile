import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/paginated_list_view.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../notifications/presentation/widgets/notification_bell.dart';
import '../../domain/entities/match.dart';
import '../../domain/entities/tournament.dart';
import '../bloc/competition_cubits.dart';
import '../bloc/tournaments_bloc.dart';
import '../bloc/tournaments_event.dart';
import '../bloc/tournaments_state.dart';
import '../widgets/live_match_card.dart';
import '../widgets/tournament_card.dart';

/// Compete tab: tournaments (filters + search) and everything live now.
class CompetePage extends StatelessWidget {
  const CompetePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.competeTitle),
          actions: [
            // Labelled, not just an icon: players could not tell what the ticket icon meant.
            TextButton.icon(
              onPressed: () => context.push(AppRoutes.myRegistrations),
              icon: const Icon(Icons.confirmation_number_rounded, size: 20),
              label: Text(l10n.myRegistrationsShort),
            ),
            const NotificationBell(),
          ],
          bottom: TabBar(
            isScrollable: true,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md),
            tabs: [Tab(text: l10n.competeTabTournaments), Tab(text: l10n.competeTabLive)],
          ),
        ),
        body: const TabBarView(children: [TournamentsPage(), LiveNowView()]),
      ),
    );
  }
}

class TournamentsPage extends StatelessWidget {
  const TournamentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TournamentsBloc>()..add(const TournamentsEvent.requested()),
      child: const _TournamentsView(),
    );
  }
}

class _TournamentsView extends StatefulWidget {
  const _TournamentsView();

  @override
  State<_TournamentsView> createState() => _TournamentsViewState();
}

class _TournamentsViewState extends State<_TournamentsView> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onQuery(String value) {
    _debounce?.cancel();
    _debounce = Timer(
      const Duration(milliseconds: 400),
      () => context.read<TournamentsBloc>().add(TournamentsEvent.queryChanged(value.trim())),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.gutter, AppSpacing.md, AppSpacing.gutter, 0),
          child: TextField(
            onChanged: _onQuery,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(hintText: l10n.competeSearchHint, prefixIcon: const Icon(Icons.search_rounded)),
          ),
        ),
        Gap.md,
        const _FilterRow(),
        Gap.sm,
        Expanded(
          child: BlocBuilder<TournamentsBloc, TournamentsState>(
            builder: (context, state) {
              final bloc = context.read<TournamentsBloc>();
              return switch (state) {
                TournamentsInitial() || TournamentsLoading() =>
                  SkeletonList(itemBuilder: () => const ImageCardSkeleton()),
                TournamentsError(:final failure) =>
                  ErrorState(failure: failure, onRetry: () => bloc.add(const TournamentsEvent.refreshed())),
                TournamentsLoaded(:final items) when items.isEmpty => EmptyState(
                    icon: Icons.emoji_events_outlined,
                    title: l10n.emptyTournamentsTitle,
                    message: l10n.emptyTournamentsMessage,
                  ),
                TournamentsLoaded() => LayoutBuilder(
                    builder: (context, constraints) {
                      final wide = constraints.maxWidth >= AppSpacing.tabletBreakpoint;
                      if (!wide) {
                        return PaginatedListView<Tournament>(
                          items: state.items,
                          hasMore: state.hasMore,
                          isLoadingMore: state.isLoadingMore,
                          onRefresh: () async => bloc.add(const TournamentsEvent.refreshed()),
                          onLoadMore: () => bloc.add(const TournamentsEvent.moreRequested()),
                          itemBuilder: (context, t, _) =>
                              TournamentCard(tournament: t, onTap: () => context.push(AppRoutes.tournament(t.id))),
                        );
                      }
                      return _TournamentGrid(state: state);
                    },
                  ),
              };
            },
          ),
        ),
      ],
    );
  }
}

/// Two-column tablet grid.
class _TournamentGrid extends StatelessWidget {
  final TournamentsLoaded state;

  const _TournamentGrid({required this.state});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TournamentsBloc>();
    return NotificationListener<ScrollNotification>(
      onNotification: (n) {
        if (n.metrics.pixels >= n.metrics.maxScrollExtent - 300 && state.hasMore && !state.isLoadingMore) {
          bloc.add(const TournamentsEvent.moreRequested());
        }
        return false;
      },
      child: RefreshIndicator(
        onRefresh: () async => bloc.add(const TournamentsEvent.refreshed()),
        child: GridView.builder(
          padding: AppSpacing.page,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 460,
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            mainAxisExtent: 330,
          ),
          itemCount: state.items.length,
          itemBuilder: (context, i) => TournamentCard(
            tournament: state.items[i],
            onTap: () => context.push(AppRoutes.tournament(state.items[i].id)),
          ),
        ),
      ),
    );
  }
}

class _FilterRow extends StatelessWidget {
  const _FilterRow();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final statuses = <String?, String>{
      null: l10n.filterAll,
      'registration_open': l10n.filterOpen,
      'ongoing': l10n.filterLive,
      'completed': l10n.filterCompleted,
    };
    final types = <String?, String>{
      'ranked': l10n.filterRanked,
      'certified': l10n.filterCertified,
      'social': l10n.filterSocial,
    };
    return BlocBuilder<TournamentsBloc, TournamentsState>(
      buildWhen: (a, b) => b is TournamentsLoaded || b is TournamentsLoading,
      builder: (context, state) {
        final (status, type) = switch (state) {
          TournamentsLoaded(:final statusFilter, :final competitionTypeFilter) => (statusFilter, competitionTypeFilter),
          TournamentsLoading(:final statusFilter, :final competitionTypeFilter) => (statusFilter, competitionTypeFilter),
          _ => (null, null),
        };
        final bloc = context.read<TournamentsBloc>();
        return SizedBox(
          height: AppSizes.chipHeight + 8,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: AppSpacing.pageH,
            children: [
              for (final e in statuses.entries)
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                  child: ChoiceChip(
                    label: Text(e.value),
                    selected: status == e.key,
                    onSelected: (_) => bloc.add(TournamentsEvent.statusFilterChanged(e.key)),
                  ),
                ),
              const VerticalDivider(indent: 6, endIndent: 6),
              Gap.sm,
              for (final e in types.entries)
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                  child: FilterChip(
                    label: Text(e.value),
                    selected: type == e.key,
                    onSelected: (selected) =>
                        bloc.add(TournamentsEvent.competitionTypeChanged(selected ? e.key : null)),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

/// Every match on court right now, across tournaments.
class LiveNowView extends StatelessWidget {
  const LiveNowView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => LiveMatchesCubit(sl())..start(),
      child: BlocBuilder<LiveMatchesCubit, ViewState<List<Match>>>(
        builder: (context, state) => ViewStateView<List<Match>>(
          state: state,
          loading: SkeletonList(itemBuilder: () => const MatchCardSkeleton()),
          onRetry: () => context.read<LiveMatchesCubit>().load(),
          empty: RefreshIndicator(
            onRefresh: () => context.read<LiveMatchesCubit>().refresh(),
            child: ListView(
              children: [
                SizedBox(
                  height: 420,
                  child: EmptyState(
                    icon: Icons.sensors_rounded,
                    title: l10n.liveNowEmptyTitle,
                    message: l10n.liveNowEmptyMessage,
                  ),
                ),
              ],
            ),
          ),
          builder: (context, matches) => RefreshIndicator(
            onRefresh: () => context.read<LiveMatchesCubit>().refresh(),
            child: ListView.separated(
              padding: AppSpacing.page,
              itemCount: matches.length,
              separatorBuilder: (_, _) => Gap.md,
              itemBuilder: (context, i) {
                final m = matches[i];
                return LiveMatchCard(
                  match: m,
                  showTournament: true,
                  onTap: () => context.push(
                    m.tournamentId == null ? AppRoutes.liveMatch(m.id) : AppRoutes.match(m.tournamentId!, m.id),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
