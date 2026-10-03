import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../partners/presentation/bloc/partners_cubits.dart';
import '../../domain/entities/player_profile.dart';
import '../../../auth/presentation/widgets/delete_account_dialog.dart';
import '../bloc/player_profile_cubit.dart';
import '../bloc/player_profile_state.dart';
import '../widgets/athlete_header.dart';
import '../widgets/challenge_dialog.dart';
import '../widgets/profile_tabs.dart';
import '../widgets/social_action_bar.dart';

/// The athlete card: hero header with metrics, then Overview · Results ·
/// Achievements · Partners · Stats.
class PlayerProfilePage extends StatelessWidget {
  final String playerId;

  const PlayerProfilePage({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<PlayerProfileCubit>()..load(playerId)),
        BlocProvider(create: (_) => sl<PartnerActionCubit>()),
      ],
      child: Scaffold(
        body: BlocBuilder<PlayerProfileCubit, PlayerProfileState>(
          builder: (context, state) {
            return switch (state) {
              PlayerProfileInitial() ||
              PlayerProfileLoading() => const _ProfileSkeleton(),
              PlayerProfileError(:final failure) => SafeArea(
                child: Column(
                  children: [
                    const _BackRow(),
                    Expanded(
                      child: ErrorState(
                        failure: failure,
                        onRetry: () =>
                            context.read<PlayerProfileCubit>().load(playerId),
                      ),
                    ),
                  ],
                ),
              ),
              PlayerProfileLoaded(:final profile) => _ProfileContent(
                profile: profile,
              ),
            };
          },
        ),
      ),
    );
  }
}

class _BackRow extends StatelessWidget {
  const _BackRow();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: context.canPop()
          ? const BackButton()
          : const SizedBox(height: kToolbarHeight),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  final PlayerProfile profile;

  const _ProfileContent({required this.profile});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final player = profile.player;
    final isOwner = player.isOwner;
    final tabs = [
      l10n.profileTabOverview,
      l10n.profileTabResults,
      l10n.profileTabAchievements,
      l10n.profileTabPartners,
      l10n.profileTabStats,
    ];

    return DefaultTabController(
      length: tabs.length,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            pinned: true,
            // Matches the top of the court gradient so the hero reads as one surface.
            backgroundColor: innerBoxIsScrolled
                ? context.tokens.background
                : AppColors.primaryDeep,
            foregroundColor: innerBoxIsScrolled
                ? context.tokens.textPrimary
                : AppColors.white,
            title: innerBoxIsScrolled ? Text(player.name) : null,
            actions: [
              if (isOwner) ...[
                IconButton(
                  tooltip: l10n.profileEdit,
                  icon: const Icon(Icons.edit_rounded),
                  onPressed: () async {
                    await context.push(AppRoutes.editProfile);
                    if (context.mounted) {
                      context.read<PlayerProfileCubit>().load(
                        player.playerId,
                        silent: true,
                      );
                    }
                  },
                ),
                IconButton(
                  tooltip: l10n.settingsTitle,
                  icon: const Icon(Icons.settings_rounded),
                  onPressed: () => context.push(AppRoutes.settings),
                ),
                IconButton(
                  tooltip: l10n.deleteAccountTitle,
                  icon: const Icon(Icons.delete_outline_rounded, color: AppColors.danger),
                  onPressed: () => showDeleteAccountDialog(context),
                ),
              ],
            ],
          ),
          SliverToBoxAdapter(
            child: AthleteHeader(
              profile: profile,
              actions: isOwner
                  ? const _OwnerActions()
                  : _VisitorActions(profile: profile),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarDelegate(
              TabBar(
                isScrollable: true,
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                labelPadding: const EdgeInsetsDirectional.symmetric(
                  horizontal: AppSpacing.lg,
                ),
                tabs: [for (final t in tabs) Tab(text: t, height: 38)],
              ),
              color: context.tokens.background,
            ),
          ),
        ],
        body: TabBarView(
          children: [
            ProfileOverviewTab(profile: profile),
            ProfileResultsTab(playerId: player.playerId),
            ProfileAchievementsTab(playerId: player.playerId),
            ProfilePartnersTab(playerId: player.playerId, isOwner: isOwner),
            ProfileStatsTab(playerId: player.playerId),
          ],
        ),
      ),
    );
  }
}

class _OwnerActions extends StatelessWidget {
  const _OwnerActions();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.white,
              side: const BorderSide(color: AppColors.textMuted),
            ),
            onPressed: () => context.push(AppRoutes.partnerRequests),
            icon: const Icon(Icons.handshake_rounded),
            label: Text(l10n.partnerRequestsTitle),
          ),
        ),
        Gap.sm,
        IconButton.filled(
          tooltip: l10n.challengesTitle,
          style: IconButton.styleFrom(
            backgroundColor: AppColors.white.withValues(alpha: 0.12),
            foregroundColor: AppColors.white,
            minimumSize: const Size(
              AppSizes.buttonHeight,
              AppSizes.buttonHeight,
            ),
          ),
          onPressed: () => context.push(AppRoutes.challenges),
          icon: const Icon(Icons.sports_tennis_rounded),
        ),
      ],
    );
  }
}

class _VisitorActions extends StatelessWidget {
  final PlayerProfile profile;

  const _VisitorActions({required this.profile});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final player = profile.player;
    return BlocListener<PartnerActionCubit, ActionState>(
      listener: (context, state) {
        if (state is ActionSuccess) {
          showAppSnack(
            context,
            l10n.partnerRequestSent,
            icon: Icons.handshake_rounded,
          );
        } else if (state is ActionFailure) {
          showFailure(context, state.failure);
        }
      },
      child: SocialActionBar(
        isFollowing: profile.social.isFollowing,
        hasRespected: profile.social.hasRespected,
        onFollowToggle: () async {
          final failure = await context
              .read<PlayerProfileCubit>()
              .toggleFollow();
          if (failure != null && context.mounted) showFailure(context, failure);
        },
        onRespect: () async {
          final failure = await context
              .read<PlayerProfileCubit>()
              .sendRespect();
          if (!context.mounted) return;
          if (failure != null) {
            showFailure(context, failure);
          } else {
            showAppSnack(
              context,
              l10n.profileRespectSent,
              icon: Icons.thumb_up_alt_rounded,
            );
          }
        },
        onChallenge: () => showChallengeDialog(
          context,
          playerId: player.playerId,
          playerName: player.name,
        ),
        onRequestPartner: () =>
            context.read<PartnerActionCubit>().send(player.playerId),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color color;

  _TabBarDelegate(this.tabBar, {required this.color});

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) => SizedBox.expand(
    child: ColoredBox(color: color, child: tabBar),
  );

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) =>
      oldDelegate.tabBar != tabBar || oldDelegate.color != color;
}

class _ProfileSkeleton extends StatelessWidget {
  const _ProfileSkeleton();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: AppSpacing.page,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kToolbarHeight),
            Row(
              children: [
                ShimmerBox.circle(size: AppSizes.avatarXl),
                Gap.lg,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(width: 180, height: 28),
                      Gap.sm,
                      ShimmerBox(width: 110, height: 16),
                    ],
                  ),
                ),
              ],
            ),
            Gap.xxl,
            ShimmerBox(height: 52, borderRadius: AppRadius.pillAll),
            Gap.lg,
            Row(
              children: [
                Expanded(
                  child: ShimmerBox(height: 110, borderRadius: AppRadius.lgAll),
                ),
                Gap.sm,
                Expanded(
                  child: ShimmerBox(height: 110, borderRadius: AppRadius.lgAll),
                ),
                Gap.sm,
                Expanded(
                  child: ShimmerBox(height: 110, borderRadius: AppRadius.lgAll),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
