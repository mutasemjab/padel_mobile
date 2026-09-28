import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../../core/meta/enum_labels.dart';
import '../../../core/meta/enums_service.dart';
import '../../../core/routing/app_routes.dart';
import '../../../core/state/view_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/feedback.dart';
import '../../../core/widgets/state_builders.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../auth/presentation/widgets/auth_text_field.dart';
import '../../live_match/presentation/widgets/live_scoreboard.dart';
import '../../tournaments/domain/entities/match.dart';
import '../../tournaments/presentation/widgets/live_match_card.dart';
import '../data/scorekeeper_repository.dart';
import '../domain/scorekeeper_entities.dart';
import 'scorekeeper_cubits.dart';

class ScorekeeperLoginPage extends StatefulWidget {
  const ScorekeeperLoginPage({super.key});

  @override
  State<ScorekeeperLoginPage> createState() => _ScorekeeperLoginPageState();
}

class _ScorekeeperLoginPageState extends State<ScorekeeperLoginPage> {
  final _login = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _login.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => ScorekeeperLoginCubit(sl()),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.scorekeeperLogin)),
        body: BlocConsumer<ScorekeeperLoginCubit, ActionState>(
          listener: (context, state) {
            if (state is ActionSuccess) context.go(AppRoutes.scorekeeper);
            if (state is ActionFailure) showFailure(context, state.failure);
          },
          builder: (context, state) => ListView(
            padding: AppSpacing.page,
            children: [
              const Icon(Icons.scoreboard_rounded, size: 64, color: AppColors.accent),
              Gap.xl,
              AuthTextField(controller: _login, label: l10n.scorekeeperLoginField),
              Gap.md,
              AuthTextField(controller: _password, label: l10n.fieldPassword, obscureText: true),
              Gap.xl,
              FilledButton(
                onPressed: state is ActionInProgress
                    ? null
                    : () => context.read<ScorekeeperLoginCubit>().login(_login.text.trim(), _password.text),
                child: state is ActionInProgress ? const ButtonSpinner() : Text(l10n.actionLogIn),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScorekeeperMatchesPage extends StatelessWidget {
  const ScorekeeperMatchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => ScorekeeperMatchesCubit(sl())..load(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.scorekeeperMatches),
          actions: [
            IconButton(
              tooltip: l10n.scorekeeperLogout,
              icon: const Icon(Icons.logout_rounded),
              onPressed: () async {
                await sl<ScorekeeperRepository>().logout();
                if (context.mounted) context.go(AppRoutes.home);
              },
            ),
          ],
        ),
        body: BlocBuilder<ScorekeeperMatchesCubit, ViewState<List<Match>>>(
          builder: (context, state) => ViewStateView<List<Match>>(
            state: state,
            onRetry: () => context.read<ScorekeeperMatchesCubit>().load(),
            empty: EmptyState(icon: Icons.scoreboard_outlined, title: l10n.scorekeeperNoMatches, message: ''),
            builder: (context, matches) => RefreshIndicator(
              onRefresh: () => context.read<ScorekeeperMatchesCubit>().refresh(),
              child: ListView.separated(
                padding: AppSpacing.page,
                itemCount: matches.length,
                separatorBuilder: (_, _) => Gap.md,
                itemBuilder: (context, i) => LiveMatchCard(
                  match: matches[i],
                  showTournament: true,
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ScoringPage(match: matches[i])),
                    );
                    if (context.mounted) context.read<ScorekeeperMatchesCubit>().refresh();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Two big buttons record the point instantly. Detail is optional, added
/// afterwards, and never blocks the score.
class ScoringPage extends StatelessWidget {
  final Match match;

  const ScoringPage({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => ScoringCubit(sl(), match),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.scorekeeperTitle)),
        body: BlocConsumer<ScoringCubit, ScoringState>(
          listenWhen: (a, b) => b.failure != null && a.failure != b.failure,
          listener: (context, state) => showFailure(context, state.failure!),
          builder: (context, state) {
            final cubit = context.read<ScoringCubit>();
            final m = state.match;
            return SafeArea(
              child: Padding(
                padding: AppSpacing.page,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    LiveScoreboard(match: m),
                    Gap.lg,
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: _PointButton(team: m.teamOne, color: AppColors.primary, busy: state.sending, onTap: cubit.point)),
                          Gap.md,
                          Expanded(child: _PointButton(team: m.teamTwo, color: AppColors.info, busy: state.sending, onTap: cubit.point)),
                        ],
                      ),
                    ),
                    Gap.md,
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: state.sending ? null : cubit.undo,
                            icon: const Icon(Icons.undo_rounded),
                            label: Text(l10n.scorekeeperUndo),
                          ),
                        ),
                        Gap.sm,
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: state.lastPoint == null || state.sending ? null : () => _showDetailSheet(context, m),
                            icon: const Icon(Icons.edit_note_rounded),
                            label: Text(l10n.scorekeeperAddDetail),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _showDetailSheet(BuildContext context, Match m) {
    final cubit = context.read<ScoringCubit>();
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => BlocProvider.value(value: cubit, child: _DetailSheet(match: m)),
    );
  }
}

class _PointButton extends StatelessWidget {
  final MatchTeam? team;
  final Color color;
  final bool busy;
  final ValueChanged<int> onTap;

  const _PointButton({required this.team, required this.color, required this.busy, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Material(
      color: color,
      borderRadius: AppRadius.xlAll,
      child: InkWell(
        borderRadius: AppRadius.xlAll,
        onTap: team == null || busy
            ? null
            : () {
                HapticFeedback.mediumImpact();
                onTap(team!.id);
              },
        child: Padding(
          padding: AppSpacing.card,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.scorekeeperPointTo.toUpperCase(), style: AppTypography.eyebrow(context, color: AppColors.white)),
              Gap.sm,
              Text(
                team?.label ?? l10n.matchTbd,
                textAlign: TextAlign.center,
                style: context.text.titleLarge?.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailSheet extends StatefulWidget {
  final Match match;

  const _DetailSheet({required this.match});

  @override
  State<_DetailSheet> createState() => _DetailSheetState();
}

class _DetailSheetState extends State<_DetailSheet> {
  String? _ending;
  String? _shot;
  String? _error;
  String? _serve;
  String? _player;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final players = [...?widget.match.teamOne?.players, ...?widget.match.teamTwo?.players];
    Widget group(String title, String enumGroup, String? value, ValueChanged<String?> onChanged) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap.md,
            Text(title, style: context.text.titleSmall),
            Gap.sm,
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (final o in context.enums.options(enumGroup))
                  ChoiceChip(
                    label: Text(o.label),
                    selected: value == o.value,
                    onSelected: (on) => onChanged(on ? o.value : null),
                  ),
              ],
            ),
          ],
        );
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.xl, 0, AppSpacing.xl, AppSpacing.xl),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.scorekeeperAddDetail, style: context.text.titleLarge),
            Text(l10n.scorekeeperDetailOptional, style: context.text.bodySmall),
            group(l10n.scorekeeperEndingType, EnumGroup.pointEndingTypes, _ending, (v) => setState(() => _ending = v)),
            group(l10n.scorekeeperShot, EnumGroup.shotTypes, _shot, (v) => setState(() => _shot = v)),
            group(l10n.scorekeeperError, EnumGroup.errorTypes, _error, (v) => setState(() => _error = v)),
            group(l10n.scorekeeperServe, EnumGroup.serveOutcomes, _serve, (v) => setState(() => _serve = v)),
            Gap.md,
            Text(l10n.scorekeeperPlayer, style: context.text.titleSmall),
            Gap.sm,
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (final p in players)
                  ChoiceChip(
                    label: Text(p.name),
                    selected: _player == p.playerId,
                    onSelected: (on) => setState(() => _player = on ? p.playerId : null),
                  ),
              ],
            ),
            Gap.xl,
            FilledButton(
              onPressed: () async {
                await context.read<ScoringCubit>().details(PointInput(
                      endingType: _ending,
                      shotType: _shot,
                      errorType: _error,
                      serveOutcome: _serve,
                      primaryPlayerId: _player,
                    ));
                if (context.mounted) {
                  Navigator.of(context).pop();
                  showAppSnack(context, l10n.scorekeeperSaved);
                }
              },
              child: Text(l10n.actionSave),
            ),
          ],
        ),
      ),
    );
  }
}
