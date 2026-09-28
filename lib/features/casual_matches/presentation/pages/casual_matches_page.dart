import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/paginated_list_view.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../coaches/presentation/pages/coaches_page.dart';
import '../../../notifications/presentation/widgets/notification_bell.dart';
import '../../domain/entities/casual_match.dart';
import '../bloc/casual_cubits.dart';
import '../bloc/casual_matches_bloc.dart';
import '../bloc/casual_matches_event.dart';
import '../bloc/casual_matches_state.dart';
import '../widgets/casual_match_card.dart';
import '../widgets/create_casual_match_sheet.dart';

/// Play tab: casual games (never official) and the coaching marketplace.
class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.playTitle),
          actions: [
            IconButton(
              tooltip: l10n.myBookingsTitle,
              icon: const Icon(Icons.event_note_rounded),
              onPressed: () => context.push(AppRoutes.myBookings),
            ),
            const NotificationBell(),
          ],
          bottom: TabBar(
            isScrollable: true,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md),
            tabs: [Tab(text: l10n.playTabCasual), Tab(text: l10n.playTabCoaches)],
          ),
        ),
        body: const TabBarView(children: [CasualMatchesPage(), CoachesPage(embedded: true)]),
      ),
    );
  }
}

class CasualMatchesPage extends StatelessWidget {
  const CasualMatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CasualMatchesBloc>()..add(const CasualMatchesEvent.requested()),
      child: const _CasualBoard(),
    );
  }
}

class _CasualBoard extends StatelessWidget {
  const _CasualBoard();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'create-casual',
        backgroundColor: AppColors.clay,
        foregroundColor: AppColors.white,
        onPressed: () => showCreateCasualMatchSheet(context),
        icon: const Icon(Icons.add_rounded),
        label: Text(l10n.actionCreate),
      ),
      body: Column(
        children: [
          Gap.md,
          SizedBox(
            height: AppSizes.chipHeight + 8,
            child: BlocBuilder<CasualMatchesBloc, CasualMatchesState>(
              builder: (context, state) {
                final current = state is CasualMatchesLoaded ? state.matchTypeFilter : null;
                final bloc = context.read<CasualMatchesBloc>();
                return ListView(
                  scrollDirection: Axis.horizontal,
                  padding: AppSpacing.pageH,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                      child: ActionChip(
                        avatar: const Icon(Icons.person_rounded, size: AppSizes.iconSm),
                        label: Text(l10n.casualMyMatches),
                        onPressed: () => context.push(AppRoutes.myCasualMatches),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                      child: ChoiceChip(
                        label: Text(l10n.filterAll),
                        selected: current == null,
                        onSelected: (_) => bloc.add(const CasualMatchesEvent.matchTypeFilterChanged(null)),
                      ),
                    ),
                    for (final t in CasualMatchType.values)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                        child: ChoiceChip(
                          label: Text(context.enums.label(EnumGroup.casualMatchTypes, t.apiValue)),
                          selected: current == t.apiValue,
                          selectedColor: AppColors.clay,
                          onSelected: (_) => bloc.add(CasualMatchesEvent.matchTypeFilterChanged(t.apiValue)),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<CasualMatchesBloc, CasualMatchesState>(
              builder: (context, state) {
                final bloc = context.read<CasualMatchesBloc>();
                return switch (state) {
                  CasualMatchesInitial() || CasualMatchesLoading() =>
                    SkeletonList(itemBuilder: () => const PlayerCardSkeleton()),
                  CasualMatchesError(:final failure) =>
                    ErrorState(failure: failure, onRetry: () => bloc.add(const CasualMatchesEvent.requested())),
                  CasualMatchesLoaded(:final items) when items.isEmpty => EmptyState(
                      icon: Icons.groups_outlined,
                      title: l10n.emptyCasualTitle,
                      message: l10n.emptyCasualMessage,
                      ctaLabel: l10n.actionCreateOne,
                      accent: AppColors.clay,
                      onCta: () => showCreateCasualMatchSheet(context),
                    ),
                  CasualMatchesLoaded() => PaginatedListView<CasualMatch>(
                      items: state.items,
                      hasMore: state.hasMore,
                      isLoadingMore: state.isLoadingMore,
                      onRefresh: () async => bloc.add(const CasualMatchesEvent.refreshed()),
                      onLoadMore: () => bloc.add(const CasualMatchesEvent.moreRequested()),
                      itemBuilder: (context, m, _) => CasualMatchCard(
                        match: m,
                        onTap: () => context.push(AppRoutes.casualMatch(m.id)),
                      ),
                    ),
                };
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Games I created / joined.
class MyCasualMatchesPage extends StatelessWidget {
  const MyCasualMatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.casualMyMatches),
          bottom: TabBar(
            isScrollable: true,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md),
            tabs: [Tab(text: l10n.casualCreated), Tab(text: l10n.casualJoined)],
          ),
        ),
        body: const TabBarView(children: [_MyList(created: true), _MyList(created: false)]),
      ),
    );
  }
}

class _MyList extends StatelessWidget {
  final bool created;

  const _MyList({required this.created});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => MyCasualMatchesCubit(sl(), created: created)..load(),
      child: BlocBuilder<MyCasualMatchesCubit, PagedState<CasualMatch>>(
        builder: (context, state) {
          final cubit = context.read<MyCasualMatchesCubit>();
          return PagedStateView<CasualMatch>(
            state: state,
            onLoadMore: cubit.loadMore,
            onRefresh: cubit.refresh,
            onRetry: cubit.load,
            empty: EmptyState(icon: Icons.groups_outlined, title: l10n.emptyCasualTitle, message: l10n.emptyCasualMessage),
            itemBuilder: (context, m, _) => CasualMatchCard(match: m, onTap: () => context.push(AppRoutes.casualMatch(m.id))),
          );
        },
      ),
    );
  }
}
