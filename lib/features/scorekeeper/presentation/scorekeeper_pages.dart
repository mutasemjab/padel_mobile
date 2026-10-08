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
import '../../tournaments/domain/entities/live_payload.dart';
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

/// Tapping a team opens the reason sheet; the point is sent only once its
/// mandatory structured reason is complete (the server rejects it otherwise).
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
            final finished = m.status == MatchStatus.completed || m.status == MatchStatus.walkover;
            Future<void> recordFor(int teamId) async {
              final input = await _showReasonSheet(context, m, winningTeamId: teamId);
              if (input != null) await cubit.point(input);
            }

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
                          Expanded(child: _PointButton(team: m.teamOne, color: AppColors.primary, busy: state.sending || finished, onTap: recordFor)),
                          Gap.md,
                          Expanded(child: _PointButton(team: m.teamTwo, color: AppColors.info, busy: state.sending || finished, onTap: recordFor)),
                        ],
                      ),
                    ),
                    if (finished) ...[
                      Gap.md,
                      Container(
                        padding: AppSpacing.cardDense,
                        decoration: BoxDecoration(color: AppColors.success.withValues(alpha: 0.14), borderRadius: AppRadius.mdAll),
                        child: Row(
                          children: [
                            const Icon(Icons.emoji_events_rounded, color: AppColors.success),
                            Gap.sm,
                            Expanded(
                              child: Text(
                                '${l10n.scorekeeperMatchEnded} — ${m.winner?.label ?? ''}',
                                style: context.text.titleSmall,
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
                          child: OutlinedButton.icon(
                            onPressed: state.sending ? null : cubit.undo,
                            icon: const Icon(Icons.undo_rounded),
                            label: Text(m.endedEarly ? l10n.scorekeeperReopen : l10n.scorekeeperUndo),
                          ),
                        ),
                        Gap.sm,
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: state.lastPoint?.winningTeamId == null || state.sending
                                ? null
                                : () async {
                                    final last = state.lastPoint!;
                                    final input = await _showReasonSheet(context, m, winningTeamId: last.winningTeamId!, initial: last);
                                    if (input == null) return;
                                    await cubit.details(input);
                                    if (context.mounted && cubit.state.failure == null) showAppSnack(context, l10n.scorekeeperSaved);
                                  },
                            icon: const Icon(Icons.edit_note_rounded),
                            label: Text(l10n.scorekeeperEditLastPoint),
                          ),
                        ),
                      ],
                    ),
                    if (m.isInProgress) ...[
                      Gap.sm,
                      TextButton.icon(
                        style: TextButton.styleFrom(foregroundColor: AppColors.danger),
                        onPressed: state.sending
                            ? null
                            : () async {
                                final choice = await _showEndSheet(context, m);
                                if (choice != null) await cubit.end(choice.winnerId, reason: choice.reason);
                              },
                        icon: const Icon(Icons.flag_rounded),
                        label: Text(l10n.scorekeeperEndMatch),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Who won and why — the team ahead is preselected.
  Future<({int winnerId, String reason})?> _showEndSheet(BuildContext context, Match m) {
    final live = m.liveScore;
    // Sets first, then games in the current set.
    final setsDiff = m.setsWonTeamOne - m.setsWonTeamTwo;
    final gamesDiff = (live?.currentSetGames.teamOne ?? 0) - (live?.currentSetGames.teamTwo ?? 0);
    final oneAhead = setsDiff != 0 ? setsDiff > 0 : gamesDiff >= 0;
    var winner = oneAhead ? m.teamOne!.id : m.teamTwo!.id;
    final reason = TextEditingController();
    return showModalBottomSheet<({int winnerId, String reason})>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (sheet) {
        final l10n = AppLocalizations.of(sheet);
        return StatefulBuilder(
          builder: (sheet, setState) => Padding(
            padding: EdgeInsetsDirectional.fromSTEB(AppSpacing.xl, 0, AppSpacing.xl, MediaQuery.viewInsetsOf(sheet).bottom + AppSpacing.xl),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(l10n.scorekeeperEndMatchTitle, style: sheet.text.titleLarge),
                Gap.xs,
                Text(l10n.scorekeeperEndMatchHelp, style: sheet.text.bodySmall),
                Gap.md,
                for (final team in [m.teamOne!, m.teamTwo!])
                  Card(
                    child: ListTile(
                      leading: Icon(
                        winner == team.id ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded,
                        color: winner == team.id ? AppColors.success : null,
                      ),
                      title: Text(team.label),
                      onTap: () => setState(() => winner = team.id),
                    ),
                  ),
                Gap.sm,
                TextField(controller: reason, maxLength: 255, decoration: InputDecoration(labelText: l10n.scorekeeperEndReason)),
                Gap.md,
                FilledButton.icon(
                  style: FilledButton.styleFrom(backgroundColor: AppColors.danger),
                  onPressed: () => Navigator.of(sheet).pop((winnerId: winner, reason: reason.text.trim())),
                  icon: const Icon(Icons.flag_rounded),
                  label: Text(l10n.scorekeeperEndMatch),
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(reason.dispose);
  }

  Future<PointInput?> _showReasonSheet(BuildContext context, Match m, {required int winningTeamId, PointEvent? initial}) {
    return showModalBottomSheet<PointInput>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => _PointReasonSheet(match: m, winningTeamId: winningTeamId, initial: initial),
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

/// The mandatory reason for one point. The ending type decides which fields
/// are required, whose player is named and which values are allowed — read
/// from `meta/enums` (with the server's current rules as an offline fallback).
class _PointReasonSheet extends StatefulWidget {
  final Match match;
  final int winningTeamId;
  final PointEvent? initial;

  const _PointReasonSheet({required this.match, required this.winningTeamId, this.initial});

  @override
  State<_PointReasonSheet> createState() => _PointReasonSheetState();
}

class _PointReasonSheetState extends State<_PointReasonSheet> {
  static const _shot = 'shot_type';
  static const _error = 'error_type';
  static const _serve = 'serve_outcome';
  static const _player = 'primary_player_id';

  /// Same rules the server enforces; used only until `meta/enums` has loaded.
  static const _fallback = <String, PointEndingRule>{
    'winner': PointEndingRule(requires: [_player, _shot], playerTeam: 'winning'),
    'forced_error': PointEndingRule(requires: [_player, _error], playerTeam: 'losing'),
    'unforced_error': PointEndingRule(requires: [_player, _error], playerTeam: 'losing'),
    'ace': PointEndingRule(requires: [_player, _serve], playerTeam: 'winning', options: {_serve: ['first_serve', 'second_serve']}),
    'double_fault': PointEndingRule(requires: [_player, _serve], playerTeam: 'losing', options: {_serve: ['fault_net', 'fault_out', 'foot_fault']}),
    'penalty': PointEndingRule(),
  };

  String? _ending;
  final Map<String, String?> _values = {};

  @override
  void initState() {
    super.initState();
    final p = widget.initial;
    if (p != null && _fallback.containsKey(p.endingType)) {
      _ending = p.endingType;
      _values[_player] = p.primaryPlayerId;
      _values[_shot] = p.shotType;
      _values[_error] = p.errorType;
      _values[_serve] = p.serveOutcome;
    }
  }

  PointEndingRule? _rule(BuildContext context, String? ending) =>
      ending == null ? null : (context.enums.endingRule(ending) ?? _fallback[ending]);

  MatchTeam? get _winning => widget.match.teamOne?.id == widget.winningTeamId ? widget.match.teamOne : widget.match.teamTwo;
  MatchTeam? get _losing => widget.match.teamOne?.id == widget.winningTeamId ? widget.match.teamTwo : widget.match.teamOne;

  bool _complete(PointEndingRule? rule) =>
      rule != null && rule.requires.every((field) => (_values[field] ?? '').isNotEmpty);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final rule = _rule(context, _ending);
    final endings = context.enums.options(EnumGroup.pointEndingTypes).where((o) => _rule(context, o.value) != null).toList();
    final endingChoices = endings.isNotEmpty ? endings : [for (final e in _fallback.keys) EnumOption(e, EnumsService.humanize(e))];

    Widget chips(String title, List<EnumOption> options, String field) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap.md,
            Text(title, style: context.text.titleSmall),
            Gap.sm,
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (final o in options)
                  ChoiceChip(
                    label: Text(o.label),
                    selected: _values[field] == o.value,
                    onSelected: (on) => setState(() => _values[field] = on ? o.value : null),
                  ),
              ],
            ),
          ],
        );

    List<EnumOption> optionsFor(String group, String field) {
      final allowed = rule?.allowed(field) ?? const [];
      final all = context.enums.options(group);
      final source = all.isNotEmpty ? all : [for (final v in allowed) EnumOption(v, EnumsService.humanize(v))];
      return allowed.isEmpty ? source : source.where((o) => allowed.contains(o.value)).toList();
    }

    final playerTeam = rule?.playerTeam == 'winning' ? _winning : (rule?.playerTeam == 'losing' ? _losing : null);

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(AppSpacing.xl, 0, AppSpacing.xl, AppSpacing.xl + MediaQuery.viewInsetsOf(context).bottom),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('${l10n.scorekeeperPointTo}: ${_winning?.label ?? ''}', style: context.text.titleLarge),
            Text(l10n.scorekeeperReasonHelp, style: context.text.bodySmall),
            Gap.md,
            Text(l10n.scorekeeperEndingType, style: context.text.titleSmall),
            Gap.sm,
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                for (final o in endingChoices)
                  ChoiceChip(
                    label: Text(o.label),
                    selected: _ending == o.value,
                    onSelected: (on) => setState(() {
                      _ending = on ? o.value : null;
                      _values.clear(); // fields of the previous ending no longer apply
                    }),
                  ),
              ],
            ),
            if (playerTeam != null && rule!.requiresField(_player))
              chips(
                rule.playerTeam == 'winning' ? l10n.scorekeeperPlayerWinning : l10n.scorekeeperPlayerLosing,
                [for (final p in playerTeam.players) EnumOption(p.playerId, p.name)],
                _player,
              ),
            if (rule?.requiresField(_shot) ?? false) chips(l10n.scorekeeperShot, optionsFor(EnumGroup.shotTypes, _shot), _shot),
            if (rule?.requiresField(_error) ?? false) chips(l10n.scorekeeperError, optionsFor(EnumGroup.errorTypes, _error), _error),
            if (rule?.requiresField(_serve) ?? false) chips(l10n.scorekeeperServe, optionsFor(EnumGroup.serveOutcomes, _serve), _serve),
            Gap.xl,
            FilledButton(
              onPressed: !_complete(rule)
                  ? null
                  : () => Navigator.of(context).pop(PointInput(
                        winningTeamId: widget.winningTeamId,
                        endingType: _ending,
                        primaryPlayerId: rule!.requiresField(_player) ? _values[_player] : null,
                        shotType: rule.requiresField(_shot) ? _values[_shot] : null,
                        errorType: rule.requiresField(_error) ? _values[_error] : null,
                        serveOutcome: rule.requiresField(_serve) ? _values[_serve] : null,
                        recordedAt: widget.initial == null ? DateTime.now() : null,
                      )),
              child: Text(widget.initial == null ? l10n.scorekeeperRecordPoint : l10n.actionSave),
            ),
          ],
        ),
      ),
    );
  }
}
