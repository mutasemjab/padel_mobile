import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/models/player_summary.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/player_card.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../players/domain/usecases/player_insight_usecases.dart';
import '../../../tournaments/domain/entities/venue.dart';
import '../../domain/entities/casual_match.dart';
import '../bloc/casual_cubits.dart';

/// Creator edits the name, time and place. Changing the time or the place
/// notifies everyone in the match (server side).
Future<bool?> showEditCasualMatchSheet(BuildContext context, CasualMatch match) {
  final actions = context.read<CasualActionCubit>();
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider.value(value: actions),
        BlocProvider(create: (_) => sl<VenuesCubit>()..load()),
      ],
      child: _EditSheet(match: match),
    ),
  );
}

class _EditSheet extends StatefulWidget {
  final CasualMatch match;

  const _EditSheet({required this.match});

  @override
  State<_EditSheet> createState() => _EditSheetState();
}

class _EditSheetState extends State<_EditSheet> {
  late final _title = TextEditingController(text: widget.match.hasCustomTitle ? widget.match.title : '');
  late DateTime _when = widget.match.scheduledAt.toLocal();
  late int? _venueId = widget.match.venue?.id;
  late int? _courtId = widget.match.court?.id;
  bool _saving = false;

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  Future<void> _pickWhen() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      // Calendar only: no pencil, dates cannot be typed.
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: _when.isAfter(now) ? _when : now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 180)),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(_when));
    if (time == null) return;
    setState(() => _when = DateTime(date.year, date.month, date.day, time.hour, time.minute));
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context);
    if (!_when.isAfter(DateTime.now())) {
      showAppSnack(context, l10n.errorPickFutureDateTime);
      return;
    }
    setState(() => _saving = true);
    final ok = await context.read<CasualActionCubit>().updateMatch(widget.match.id, {
      'title': _title.text.trim().isEmpty ? null : _title.text.trim(),
      'scheduled_at': _when.toIso8601String(),
      'venue_id': _venueId,
      'court_id': _courtId,
    });
    if (!mounted) return;
    setState(() => _saving = false);
    if (ok) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(AppSpacing.xl, 0, AppSpacing.xl, MediaQuery.viewInsetsOf(context).bottom + AppSpacing.xl),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.casualEditMatch, style: context.text.titleLarge),
            Text(l10n.casualEditHint, style: context.text.bodySmall),
            Gap.lg,
            TextField(
              controller: _title,
              maxLength: 120,
              decoration: InputDecoration(labelText: l10n.casualMatchName, hintText: l10n.casualMatchNameHint),
            ),
            Gap.md,
            InkWell(
              onTap: _pickWhen,
              child: InputDecorator(
                decoration: InputDecoration(labelText: l10n.fieldDateTime, suffixIcon: const Icon(Icons.event_rounded)),
                child: Text(DateFormatter.matchTime(_when)),
              ),
            ),
            Gap.lg,
            BlocBuilder<VenuesCubit, PagedState<Venue>>(
              builder: (context, venues) {
                final venue = venues.items.where((v) => v.id == _venueId).firstOrNull;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DropdownButtonFormField<int?>(
                      key: ValueKey('venue-${venues.items.length}'),
                      initialValue: venues.items.any((v) => v.id == _venueId) ? _venueId : null,
                      isExpanded: true,
                      decoration: InputDecoration(labelText: l10n.fieldVenue),
                      items: [
                        DropdownMenuItem<int?>(value: null, child: Text(l10n.venueAny)),
                        for (final v in venues.items) DropdownMenuItem<int?>(value: v.id, child: Text(v.displayName)),
                      ],
                      onChanged: (id) => setState(() {
                        _venueId = id;
                        _courtId = null;
                      }),
                    ),
                    if (venue != null && venue.courts.isNotEmpty) ...[
                      Gap.lg,
                      DropdownButtonFormField<int?>(
                        key: ValueKey('court-$_venueId'),
                        initialValue: venue.courts.any((c) => c.id == _courtId) ? _courtId : null,
                        decoration: InputDecoration(labelText: l10n.fieldCourt),
                        items: [
                          DropdownMenuItem<int?>(value: null, child: Text(l10n.courtAny)),
                          for (final c in venue.courts) DropdownMenuItem<int?>(value: c.id, child: Text(c.name)),
                        ],
                        onChanged: (id) => setState(() => _courtId = id),
                      ),
                    ],
                  ],
                );
              },
            ),
            Gap.xl,
            FilledButton(
              onPressed: _saving ? null : _save,
              child: _saving ? const ButtonSpinner() : Text(l10n.actionSave),
            ),
          ],
        ),
      ),
    );
  }
}

/// Creator searches a player by name or player ID and invites them.
Future<void> showInvitePlayerSheet(BuildContext context, CasualMatch match) {
  final actions = context.read<CasualActionCubit>();
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => BlocProvider.value(value: actions, child: _InviteSheet(match: match)),
  );
}

class _InviteSheet extends StatefulWidget {
  final CasualMatch match;

  const _InviteSheet({required this.match});

  @override
  State<_InviteSheet> createState() => _InviteSheetState();
}

class _InviteSheetState extends State<_InviteSheet> {
  final _query = TextEditingController();
  Timer? _debounce;
  List<PlayerSummary> _results = const [];
  bool _loading = false;
  final Set<String> _invited = {};

  @override
  void dispose() {
    _debounce?.cancel();
    _query.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () => _search(value.trim()));
  }

  Future<void> _search(String q) async {
    if (q.length < 2) {
      setState(() => _results = const []);
      return;
    }
    setState(() => _loading = true);
    final result = await sl<SearchPlayersUseCase>()(q: q);
    if (!mounted) return;
    final taken = {
      widget.match.creator.playerId,
      for (final p in widget.match.participants)
        if (p.player != null && p.status != ParticipantStatus.declined) p.player!.playerId,
    };
    setState(() {
      _loading = false;
      _results = result.match((_) => const <PlayerSummary>[], (page) => page.items.where((p) => !taken.contains(p.playerId)).toList());
    });
  }

  Future<void> _invite(PlayerSummary player) async {
    final l10n = AppLocalizations.of(context);
    final ok = await context.read<CasualActionCubit>().invitePlayer(widget.match.id, player.playerId);
    if (!mounted) return;
    if (ok) {
      setState(() => _invited.add(player.playerId));
      showAppSnack(context, l10n.casualInvitationSent, icon: Icons.check_circle_rounded);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(AppSpacing.xl, 0, AppSpacing.xl, MediaQuery.viewInsetsOf(context).bottom + AppSpacing.xl),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.casualInvitePlayer, style: context.text.titleLarge),
            Gap.md,
            TextField(
              controller: _query,
              autofocus: true,
              onChanged: _onChanged,
              decoration: InputDecoration(prefixIcon: const Icon(Icons.search_rounded), hintText: l10n.casualInviteSearchHint),
            ),
            Gap.md,
            if (_loading) const LinearProgressIndicator(),
            Expanded(
              child: ListView.separated(
                itemCount: _results.length,
                separatorBuilder: (_, _) => Gap.sm,
                itemBuilder: (context, i) {
                  final p = _results[i];
                  final done = _invited.contains(p.playerId);
                  return PlayerCard(
                    player: p,
                    dense: true,
                    trailing: done
                        ? const Icon(Icons.check_circle_rounded)
                        : FilledButton(onPressed: () => _invite(p), child: Text(l10n.casualInvite)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
