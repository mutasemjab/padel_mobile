import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../partners/domain/entities/partner.dart';
import '../../../partners/presentation/bloc/partners_cubits.dart';
import '../../../partners/presentation/widgets/duo_3d_card.dart';
import '../../../partners/presentation/widgets/partner_widgets.dart';
import '../../../partners/presentation/widgets/recommended_partners_section.dart';
import '../../../premium/domain/entities/ai_insight.dart';
import '../../../premium/domain/usecases/premium_usecases.dart';
import '../../../premium/presentation/widgets/three_d_viewer.dart';
import '../../domain/entities/achievement.dart';
import '../../domain/entities/player_history.dart';
import '../../domain/entities/player_profile.dart';
import '../../domain/entities/player_stats.dart';
import '../bloc/player_tab_cubits.dart';
import 'achievement_badge.dart';
import 'achievements_grid.dart';
import 'result_row_tile.dart';
import 'stats_views.dart';

void _openResult(BuildContext context, ResultRow r) => context.push(AppRoutes.match(r.tournamentId, r.matchId));

/// Overview: contact (owner), 3D identity, achievements shelf, recent
/// results, partner cards, stats and tournament timeline.
class ProfileOverviewTab extends StatelessWidget {
  final PlayerProfile profile;

  const ProfileOverviewTab({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final player = profile.player;
    final asset = profile.threeDProfile?.assetUrl;
    final partners = profile.partners;

    final children = <Widget>[
      if (player.isOwner) _ContactCard(profile: profile),
      if (asset != null && asset.isNotEmpty) ...[
        SectionHeader(eyebrow: l10n.premiumLabel, eyebrowColor: AppColors.premiumGold, title: l10n.profile3dIdentity),
        ThreeDViewer(assetUrl: asset, alt: player.name),
      ] else if (!player.isOwner && player.isPremium)
        _PublicThreeD(playerId: player.playerId, name: player.name)
      else if (player.isOwner && player.isPremium)
        AppCard(
          onTap: () => context.push(AppRoutes.threeD),
          borderColor: AppColors.premiumGold.withValues(alpha: 0.4),
          child: Row(
            children: [
              const Icon(Icons.view_in_ar_rounded, color: AppColors.premiumGold),
              Gap.md,
              Expanded(child: Text(l10n.threeDGenerate, style: context.text.titleSmall)),
              const Icon(Icons.chevron_right_rounded),
            ],
          ),
        ),
      SectionHeader(
        title: l10n.achievementsTitle,
        eyebrow: l10n.achievementsProgress(profile.achievements.unlocked, profile.achievements.total),
        actionLabel: l10n.actionViewAll,
        onAction: () => context.push(AppRoutes.playerAchievements(player.playerId)),
      ),
      _AchievementShelf(latest: profile.achievements.latest),
      SectionHeader(
        title: l10n.profileRecentResults,
        actionLabel: player.isOwner || profile.recentResults.isNotEmpty ? l10n.profileRatingHistory : null,
        onAction: () => context.push(AppRoutes.playerRatingHistory(player.playerId)),
      ),
      if (profile.recentResults.isEmpty)
        AppCard(
          child: EmptyState(
            icon: Icons.scoreboard_outlined,
            title: l10n.profileNoResults,
            message: l10n.profileNoResultsHint,
            compact: true,
          ),
        )
      else
        for (final r in profile.recentResults) ResultRowTile(result: r, onTap: () => _openResult(context, r)),
      if (partners != null) ...[
        SectionHeader(title: l10n.profileTabPartners),
        PartnerSlotCard(
          kind: PartnerSlotKind.main,
          slot: partners.mainPartner,
          onOpenPlayer: (id) => context.push(AppRoutes.player(id)),
        ),
        PartnerSlotCard(
          kind: PartnerSlotKind.bestHistorical,
          slot: partners.bestHistorical,
          onOpenPlayer: (id) => context.push(AppRoutes.player(id)),
        ),
        PartnerSlotCard(
          kind: PartnerSlotKind.mostPlayed,
          slot: partners.mostPlayedWith,
          onOpenPlayer: (id) => context.push(AppRoutes.player(id)),
        ),
      ],
      if (profile.stats != null) ...[
        SectionHeader(title: l10n.profileTabStats),
        StatsSummaryGrid(stats: profile.stats!),
      ],
      SectionHeader(title: l10n.profileTournamentHistory),
      _TournamentTimeline(playerId: player.playerId),
    ];

    return ListView.separated(
      padding: const EdgeInsetsDirectional.fromSTEB(
        AppSpacing.gutter,
        AppSpacing.lg,
        AppSpacing.gutter,
        AppSpacing.huge,
      ),
      itemCount: children.length,
      separatorBuilder: (_, i) => children[i] is SectionHeader ? Gap.md : Gap.lg,
      itemBuilder: (_, i) => children[i],
    );
  }
}

/// Visitors: `GET players/{id}/3d-profile` when the profile payload didn't
/// embed one. Renders nothing unless a completed asset exists.
class _PublicThreeD extends StatefulWidget {
  final String playerId;
  final String name;

  const _PublicThreeD({required this.playerId, required this.name});

  @override
  State<_PublicThreeD> createState() => _PublicThreeDState();
}

class _PublicThreeDState extends State<_PublicThreeD> {
  late final Future<ThreeDAsset?> _asset = sl<GetPlayer3dProfileUseCase>()(
    widget.playerId,
  ).then((r) => r.getOrElse((_) => null));

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ThreeDAsset?>(
      future: _asset,
      builder: (context, snap) {
        final url = snap.data?.assetUrl;
        if (url == null || url.isEmpty) return const SizedBox.shrink();
        return ThreeDViewer(assetUrl: url, alt: widget.name);
      },
    );
  }
}

class _ContactCard extends StatelessWidget {
  final PlayerProfile profile;

  const _ContactCard({required this.profile});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final p = profile.player;
    Widget row(IconData icon, String value) => Padding(
      padding: const EdgeInsetsDirectional.only(top: AppSpacing.sm),
      child: Row(
        children: [
          Icon(icon, size: AppSizes.iconSm, color: context.tokens.textMuted),
          Gap.sm,
          Expanded(child: Text(value, style: context.text.bodyMedium)),
        ],
      ),
    );
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lock_outline_rounded, size: AppSizes.iconSm, color: context.tokens.textMuted),
              Gap.xs,
              Expanded(child: Text(l10n.profileContact, style: AppTypography.eyebrow(context))),
            ],
          ),
          if (p.email.isNotEmpty) row(Icons.alternate_email_rounded, p.email),
          if (p.phone != null && p.phone!.isNotEmpty) row(Icons.phone_rounded, p.phone!),
          if (p.dateOfBirth != null) row(Icons.cake_rounded, DateFormatter.fullDate(p.dateOfBirth!)),
        ],
      ),
    );
  }
}

class _AchievementShelf extends StatelessWidget {
  final List<Achievement> latest;

  const _AchievementShelf({required this.latest});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (latest.isEmpty) {
      return AppCard(
        child: EmptyState(
          icon: Icons.emoji_events_outlined,
          title: l10n.achievementsEmpty,
          message: l10n.achievementAutomatic,
          compact: true,
        ),
      );
    }
    return SizedBox(
      height: 124,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: latest.length,
        separatorBuilder: (_, _) => Gap.md,
        itemBuilder: (context, i) =>
            AchievementBadge(achievement: latest[i], size: 72, onTap: () => showAchievementDetail(context, latest[i])),
      ),
    );
  }
}

class _TournamentTimeline extends StatelessWidget {
  final String playerId;

  const _TournamentTimeline({required this.playerId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => TournamentHistoryCubit(sl(), playerId)..load(),
      child: BlocBuilder<TournamentHistoryCubit, ViewState<List<TournamentHistoryEntry>>>(
        builder: (context, state) => ViewStateView<List<TournamentHistoryEntry>>(
          state: state,
          loading: const PlayerCardSkeleton(),
          onRetry: () => context.read<TournamentHistoryCubit>().load(),
          empty: AppCard(
            child: EmptyState(
              icon: Icons.emoji_events_outlined,
              title: l10n.profileNoResults,
              message: l10n.profileNoResultsHint,
              compact: true,
            ),
          ),
          builder: (context, entries) => Column(
            children: [
              for (var i = 0; i < entries.length; i++) _TimelineEntry(entry: entries[i], last: i == entries.length - 1),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  final TournamentHistoryEntry entry;
  final bool last;

  const _TimelineEntry({required this.entry, required this.last});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    final (placement, color) = switch (entry.placement) {
      'champion' => (l10n.placementChampion, AppColors.premiumGold),
      'finalist' => (l10n.placementFinalist, AppColors.medalSilver),
      final p? => (EnumsService.humanize(p), t.textMuted),
      null => ('', t.textMuted),
    };
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 24,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsetsDirectional.only(top: AppSpacing.lg),
                  decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                ),
                if (!last) Expanded(child: Container(width: 2, color: t.outline)),
              ],
            ),
          ),
          Gap.sm,
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.md),
              child: AppCard(
                padding: AppSpacing.cardDense,
                onTap: () => context.push(AppRoutes.tournament(entry.tournamentId)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            entry.tournamentName,
                            style: context.text.titleSmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            [
                              if (entry.categoryName != null) entry.categoryName!,
                              l10n.statsRecord(entry.wins, entry.matches),
                              if (entry.lastPlayedAt != null) DateFormatter.monthYear(entry.lastPlayedAt!),
                            ].join(' · '),
                            style: context.text.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    if (placement.isNotEmpty) StatusChip(label: placement, color: color),
                    if (entry.ranked) ...[
                      Gap.xs,
                      Icon(Icons.verified_user_rounded, size: AppSizes.iconSm, color: t.highlight),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Results tab — paginated verified results.
class ProfileResultsTab extends StatelessWidget {
  final String playerId;

  const ProfileResultsTab({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => PlayerResultsCubit(sl(), playerId)..load(),
      child: BlocBuilder<PlayerResultsCubit, PagedState<ResultRow>>(
        builder: (context, state) {
          final cubit = context.read<PlayerResultsCubit>();
          return PagedStateView<ResultRow>(
            state: state,
            onLoadMore: cubit.loadMore,
            onRefresh: cubit.refresh,
            onRetry: cubit.load,
            header: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => context.push(AppRoutes.playerRatingHistory(playerId)),
                    icon: const Icon(Icons.show_chart_rounded),
                    label: Text(l10n.profileRatingHistory),
                  ),
                ),
              ],
            ),
            empty: EmptyState(
              icon: Icons.scoreboard_outlined,
              title: l10n.profileNoResults,
              message: l10n.profileNoResultsHint,
            ),
            itemBuilder: (context, r, _) => ResultRowTile(result: r, onTap: () => _openResult(context, r)),
          );
        },
      ),
    );
  }
}

/// Achievements tab — full catalog with progress.
class ProfileAchievementsTab extends StatelessWidget {
  final String playerId;

  const ProfileAchievementsTab({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => PlayerAchievementsCubit(sl(), playerId)..load(),
      child: BlocBuilder<PlayerAchievementsCubit, ViewState<List<Achievement>>>(
        builder: (context, state) => ViewStateView<List<Achievement>>(
          state: state,
          onRetry: () => context.read<PlayerAchievementsCubit>().load(),
          empty: EmptyState(
            icon: Icons.emoji_events_outlined,
            title: l10n.achievementsEmpty,
            message: l10n.achievementAutomatic,
          ),
          builder: (context, items) => RefreshIndicator(
            onRefresh: () => context.read<PlayerAchievementsCubit>().refresh(),
            child: ListView(
              padding: AppSpacing.page,
              children: [AchievementsCollection(achievements: items)],
            ),
          ),
        ),
      ),
    );
  }
}

/// Partners tab — the four cards, requests (own), history.
class ProfilePartnersTab extends StatelessWidget {
  final String playerId;
  final bool isOwner;

  const ProfilePartnersTab({super.key, required this.playerId, required this.isOwner});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => PartnersOverviewCubit(sl(), playerId)..load(),
      child: BlocBuilder<PartnersOverviewCubit, ViewState<PartnersOverview>>(
        builder: (context, state) => ViewStateView<PartnersOverview>(
          state: state,
          onRetry: () => context.read<PartnersOverviewCubit>().load(),
          builder: (context, overview) => RefreshIndicator(
            onRefresh: () => context.read<PartnersOverviewCubit>().refresh(),
            child: ListView(
              padding: AppSpacing.page,
              children: [
                if (isOwner) ...[
                  AppCard(
                    onTap: () => context.push(AppRoutes.partnerRequests),
                    child: Row(
                      children: [
                        Icon(Icons.inbox_rounded, color: context.tokens.highlight),
                        Gap.md,
                        Expanded(child: Text(l10n.partnerRequestsTitle, style: context.text.titleSmall)),
                        const Icon(Icons.chevron_right_rounded),
                      ],
                    ),
                  ),
                  Gap.lg,
                ],
                PartnerSlotCard(
                  kind: PartnerSlotKind.main,
                  slot: overview.mainPartner,
                  onOpenPlayer: (id) => context.push(AppRoutes.player(id)),
                  action: isOwner && overview.mainPartner.record != null ? const _EndPartnershipButton() : null,
                ),
                if (isOwner && overview.mainPartner.record != null) ...[Gap.md, const Duo3dCard()],
                Gap.md,
                PartnerSlotCard(
                  kind: PartnerSlotKind.bestHistorical,
                  slot: overview.bestHistorical,
                  onOpenPlayer: (id) => context.push(AppRoutes.player(id)),
                ),
                Gap.md,
                PartnerSlotCard(
                  kind: PartnerSlotKind.mostPlayed,
                  slot: overview.mostPlayedWith,
                  onOpenPlayer: (id) => context.push(AppRoutes.player(id)),
                ),
                if (isOwner) ...[Gap.xxl, const RecommendedPartnersSection()],
                Gap.xxl,
                SectionHeader(title: l10n.partnerHistory),
                Gap.md,
                if (overview.history.isEmpty)
                  Text(l10n.partnerNoHistory, style: context.text.bodySmall)
                else
                  for (final record in overview.history) ...[PartnerHistoryTile(record: record), Gap.sm],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Stats tab — summary + Premium-owner advanced analytics.
class ProfileStatsTab extends StatelessWidget {
  final String playerId;

  const ProfileStatsTab({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => PlayerStatsCubit(sl(), playerId)..load(),
      child: BlocBuilder<PlayerStatsCubit, ViewState<PlayerStatsBundle>>(
        builder: (context, state) => ViewStateView<PlayerStatsBundle>(
          state: state,
          onRetry: () => context.read<PlayerStatsCubit>().load(),
          builder: (context, bundle) => RefreshIndicator(
            onRefresh: () => context.read<PlayerStatsCubit>().refresh(),
            child: ListView(
              padding: AppSpacing.page,
              children: [
                StatsSummaryGrid(stats: bundle.summary),
                Gap.xxl,
                if (bundle.advanced != null)
                  AdvancedStatsView(stats: bundle.advanced!)
                else if (bundle.advancedAvailable)
                  const SizedBox.shrink()
                else
                  AppCard(child: PremiumRequiredState(compact: true, message: l10n.statsAdvancedLocked)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Own profile only: ends the main partnership (`DELETE me/main-partner`)
/// after a confirmation, then refreshes the tab and the session profile.
class _EndPartnershipButton extends StatelessWidget {
  const _EndPartnershipButton();

  Future<void> _end(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final confirmed = await confirmAction(
      context,
      title: l10n.partnerRemoveMain,
      message: l10n.partnerRemoveMainConfirm,
      confirmLabel: l10n.partnerRemoveMain,
      cancelLabel: l10n.actionCancel,
      destructive: true,
    );
    if (!confirmed || !context.mounted) return;
    final actions = context.read<PartnerActionCubit>();
    if (await actions.removeMain()) {
      if (!context.mounted) return;
      showAppSnack(context, l10n.partnerEnded);
      context.read<PartnersOverviewCubit>().refresh();
      context.read<AuthBloc>().add(const AuthEvent.refreshRequested());
    } else if (context.mounted && actions.state is ActionFailure) {
      showFailure(context, (actions.state as ActionFailure).failure);
    }
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<PartnerActionCubit, ActionState>(
    builder: (context, state) => TextButton.icon(
      onPressed: state is ActionInProgress ? null : () => _end(context),
      style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
      icon: const Icon(Icons.link_off_rounded, size: 18),
      label: Text(AppLocalizations.of(context).partnerRemoveMain),
    ),
  );
}
