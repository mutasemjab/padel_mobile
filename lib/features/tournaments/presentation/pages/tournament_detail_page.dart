import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/court_lines.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/match.dart';
import '../../domain/entities/registration.dart';
import '../../domain/entities/tournament.dart';
import '../bloc/competition_cubits.dart';
import '../bloc/tournament_detail_cubit.dart';
import '../bloc/tournament_detail_state.dart';
import '../widgets/live_match_card.dart';
import '../widgets/registration_sheet.dart';
import '../widgets/registration_widgets.dart';
import '../widgets/tournament_status_badge.dart';

class TournamentDetailPage extends StatelessWidget {
  final int tournamentId;

  const TournamentDetailPage({super.key, required this.tournamentId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TournamentDetailCubit>()..load(tournamentId),
      child: Scaffold(
        body: BlocBuilder<TournamentDetailCubit, TournamentDetailState>(
          builder: (context, state) {
            return switch (state) {
              TournamentDetailInitial() || TournamentDetailLoading() => const _DetailSkeleton(),
              TournamentDetailError(:final failure) => SafeArea(
                  child: Column(
                    children: [
                      Align(alignment: AlignmentDirectional.centerStart, child: BackButton(onPressed: () => context.pop())),
                      Expanded(
                        child: ErrorState(
                          failure: failure,
                          onRetry: () => context.read<TournamentDetailCubit>().load(tournamentId),
                        ),
                      ),
                    ],
                  ),
                ),
              TournamentDetailLoaded() => _DetailContent(state: state),
            };
          },
        ),
      ),
    );
  }
}

class _DetailSkeleton extends StatelessWidget {
  const _DetailSkeleton();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const ShimmerBox(height: AppSizes.heroHeight, borderRadius: BorderRadius.zero),
        Padding(
          padding: AppSpacing.page,
          child: Column(
            children: [
              for (var i = 0; i < 3; i++) ...[const PlayerCardSkeleton(), Gap.md],
            ],
          ),
        ),
      ],
    );
  }
}

class _DetailContent extends StatelessWidget {
  final TournamentDetailLoaded state;

  const _DetailContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = state.tournament;
    final tabs = [
      l10n.tournamentTabOverview,
      '${l10n.tournamentTabLive}${state.liveMatches.isEmpty ? '' : ' · ${state.liveMatches.length}'}',
      l10n.tournamentTabSchedule,
      l10n.tournamentTabResults,
    ];

    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, _) => [
          SliverAppBar(
            pinned: true,
            expandedHeight: AppSizes.heroHeight,
            backgroundColor: context.tokens.background,
            foregroundColor: AppColors.white,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: _Hero(tournament: t),
            ),
            bottom: TabBar(
              isScrollable: true,
              padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
              tabs: [for (final label in tabs) Tab(text: label, height: 36)],
            ),
          ),
        ],
        body: TabBarView(
          children: [
            _OverviewTab(state: state),
            _LiveTab(matches: state.liveMatches, tournamentId: t.id),
            _ScheduleTab(tournament: t),
            _ResultsTab(tournamentId: t.id),
          ],
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  final Tournament tournament;

  const _Hero({required this.tournament});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Hero(
          tag: 'tournament-image-${tournament.id}',
          child: AppNetworkImage(
            url: tournament.imageUrl,
            fallback: const DecoratedBox(
              decoration: BoxDecoration(gradient: AppGradients.court),
              child: CourtLinesBackground(),
            ),
          ),
        ),
        const DecoratedBox(decoration: BoxDecoration(gradient: AppGradients.imageScrim)),
        PositionedDirectional(
          start: AppSpacing.gutter,
          end: AppSpacing.gutter,
          bottom: 64,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.xs,
                children: [
                  CompetitionBadge(competitionType: tournament.competitionType.apiValue, large: true),
                  TournamentStatusBadge(status: tournament.status),
                ],
              ),
              Gap.sm,
              Text(
                tournament.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: context.text.displaySmall?.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OverviewTab extends StatelessWidget {
  final TournamentDetailLoaded state;

  const _OverviewTab({required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = state.tournament;
    return RefreshIndicator(
      onRefresh: () => context.read<TournamentDetailCubit>().refresh(),
      child: ListView(
        padding: AppSpacing.page,
        children: [
          _FactsCard(tournament: t),
          Gap.md,
          _NoteCard(ranked: t.isRanked),
          if (t.description != null && t.description!.isNotEmpty) ...[
            Gap.xl,
            Text(l10n.tournamentAbout, style: context.text.titleLarge),
            Gap.sm,
            Text(t.description!, style: context.text.bodyMedium),
          ],
          if (t.rules != null && t.rules!.isNotEmpty) ...[
            Gap.lg,
            AppCard(
              padding: EdgeInsets.zero,
              child: ExpansionTile(
                shape: const Border(),
                leading: const Icon(Icons.gavel_rounded),
                title: Text(l10n.tournamentRules, style: context.text.titleSmall),
                childrenPadding: AppSpacing.card,
                children: [Text(t.rules!, style: context.text.bodyMedium)],
              ),
            ),
          ],
          Gap.xl,
          Text(l10n.categoriesSection, style: context.text.titleLarge),
          Gap.md,
          for (final category in t.categories) ...[
            _CategoryCard(
              tournament: t,
              category: category,
              registration: state.myRegistrations
                  .where((r) => r.category.id == category.id && r.status != RegistrationStatus.cancelled)
                  .firstOrNull,
            ),
            Gap.md,
          ],
        ],
      ),
    );
  }
}

class _FactsCard extends StatelessWidget {
  final Tournament tournament;

  const _FactsCard({required this.tournament});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final venue = tournament.venue;
    Widget fact(IconData icon, String text, {VoidCallback? onTap}) => InkWell(
          onTap: onTap,
          borderRadius: AppRadius.smAll,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: AppSpacing.xs),
            child: Row(
              children: [
                Icon(icon, size: AppSizes.iconMd, color: context.tokens.textMuted),
                Gap.md,
                Expanded(child: Text(text, style: context.text.bodyMedium)),
                if (onTap != null) Icon(Icons.open_in_new_rounded, size: AppSizes.iconSm, color: context.tokens.highlight),
              ],
            ),
          ),
        );
    return AppCard(
      child: Column(
        children: [
          fact(Icons.calendar_month_rounded, DateFormatter.dateRange(tournament.startDate, tournament.endDate)),
          fact(
            Icons.place_rounded,
            venue?.displayName ?? l10n.venueTba,
            onTap: venue != null && venue.hasLocation
                ? () => launchUrl(
                      Uri.parse('https://www.google.com/maps/search/?api=1&query=${venue.latitude},${venue.longitude}'),
                      mode: LaunchMode.externalApplication,
                    )
                : null,
          ),
          if (tournament.registrationOpensAt != null && tournament.registrationClosesAt != null)
            fact(
              Icons.how_to_reg_rounded,
              l10n.tournamentRegistrationWindow(
                DateFormatter.dayMonth(tournament.registrationOpensAt!),
                DateFormatter.dayMonth(tournament.registrationClosesAt!),
              ),
            ),
          if (tournament.format != null)
            fact(Icons.account_tree_rounded, context.enums.label(EnumGroup.tournamentFormats, tournament.format)),
        ],
      ),
    );
  }
}

class _NoteCard extends StatelessWidget {
  final bool ranked;

  const _NoteCard({required this.ranked});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    return Container(
      padding: AppSpacing.cardDense,
      decoration: BoxDecoration(
        color: (ranked ? t.highlight : AppColors.clay).withValues(alpha: 0.1),
        borderRadius: AppRadius.mdAll,
      ),
      child: Row(
        children: [
          Icon(ranked ? Icons.verified_user_rounded : Icons.info_outline_rounded, color: ranked ? t.highlight : AppColors.clay),
          Gap.md,
          Expanded(
            child: Text(ranked ? l10n.tournamentRankedNote : l10n.tournamentUnrankedNote, style: context.text.bodySmall),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final Tournament tournament;
  final TournamentCategory category;
  final Registration? registration;

  const _CategoryCard({required this.tournament, required this.category, required this.registration});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    final champion = category.champion;
    final fill = category.maxTeams == 0 ? 0.0 : category.activeTeams / category.maxTeams;

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(category.name, style: context.text.titleMedium)),
              if (category.registrationFee > 0)
                Text(
                  Formatters.money(category.registrationFee, category.currency),
                  style: AppTypography.number(context, size: 17, color: t.highlight),
                )
              else
                Text(l10n.tournamentFree, style: context.text.labelMedium),
            ],
          ),
          Gap.xs,
          Text(
            [
              if (category.level != null) category.level!,
              if (category.gender != null) context.enums.label(EnumGroup.categoryGenders, category.gender),
              if (category.format != null) context.enums.label(EnumGroup.tournamentFormats, category.format),
            ].join(' · '),
            style: context.text.bodySmall,
          ),
          Gap.md,
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: AppRadius.pillAll,
                  child: LinearProgressIndicator(value: fill.clamp(0, 1).toDouble()),
                ),
              ),
              Gap.md,
              Text(l10n.teamsCount(category.activeTeams, category.maxTeams), style: context.text.labelMedium),
            ],
          ),
          if (category.waitlistCount > 0) ...[
            Gap.xs,
            Text(l10n.categoryWaitlist(category.waitlistCount), style: context.text.labelSmall),
          ],
          if (champion != null) ...[
            Gap.md,
            Container(
              padding: AppSpacing.cardDense,
              decoration: BoxDecoration(
                gradient: AppGradients.premium,
                borderRadius: AppRadius.mdAll,
              ),
              child: Row(
                children: [
                  const Icon(Icons.emoji_events_rounded, color: AppColors.onPremium),
                  Gap.sm,
                  Text(l10n.tournamentChampion, style: context.text.labelLarge?.copyWith(color: AppColors.onPremium)),
                  Gap.sm,
                  Expanded(
                    child: Text(
                      champion.label,
                      style: context.text.titleSmall?.copyWith(color: AppColors.onPremium),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
          Gap.md,
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => context.push(AppRoutes.tournamentCategory(tournament.id, category.id)),
                  child: Text(l10n.categoryView, maxLines: 1, overflow: TextOverflow.ellipsis),
                ),
              ),
              Gap.sm,
              _RegistrationCta(tournament: tournament, category: category, registration: registration),
            ],
          ),
        ],
      ),
    );
  }
}

class _RegistrationCta extends StatelessWidget {
  final Tournament tournament;
  final TournamentCategory category;
  final Registration? registration;

  const _RegistrationCta({required this.tournament, required this.category, required this.registration});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final r = registration;
    if (r != null) {
      if (r.needsPayment) {
        return FilledButton.icon(
          onPressed: () => startRegistrationPayment(context, r),
          icon: const Icon(Icons.payments_rounded),
          label: Text(l10n.registrationPay),
        );
      }
      return RegistrationStatusChip(status: r.status);
    }
    if (!tournament.registrationOpen || !category.isActive) return const SizedBox.shrink();
    return FilledButton(
      onPressed: () async {
        final result = await showRegistrationSheet(context, tournament: tournament, category: category);
        if (result == null || !context.mounted) return;
        context.read<TournamentDetailCubit>().refresh();
        if (result.payNow) await startRegistrationPayment(context, result.registration);
      },
      child: Text(category.isFull ? l10n.categoryJoinWaitlist : l10n.categoryRegister),
    );
  }
}

class _LiveTab extends StatelessWidget {
  final List<Match> matches;
  final int tournamentId;

  const _LiveTab({required this.matches, required this.tournamentId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (matches.isEmpty) {
      return EmptyState(icon: Icons.sensors_off_rounded, title: l10n.liveNowEmptyTitle, message: l10n.tournamentNoLive);
    }
    return ListView.separated(
      padding: AppSpacing.page,
      itemCount: matches.length,
      separatorBuilder: (_, _) => Gap.md,
      itemBuilder: (context, i) => LiveMatchCard(
        match: matches[i],
        onTap: () => context.push(AppRoutes.match(tournamentId, matches[i].id)),
      ),
    );
  }
}

class _ScheduleTab extends StatelessWidget {
  final Tournament tournament;

  const _ScheduleTab({required this.tournament});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => TournamentMatchesCubit(sl(), tournament.id)..load(),
      child: BlocBuilder<TournamentMatchesCubit, ViewState<List<Match>>>(
        builder: (context, state) {
          final cubit = context.read<TournamentMatchesCubit>();
          return Column(
            children: [
              if (tournament.categories.length > 1)
                SizedBox(
                  height: AppSizes.chipHeight + 20,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.gutter, AppSpacing.md, AppSpacing.gutter, 0),
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                        child: ChoiceChip(
                          label: Text(l10n.filterAll),
                          selected: cubit.categoryId == null,
                          onSelected: (_) => cubit.filterCategory(null),
                        ),
                      ),
                      for (final c in tournament.categories)
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                          child: ChoiceChip(
                            label: Text(c.name),
                            selected: cubit.categoryId == c.id,
                            onSelected: (_) => cubit.filterCategory(c.id),
                          ),
                        ),
                    ],
                  ),
                ),
              Expanded(
                child: ViewStateView<List<Match>>(
                  state: state,
                  loading: SkeletonList(itemBuilder: () => const MatchCardSkeleton()),
                  onRetry: cubit.load,
                  empty: EmptyState(icon: Icons.event_note_rounded, title: l10n.tournamentTabSchedule, message: l10n.tournamentNoSchedule),
                  builder: (context, matches) => _MatchList(matches: matches, tournamentId: tournament.id, onRefresh: cubit.refresh),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ResultsTab extends StatelessWidget {
  final int tournamentId;

  const _ResultsTab({required this.tournamentId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => TournamentResultsCubit(sl(), tournamentId)..load(),
      child: BlocBuilder<TournamentResultsCubit, ViewState<List<Match>>>(
        builder: (context, state) => ViewStateView<List<Match>>(
          state: state,
          loading: SkeletonList(itemBuilder: () => const MatchCardSkeleton()),
          onRetry: () => context.read<TournamentResultsCubit>().load(),
          empty: EmptyState(icon: Icons.fact_check_outlined, title: l10n.tournamentTabResults, message: l10n.tournamentNoResults),
          builder: (context, matches) => _MatchList(
            matches: matches,
            tournamentId: tournamentId,
            onRefresh: () => context.read<TournamentResultsCubit>().refresh(),
          ),
        ),
      ),
    );
  }
}

class _MatchList extends StatelessWidget {
  final List<Match> matches;
  final int tournamentId;
  final Future<void> Function() onRefresh;

  const _MatchList({required this.matches, required this.tournamentId, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: ListView.separated(
        padding: AppSpacing.page,
        itemCount: matches.length,
        separatorBuilder: (_, _) => Gap.md,
        itemBuilder: (context, i) => LiveMatchCard(
          match: matches[i],
          onTap: () => context.push(AppRoutes.match(tournamentId, matches[i].id)),
        ),
      ),
    );
  }
}
