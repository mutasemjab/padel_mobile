import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/court_lines.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../auth/domain/entities/auth_session.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../coaches/domain/entities/booking.dart';
import '../../../coaches/domain/entities/coach.dart';
import '../../../coaches/presentation/widgets/booking_tile.dart';
import '../../../coaches/presentation/widgets/coach_card.dart';
import '../../domain/repositories/coach_portal_repository.dart';
import '../bloc/coach_portal_cubits.dart';

/// Coach Portal home for `coach` / `player_coach` accounts.
class CoachPortalPage extends StatefulWidget {
  const CoachPortalPage({super.key});

  @override
  State<CoachPortalPage> createState() => _CoachPortalPageState();
}

class _CoachPortalPageState extends State<CoachPortalPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final accountType = context.select<AuthBloc, AccountType?>(
      (b) => b.state is AuthAuthenticated ? (b.state as AuthAuthenticated).accountType : null,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<CoachProfileCubit>()..load()),
        BlocProvider(create: (_) => sl<CoachPortalActionCubit>()),
      ],
      child: BlocListener<CoachPortalActionCubit, ActionState>(
        listener: (context, state) {
          if (state is ActionFailure) showFailure(context, state.failure);
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(l10n.coachPortalTitle),
            actions: [
              if (accountType == AccountType.playerCoach)
                TextButton.icon(
                  onPressed: () => context.go(AppRoutes.home),
                  icon: const Icon(Icons.sports_tennis_rounded),
                  label: Text(l10n.coachPortalSwitchToPlayer),
                ),
              IconButton(
                tooltip: l10n.coachPortalProfile,
                icon: const Icon(Icons.badge_rounded),
                onPressed: () => context.push(AppRoutes.coachProfileEdit),
              ),
              IconButton(
                tooltip: l10n.settingsTitle,
                icon: const Icon(Icons.settings_rounded),
                onPressed: () => context.push(AppRoutes.settings),
              ),
            ],
          ),
          body: IndexedStack(
            index: _index,
            children: const [_Dashboard(), CoachAvailabilityView(), CoachBookingsView()],
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _index,
            onDestinationSelected: (i) => setState(() => _index = i),
            destinations: [
              NavigationDestination(icon: const Icon(Icons.space_dashboard_outlined), selectedIcon: const Icon(Icons.space_dashboard_rounded), label: l10n.navHome),
              NavigationDestination(icon: const Icon(Icons.calendar_month_outlined), selectedIcon: const Icon(Icons.calendar_month_rounded), label: l10n.coachPortalAvailability),
              NavigationDestination(icon: const Icon(Icons.inbox_outlined), selectedIcon: const Icon(Icons.inbox_rounded), label: l10n.coachPortalBookings),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dashboard extends StatelessWidget {
  const _Dashboard();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CoachBookingsCubit(sl(), status: 'pending')..load()),
      ],
      child: RefreshIndicator(
        onRefresh: () async {
          await context.read<CoachProfileCubit>().refresh();
        },
        child: ListView(
          padding: AppSpacing.page,
          children: [
            BlocBuilder<CoachProfileCubit, ViewState<Coach>>(
              builder: (context, state) => ViewStateView<Coach>(
                state: state,
                loading: const ShimmerBox(height: 140, borderRadius: AppRadius.xlAll),
                onRetry: () => context.read<CoachProfileCubit>().load(),
                builder: (context, coach) => _CoachHeader(coach: coach),
              ),
            ),
            Gap.xxl,
            SectionHeader(title: l10n.coachPortalPending),
            Gap.md,
            const _PendingList(),
            Gap.xxl,
            SectionHeader(title: l10n.coachPortalToday),
            Gap.md,
            BlocProvider(
              create: (_) => CoachBookingsCubit(sl(), status: 'confirmed', scope: 'upcoming')..load(),
              child: const _BookingPreview(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CoachHeader extends StatelessWidget {
  final Coach coach;

  const _CoachHeader({required this.coach});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppGradients.training, borderRadius: AppRadius.xlAll),
      clipBehavior: Clip.antiAlias,
      child: CourtLinesBackground(
        child: Padding(
          padding: AppSpacing.card,
          child: Row(
            children: [
              PlayerAvatar(name: coach.name, photoUrl: coach.photoUrl, size: AppSizes.avatarLg, showRing: false),
              Gap.lg,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(coach.name, style: context.text.headlineMedium?.copyWith(color: AppColors.white)),
                    Gap.xs,
                    CoachRatingBadge(rating: coach.rating),
                    if (coach.location != null)
                      Text(coach.location!, style: context.text.bodySmall?.copyWith(color: AppColors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PendingList extends StatelessWidget {
  const _PendingList();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocBuilder<CoachBookingsCubit, PagedState<Booking>>(
      builder: (context, state) {
        if (state.isFirstLoad) return const PlayerCardSkeleton();
        if (state.items.isEmpty) return Text(l10n.myBookingsEmpty, style: context.text.bodySmall);
        return Column(
          children: [
            for (final b in state.items.take(5)) ...[
              CoachBookingCard(booking: b, onChanged: () => context.read<CoachBookingsCubit>().refresh()),
              Gap.sm,
            ],
          ],
        );
      },
    );
  }
}

class _BookingPreview extends StatelessWidget {
  const _BookingPreview();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocBuilder<CoachBookingsCubit, PagedState<Booking>>(
      builder: (context, state) {
        if (state.isFirstLoad) return const PlayerCardSkeleton();
        if (state.items.isEmpty) return Text(l10n.myBookingsEmpty, style: context.text.bodySmall);
        return Column(
          children: [
            for (final b in state.items.take(5)) ...[
              CoachBookingCard(booking: b, onChanged: () => context.read<CoachBookingsCubit>().refresh()),
              Gap.sm,
            ],
          ],
        );
      },
    );
  }
}

/// Week calendar of slots with add (optionally repeating), toggle, delete.
class CoachAvailabilityView extends StatelessWidget {
  const CoachAvailabilityView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => sl<CoachSlotsCubit>()..load(),
      child: Builder(
        builder: (context) {
          final slots = context.read<CoachSlotsCubit>();
          return Scaffold(
            floatingActionButton: FloatingActionButton.extended(
              heroTag: 'add-slots',
              backgroundColor: AppColors.info,
              foregroundColor: AppColors.white,
              onPressed: () async {
                if (await showAddSlotsSheet(context) == true) slots.load();
              },
              icon: const Icon(Icons.add_rounded),
              label: Text(l10n.slotAdd),
            ),
            body: BlocBuilder<CoachSlotsCubit, ViewState<List<AvailabilitySlot>>>(
              builder: (context, state) {
                final start = slots.weekStart;
                return Column(
                  children: [
                    Padding(
                      padding: AppSpacing.pageH,
                      child: Row(
                        children: [
                          IconButton(onPressed: () => slots.shiftWeek(-1), icon: const Icon(Icons.chevron_left_rounded)),
                          Expanded(
                            child: Text(
                              DateFormatter.dateRange(start, start.add(const Duration(days: 6))),
                              textAlign: TextAlign.center,
                              style: context.text.titleMedium,
                            ),
                          ),
                          IconButton(onPressed: () => slots.shiftWeek(1), icon: const Icon(Icons.chevron_right_rounded)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ViewStateView<List<AvailabilitySlot>>(
                        state: state,
                        onRetry: slots.load,
                        builder: (context, items) => ListView(
                          padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.gutter, 0, AppSpacing.gutter, 96),
                          children: [
                            for (var d = 0; d < 7; d++) _DayBlock(day: start.add(Duration(days: d)), slots: items),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _DayBlock extends StatelessWidget {
  final DateTime day;
  final List<AvailabilitySlot> slots;

  const _DayBlock({required this.day, required this.slots});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final mine = slots
        .where((s) => s.date.year == day.year && s.date.month == day.month && s.date.day == day.day)
        .toList()
      ..sort((a, b) => a.startTime.compareTo(b.startTime));
    final actions = context.read<CoachPortalActionCubit>();
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(DateFormatter.weekdayDay(day).toUpperCase(), style: AppTypography.eyebrow(context)),
          Gap.sm,
          if (mine.isEmpty) Text(l10n.slotsEmptyDay, style: context.text.bodySmall),
          for (final s in mine)
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.sm),
              child: AppCard(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
                child: Row(
                  children: [
                    Text('${s.startTime} – ${s.endTime}', style: AppTypography.number(context, size: 18), textDirection: TextDirection.ltr),
                    Gap.md,
                    if (s.status == SlotStatus.booked)
                      Text(l10n.slotBooked, style: context.text.labelMedium?.copyWith(color: AppColors.info)),
                    const Spacer(),
                    if (s.status != SlotStatus.booked) ...[
                      Switch(
                        value: s.isActive,
                        onChanged: (_) async {
                          if (await actions.toggleSlot(s) && context.mounted) context.read<CoachSlotsCubit>().refresh();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline_rounded),
                        onPressed: () async {
                          final ok = await confirmAction(
                            context,
                            title: l10n.slotDeleteConfirm,
                            message: '${s.startTime} – ${s.endTime}',
                            confirmLabel: l10n.actionDelete,
                            cancelLabel: l10n.actionBack,
                            destructive: true,
                          );
                          if (ok && await actions.removeSlot(s.id) && context.mounted) {
                            context.read<CoachSlotsCubit>().refresh();
                          }
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Future<bool?> showAddSlotsSheet(BuildContext context) {
  final actions = context.read<CoachPortalActionCubit>();
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => BlocProvider.value(value: actions, child: const _AddSlotsSheet()),
  );
}

class _AddSlotsSheet extends StatefulWidget {
  const _AddSlotsSheet();

  @override
  State<_AddSlotsSheet> createState() => _AddSlotsSheetState();
}

class _AddSlotsSheetState extends State<_AddSlotsSheet> {
  DateTime _date = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _start = const TimeOfDay(hour: 10, minute: 0);
  TimeOfDay _end = const TimeOfDay(hour: 11, minute: 0);
  int _repeat = 0;
  bool _active = true;

  String _fmt(TimeOfDay t) => '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    Widget field(String label, String value, VoidCallback onTap) => InkWell(
          onTap: onTap,
          borderRadius: AppRadius.mdAll,
          child: InputDecorator(decoration: InputDecoration(labelText: label), child: Text(value)),
        );
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(AppSpacing.xl, 0, AppSpacing.xl, AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.slotAdd, style: context.text.titleLarge),
          Gap.lg,
          field(l10n.slotDate, DateFormatter.fullDate(_date), () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: _date,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
            );
            if (picked != null) setState(() => _date = picked);
          }),
          Gap.md,
          Row(
            children: [
              Expanded(
                child: field(l10n.slotStart, _fmt(_start), () async {
                  final t = await showTimePicker(context: context, initialTime: _start);
                  if (t != null) setState(() => _start = t);
                }),
              ),
              Gap.md,
              Expanded(
                child: field(l10n.slotEnd, _fmt(_end), () async {
                  final t = await showTimePicker(context: context, initialTime: _end);
                  if (t != null) setState(() => _end = t);
                }),
              ),
            ],
          ),
          Gap.lg,
          Text('${l10n.slotRepeat} · ${l10n.slotRepeatWeeks(_repeat)}', style: context.text.bodyMedium),
          Slider(value: _repeat.toDouble(), max: 12, divisions: 12, onChanged: (v) => setState(() => _repeat = v.round())),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.slotActive),
            value: _active,
            onChanged: (v) => setState(() => _active = v),
          ),
          Gap.lg,
          BlocBuilder<CoachPortalActionCubit, ActionState>(
            builder: (context, state) => FilledButton(
              onPressed: state is ActionInProgress
                  ? null
                  : () async {
                      final ok = await context.read<CoachPortalActionCubit>().addSlots(
                            date: _date,
                            startTime: _fmt(_start),
                            endTime: _fmt(_end),
                            isActive: _active,
                            repeatWeeks: _repeat,
                          );
                      if (ok && context.mounted) {
                        Navigator.of(context).pop(true);
                        showAppSnack(context, l10n.slotsCreated);
                      }
                    },
              child: state is ActionInProgress ? const ButtonSpinner() : Text(l10n.actionSave),
            ),
          ),
        ],
      ),
    );
  }
}

/// Booking inbox with status filters.
class CoachBookingsView extends StatelessWidget {
  const CoachBookingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => CoachBookingsCubit(sl())..load(),
      child: BlocBuilder<CoachBookingsCubit, PagedState<Booking>>(
        builder: (context, state) {
          final cubit = context.read<CoachBookingsCubit>();
          final statuses = context.enums.options(EnumGroup.bookingStatuses);
          return Column(
            children: [
              Gap.sm,
              SizedBox(
                height: AppSizes.chipHeight + 8,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: AppSpacing.pageH,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                      child: ChoiceChip(label: Text(l10n.filterAll), selected: cubit.status == null, onSelected: (_) => cubit.filter(null)),
                    ),
                    for (final s in statuses)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                        child: ChoiceChip(label: Text(s.label), selected: cubit.status == s.value, onSelected: (_) => cubit.filter(s.value)),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: PagedStateView<Booking>(
                  state: state,
                  onLoadMore: cubit.loadMore,
                  onRefresh: cubit.refresh,
                  onRetry: cubit.load,
                  empty: EmptyState(icon: Icons.inbox_rounded, title: l10n.myBookingsEmpty, message: '', accent: AppColors.info),
                  itemBuilder: (context, b, _) => CoachBookingCard(booking: b, onChanged: cubit.refresh),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// A booking from the coach's side with the actions its status allows.
class CoachBookingCard extends StatelessWidget {
  final Booking booking;
  final VoidCallback onChanged;

  const CoachBookingCard({super.key, required this.booking, required this.onChanged});

  Future<void> _act(BuildContext context, CoachBookingAction action, {String? prompt}) async {
    final l10n = AppLocalizations.of(context);
    String? text;
    if (prompt != null) {
      text = await _prompt(context, prompt);
      if (text == null) return;
    }
    if (!context.mounted) return;
    if (await context.read<CoachPortalActionCubit>().act(booking.id, action, text: text) && context.mounted) {
      showAppSnack(context, l10n.bookingUpdated);
      onChanged();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final b = booking;
    final player = b.player;
    return Column(
      children: [
        BookingTile(
          booking: b,
          showPlayer: true,
          onTap: player == null ? null : () => context.push(AppRoutes.coachPlayerProgress(player.playerId)),
          trailing: PopupMenuButton<String>(
            onSelected: (v) {
              switch (v) {
                case 'confirm':
                  _act(context, CoachBookingAction.confirm);
                case 'reject':
                  _act(context, CoachBookingAction.reject, prompt: l10n.bookingReasonOptional);
                case 'cancel':
                  _act(context, CoachBookingAction.cancel, prompt: l10n.bookingReasonOptional);
                case 'complete':
                  _act(context, CoachBookingAction.complete, prompt: l10n.bookingFeedbackHint);
                case 'feedback':
                  _act(context, CoachBookingAction.feedback, prompt: l10n.bookingFeedbackHint);
                case 'progress':
                  showProgressSheet(context, booking: b, onSaved: onChanged);
              }
            },
            itemBuilder: (_) => [
              if (b.status == BookingStatus.pending) ...[
                PopupMenuItem(value: 'confirm', child: Text(l10n.bookingConfirmAction)),
                PopupMenuItem(value: 'reject', child: Text(l10n.bookingRejectAction)),
              ],
              if (b.status == BookingStatus.confirmed) ...[
                PopupMenuItem(value: 'complete', child: Text(l10n.bookingCompleteAction)),
                PopupMenuItem(value: 'cancel', child: Text(l10n.bookingCancel)),
              ],
              if (b.status == BookingStatus.completed || b.status == BookingStatus.confirmed) ...[
                PopupMenuItem(value: 'feedback', child: Text(l10n.bookingFeedbackAction)),
                PopupMenuItem(value: 'progress', child: Text(l10n.bookingProgressAction)),
              ],
            ],
          ),
        ),
        if (b.status == BookingStatus.pending) ...[
          Gap.xs,
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _act(context, CoachBookingAction.reject, prompt: l10n.bookingReasonOptional),
                  child: Text(l10n.bookingRejectAction),
                ),
              ),
              Gap.sm,
              Expanded(
                child: FilledButton(
                  onPressed: () => _act(context, CoachBookingAction.confirm),
                  child: Text(l10n.bookingConfirmAction),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

Future<String?> _prompt(BuildContext context, String label) async {
  final l10n = AppLocalizations.of(context);
  final controller = TextEditingController();
  final result = await showDialog<String>(
    context: context,
    builder: (dialog) => AlertDialog(
      content: TextField(controller: controller, maxLines: 3, decoration: InputDecoration(labelText: label)),
      actions: [
        TextButton(onPressed: () => Navigator.of(dialog).pop(), child: Text(l10n.actionBack)),
        FilledButton(onPressed: () => Navigator.of(dialog).pop(controller.text.trim()), child: Text(l10n.actionConfirm)),
      ],
    ),
  );
  controller.dispose();
  return result;
}

/// Record per-skill scores (1–10) after a session.
Future<void> showProgressSheet(BuildContext context, {required Booking booking, required VoidCallback onSaved}) {
  final actions = context.read<CoachPortalActionCubit>();
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => BlocProvider.value(value: actions, child: _ProgressSheet(booking: booking, onSaved: onSaved)),
  );
}

class _ProgressSheet extends StatefulWidget {
  final Booking booking;
  final VoidCallback onSaved;

  const _ProgressSheet({required this.booking, required this.onSaved});

  @override
  State<_ProgressSheet> createState() => _ProgressSheetState();
}

class _ProgressSheetState extends State<_ProgressSheet> {
  final Map<String, int> _scores = {};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final skills = context.enums.options(EnumGroup.trainingSkills);
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.xl, 0, AppSpacing.xl, AppSpacing.xl),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.bookingProgressAction, style: context.text.titleLarge),
          Gap.md,
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                for (final s in skills)
                  Row(
                    children: [
                      Checkbox(
                        value: _scores.containsKey(s.value),
                        onChanged: (on) => setState(() => on == true ? _scores[s.value] = 5 : _scores.remove(s.value)),
                      ),
                      SizedBox(width: 96, child: Text(s.label, style: context.text.bodySmall)),
                      Expanded(
                        child: Slider(
                          value: (_scores[s.value] ?? 5).toDouble(),
                          min: 1,
                          max: 10,
                          divisions: 9,
                          label: '${_scores[s.value] ?? 5}',
                          onChanged: _scores.containsKey(s.value) ? (v) => setState(() => _scores[s.value] = v.round()) : null,
                        ),
                      ),
                      SizedBox(
                        width: 28,
                        child: Text(
                          _scores.containsKey(s.value) ? '${_scores[s.value]}' : '',
                          style: AppTypography.number(context, size: 15, color: context.tokens.highlight),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          Gap.lg,
          FilledButton(
            onPressed: _scores.isEmpty
                ? null
                : () async {
                    final ok = await context.read<CoachPortalActionCubit>().saveProgress(
                          widget.booking.id,
                          [for (final e in _scores.entries) ProgressEntryInput(skill: e.key, score: e.value)],
                        );
                    if (ok && context.mounted) {
                      Navigator.of(context).pop();
                      showAppSnack(context, l10n.progressSaved);
                      widget.onSaved();
                    }
                  },
            child: Text(l10n.actionSave),
          ),
        ],
      ),
    );
  }
}
