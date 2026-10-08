import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../tournaments/domain/entities/venue.dart';
import '../../domain/entities/casual_match.dart';
import '../bloc/casual_cubits.dart';
import '../bloc/casual_matches_bloc.dart';
import '../bloc/casual_matches_event.dart';
import '../bloc/create_casual_match_cubit.dart';

/// Quick-create sheet. Venue and court come from `GET venues`; every enum
/// (type, level, side) is labelled from `meta/enums`. Refreshes the board
/// on success.
Future<void> showCreateCasualMatchSheet(BuildContext context) {
  final bloc = context.read<CasualMatchesBloc>();
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => MultiBlocProvider(
      providers: [
        BlocProvider.value(value: bloc),
        BlocProvider(create: (_) => sl<CreateCasualMatchCubit>()),
        BlocProvider(create: (_) => sl<VenuesCubit>()..load()),
      ],
      child: const _CreateSheet(),
    ),
  );
}

class _CreateSheet extends StatefulWidget {
  const _CreateSheet();

  @override
  State<_CreateSheet> createState() => _CreateSheetState();
}

class _CreateSheetState extends State<_CreateSheet> {
  final _notes = TextEditingController();
  final _title = TextEditingController();
  CasualMatchType _type = CasualMatchType.lookingForMatch;
  DateTime? _when;
  String? _level;
  String? _side;
  Venue? _venue;
  Court? _court;
  String? _whenError;

  @override
  void dispose() {
    _notes.dispose();
    _title.dispose();
    super.dispose();
  }

  Future<void> _pickWhen() async {
    final now = DateTime.now();
    final initial = _when ?? now.add(const Duration(hours: 2));
    final date = await showDatePicker(
      context: context,
      // Calendar only: no pencil, dates cannot be typed.
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      initialDate: initial,
      firstDate: now,
      lastDate: now.add(const Duration(days: 180)),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(initial));
    if (time == null) return;
    setState(() {
      _when = DateTime(date.year, date.month, date.day, time.hour, time.minute);
      _whenError = null;
    });
  }

  void _submit() {
    if (_when == null || !_when!.isAfter(DateTime.now())) {
      setState(() => _whenError = AppLocalizations.of(context).errorPickFutureDateTime);
      return;
    }
    context.read<CreateCasualMatchCubit>().submit(
          title: _title.text.trim().isEmpty ? null : _title.text.trim(),
          venueId: _venue?.id,
          courtId: _court?.id,
          matchType: _type.apiValue,
          scheduledAt: _when!,
          requiredLevel: _level,
          preferredSide: _side,
          notes: _notes.text.trim().isEmpty ? null : _notes.text.trim(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final enums = context.enums;
    return BlocConsumer<CreateCasualMatchCubit, CreateCasualMatchState>(
      listener: (context, state) {
        if (state is CreateCasualMatchSuccess) {
          context.read<CasualMatchesBloc>().add(const CasualMatchesEvent.refreshed());
          Navigator.of(context).pop();
        } else if (state is CreateCasualMatchFailure && state.failure is! ValidationFailure) {
          showFailure(context, state.failure);
        }
      },
      builder: (context, state) {
        final busy = state is CreateCasualMatchSubmitting;
        final validation = state is CreateCasualMatchFailure && state.failure is ValidationFailure
            ? state.failure as ValidationFailure
            : null;
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            AppSpacing.xl,
            0,
            AppSpacing.xl,
            MediaQuery.viewInsetsOf(context).bottom + AppSpacing.xl,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(l10n.createMatchTitle, style: context.text.titleLarge),
                Gap.xs,
                Text(l10n.casualNote, style: context.text.bodySmall),
                Gap.lg,
                TextField(
                  controller: _title,
                  maxLength: 120,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: l10n.casualMatchName,
                    hintText: l10n.casualMatchNameHint,
                    errorText: validation?.firstErrorFor('title'),
                  ),
                ),
                Gap.md,
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    for (final t in CasualMatchType.values)
                      ChoiceChip(
                        label: Text(enums.label(EnumGroup.casualMatchTypes, t.apiValue)),
                        selected: _type == t,
                        selectedColor: AppColors.clay,
                        onSelected: (_) => setState(() => _type = t),
                      ),
                  ],
                ),
                Gap.lg,
                InkWell(
                  onTap: _pickWhen,
                  borderRadius: AppRadius.mdAll,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: l10n.fieldDateTime,
                      errorText: _whenError ?? validation?.firstErrorFor('scheduled_at'),
                      suffixIcon: const Icon(Icons.event_rounded),
                    ),
                    child: Text(_when == null ? l10n.selectFutureDateTime : DateFormatter.matchTime(_when!)),
                  ),
                ),
                Gap.lg,
                BlocBuilder<VenuesCubit, PagedState<Venue>>(
                  builder: (context, venues) => DropdownButtonFormField<int?>(
                    initialValue: _venue?.id,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: l10n.fieldVenue,
                      errorText: validation?.firstErrorFor('venue_id'),
                    ),
                    items: [
                      DropdownMenuItem<int?>(value: null, child: Text(l10n.venueAny)),
                      for (final v in venues.items) DropdownMenuItem<int?>(value: v.id, child: Text(v.displayName)),
                    ],
                    onChanged: (id) => setState(() {
                      _venue = venues.items.where((v) => v.id == id).firstOrNull;
                      _court = null;
                    }),
                  ),
                ),
                if (_venue != null && _venue!.courts.isNotEmpty) ...[
                  Gap.lg,
                  DropdownButtonFormField<int?>(
                    key: ValueKey(_venue!.id),
                    initialValue: _court?.id,
                    decoration: InputDecoration(labelText: l10n.fieldCourt, errorText: validation?.firstErrorFor('court_id')),
                    items: [
                      DropdownMenuItem<int?>(value: null, child: Text(l10n.courtAny)),
                      for (final c in _venue!.courts) DropdownMenuItem<int?>(value: c.id, child: Text(c.name)),
                    ],
                    onChanged: (id) => setState(() => _court = _venue!.courts.where((c) => c.id == id).firstOrNull),
                  ),
                ],
                Gap.lg,
                Row(
                  children: [
                    Expanded(
                      child: _Picker(
                        label: l10n.fieldRequiredLevelOptional,
                        group: EnumGroup.playerLevels,
                        value: _level,
                        error: validation?.firstErrorFor('required_level'),
                        onChanged: (v) => setState(() => _level = v),
                      ),
                    ),
                    Gap.md,
                    Expanded(
                      child: _Picker(
                        label: l10n.fieldPreferredSideOptional,
                        group: EnumGroup.playerSides,
                        value: _side,
                        error: validation?.firstErrorFor('preferred_side'),
                        onChanged: (v) => setState(() => _side = v),
                      ),
                    ),
                  ],
                ),
                Gap.lg,
                TextField(
                  controller: _notes,
                  maxLines: 3,
                  decoration: InputDecoration(labelText: l10n.fieldNotesOptional, errorText: validation?.firstErrorFor('notes')),
                ),
                Gap.xl,
                FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: AppColors.clay, foregroundColor: AppColors.white),
                  onPressed: busy ? null : _submit,
                  child: busy ? const ButtonSpinner() : Text(l10n.actionCreateMatch),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Picker extends StatelessWidget {
  final String label;
  final String group;
  final String? value;
  final String? error;
  final ValueChanged<String?> onChanged;

  const _Picker({required this.label, required this.group, required this.value, required this.onChanged, this.error});

  @override
  Widget build(BuildContext context) {
    final options = context.enums.options(group);
    return DropdownButtonFormField<String?>(
      initialValue: value,
      isExpanded: true,
      decoration: InputDecoration(labelText: label, errorText: error),
      items: [
        DropdownMenuItem<String?>(value: null, child: Text(AppLocalizations.of(context).filterAll)),
        for (final o in options) DropdownMenuItem<String?>(value: o.value, child: Text(o.label)),
      ],
      onChanged: onChanged,
    );
  }
}
