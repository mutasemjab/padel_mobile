import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/models/player_summary.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../core/widgets/player_card.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/player_history.dart';
import '../../domain/usecases/social_actions_usecases.dart';
import '../bloc/player_tab_cubits.dart';

/// Followers or following of a player.
class FollowListPage extends StatelessWidget {
  final String playerId;
  final bool following;

  const FollowListPage({super.key, required this.playerId, required this.following});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => FollowListCubit(sl(), playerId: playerId, following: following)..load(),
      child: Scaffold(
        appBar: AppBar(title: Text(following ? l10n.followingTitle : l10n.followersTitle)),
        body: BlocBuilder<FollowListCubit, PagedState<PlayerSummary>>(
          builder: (context, state) {
            final cubit = context.read<FollowListCubit>();
            return PagedStateView<PlayerSummary>(
              state: state,
              onLoadMore: cubit.loadMore,
              onRefresh: cubit.refresh,
              onRetry: cubit.load,
              empty: EmptyState(icon: Icons.group_outlined, title: l10n.followersEmpty, message: ''),
              itemBuilder: (context, p, _) => PlayerCard(player: p, onTap: () => context.push(AppRoutes.player(p.playerId))),
            );
          },
        ),
      ),
    );
  }
}

/// Player search with level / side filters (labels from `meta/enums`).
class PlayerSearchPage extends StatefulWidget {
  const PlayerSearchPage({super.key});

  @override
  State<PlayerSearchPage> createState() => _PlayerSearchPageState();
}

class _PlayerSearchPageState extends State<PlayerSearchPage> {
  late final PlayerSearchCubit _cubit = PlayerSearchCubit(sl())..load();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _cubit.close();
    super.dispose();
  }

  void _onQuery(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () => _cubit.search(q: value.trim()));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final levels = context.enums.options(EnumGroup.playerLevels);
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.searchPlayersTitle)),
        body: Column(
          children: [
            Padding(
              padding: AppSpacing.pageH,
              child: TextField(
                onChanged: _onQuery,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: l10n.searchPlayersHint,
                  prefixIcon: const Icon(Icons.search_rounded),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.gutter, AppSpacing.xs, AppSpacing.gutter, 0),
              child: Text(l10n.findPartnerHint, style: context.text.bodySmall),
            ),
            Gap.md,
            SizedBox(
              height: AppSizes.chipHeight + 8,
              child: BlocBuilder<PlayerSearchCubit, PagedState<PlayerSummary>>(
                builder: (context, _) => ListView(
                  scrollDirection: Axis.horizontal,
                  padding: AppSpacing.pageH,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                      child: ChoiceChip(
                        label: Text(l10n.filterAll),
                        selected: _cubit.level == null,
                        onSelected: (_) => _cubit.search(clearLevel: true),
                      ),
                    ),
                    for (final option in levels)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                        child: ChoiceChip(
                          label: Text(option.label),
                          selected: _cubit.level == option.value,
                          onSelected: (_) => _cubit.search(level: option.value),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<PlayerSearchCubit, PagedState<PlayerSummary>>(
                builder: (context, state) => PagedStateView<PlayerSummary>(
                  state: state,
                  onLoadMore: _cubit.loadMore,
                  onRefresh: _cubit.refresh,
                  onRetry: _cubit.load,
                  empty: EmptyState(icon: Icons.person_search_rounded, title: l10n.searchPlayersEmpty, message: ''),
                  itemBuilder: (context, p, _) =>
                      PlayerCard(player: p, onTap: () => context.push(AppRoutes.player(p.playerId))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Received / sent challenges. Only the challenged player can respond.
class ChallengesPage extends StatelessWidget {
  const ChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.challengesTitle),
          bottom: TabBar(
            isScrollable: true,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md),
            tabs: [Tab(text: l10n.challengesIncoming), Tab(text: l10n.challengesOutgoing)],
          ),
        ),
        body: const TabBarView(children: [_ChallengeList(incoming: true), _ChallengeList(incoming: false)]),
      ),
    );
  }
}

class _ChallengeList extends StatelessWidget {
  final bool incoming;

  const _ChallengeList({required this.incoming});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => ChallengesCubit(sl(), incoming: incoming)..load(),
      child: BlocBuilder<ChallengesCubit, PagedState<Challenge>>(
        builder: (context, state) {
          final cubit = context.read<ChallengesCubit>();
          return PagedStateView<Challenge>(
            state: state,
            onLoadMore: cubit.loadMore,
            onRefresh: cubit.refresh,
            onRetry: cubit.load,
            empty: EmptyState(icon: Icons.sports_tennis_outlined, title: l10n.challengesEmpty, message: ''),
            itemBuilder: (context, c, _) => _ChallengeCard(challenge: c, incoming: incoming),
          );
        },
      ),
    );
  }
}

class _ChallengeCard extends StatefulWidget {
  final Challenge challenge;
  final bool incoming;

  const _ChallengeCard({required this.challenge, required this.incoming});

  @override
  State<_ChallengeCard> createState() => _ChallengeCardState();
}

class _ChallengeCardState extends State<_ChallengeCard> {
  bool _busy = false;

  Future<void> _respond(bool accept) async {
    setState(() => _busy = true);
    final result = await sl<RespondToChallengeUseCase>()(widget.challenge.id, accept: accept);
    if (!mounted) return;
    setState(() => _busy = false);
    result.match(
      (failure) => showFailure(context, failure),
      (_) => context.read<ChallengesCubit>().refresh(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final c = widget.challenge;
    final other = widget.incoming ? c.challenger : c.challenged;
    return AppCard(
      onTap: () => context.push(AppRoutes.player(other.playerId)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PlayerAvatar.fromSummary(other),
              Gap.md,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.incoming ? l10n.challengeFrom(other.name) : l10n.challengeTo(other.name),
                      style: context.text.titleSmall,
                    ),
                    if (c.createdAt != null) Text(DateFormatter.relative(context, c.createdAt!), style: context.text.labelSmall),
                  ],
                ),
              ),
              StatusChip(
                label: EnumsService.humanize(c.status),
                color: c.isPending ? AppColors.warning : context.tokens.textMuted,
              ),
            ],
          ),
          if (c.message != null && c.message!.isNotEmpty) ...[Gap.sm, Text('“${c.message!}”')],
          if (widget.incoming && c.isPending) ...[
            Gap.md,
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(onPressed: _busy ? null : () => _respond(false), child: Text(l10n.actionDecline)),
                ),
                Gap.sm,
                Expanded(
                  child: FilledButton(
                    onPressed: _busy ? null : () => _respond(true),
                    child: _busy ? const ButtonSpinner() : Text(l10n.actionAccept),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
