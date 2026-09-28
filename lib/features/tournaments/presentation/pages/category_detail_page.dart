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
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/category_detail.dart';
import '../../domain/entities/match.dart';
import '../bloc/competition_cubits.dart';
import '../widgets/bracket_view.dart';
import '../widgets/live_match_card.dart';
import '../widgets/standings_table.dart';

/// Teams → groups & standings → bracket for one category.
class CategoryDetailPage extends StatelessWidget {
  final int tournamentId;
  final int categoryId;

  const CategoryDetailPage({super.key, required this.tournamentId, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => CategoryDetailCubit(sl(), tournamentId: tournamentId, categoryId: categoryId)..load(),
      child: BlocBuilder<CategoryDetailCubit, ViewState<CategoryDetail>>(
        builder: (context, state) {
          final detail = state.dataOrNull;
          return DefaultTabController(
            length: 3,
            initialIndex: detail == null ? 0 : (detail.bracket.isNotEmpty ? 2 : (detail.groups.isNotEmpty ? 1 : 0)),
            child: Scaffold(
              appBar: AppBar(
                title: Text(detail?.category.name ?? ''),
                bottom: TabBar(
                  isScrollable: true,
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md),
                  tabs: [
                    Tab(text: l10n.categoryTabTeams),
                    Tab(text: l10n.categoryTabGroups),
                    Tab(text: l10n.categoryTabBracket),
                  ],
                ),
              ),
              body: ViewStateView<CategoryDetail>(
                state: state,
                onRetry: () => context.read<CategoryDetailCubit>().load(),
                builder: (context, detail) {
                  void open(Match m) => context.push(AppRoutes.match(tournamentId, m.id));
                  return TabBarView(
                    children: [
                      _TeamsTab(teams: detail.teams),
                      _GroupsTab(groups: detail.groups, onOpen: open),
                      detail.bracket.isEmpty
                          ? EmptyState(icon: Icons.account_tree_rounded, title: l10n.categoryTabBracket, message: l10n.categoryNoBracket)
                          : BracketView(rounds: detail.bracket, onOpenMatch: open),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TeamsTab extends StatelessWidget {
  final List<MatchTeam> teams;

  const _TeamsTab({required this.teams});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (teams.isEmpty) return EmptyState(icon: Icons.groups_rounded, title: l10n.categoryNoTeams, message: '');
    return ListView.separated(
      padding: AppSpacing.page,
      itemCount: teams.length,
      separatorBuilder: (_, _) => Gap.sm,
      itemBuilder: (context, i) {
        final team = teams[i];
        final inactive = team.status != TeamStatus.active;
        return AppCard(
          padding: AppSpacing.cardDense,
          child: Row(
            children: [
              AvatarPair(players: team.players),
              Gap.md,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final p in team.players)
                      InkWell(
                        onTap: () => context.push(AppRoutes.player(p.playerId)),
                        child: Text(
                          p.name,
                          style: context.text.titleSmall?.copyWith(color: inactive ? context.tokens.textMuted : null),
                        ),
                      ),
                    if (team.players.isEmpty) Text(team.label, style: context.text.titleSmall),
                  ],
                ),
              ),
              if (team.seed != null) StatusChip(label: l10n.teamSeed(team.seed!), color: context.tokens.highlight),
              if (inactive) ...[
                Gap.xs,
                StatusChip(
                  label: team.withdrawalReason != null
                      ? context.enums.label(EnumGroup.resultTypes, team.withdrawalReason)
                      : (team.status == TeamStatus.withdrawn ? l10n.teamWithdrawn : l10n.teamDisqualified),
                  color: AppColors.danger,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _GroupsTab extends StatelessWidget {
  final List<CategoryGroup> groups;
  final void Function(Match match) onOpen;

  const _GroupsTab({required this.groups, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (groups.isEmpty) {
      return EmptyState(icon: Icons.table_chart_rounded, title: l10n.categoryTabGroups, message: l10n.categoryNoGroups);
    }
    return ListView(
      padding: AppSpacing.page,
      children: [
        for (final g in groups) ...[
          StandingsTable(group: g),
          Gap.md,
          for (final m in g.matches) ...[LiveMatchCard(match: m, onTap: () => onOpen(m)), Gap.sm],
          Gap.xl,
        ],
      ],
    );
  }
}
