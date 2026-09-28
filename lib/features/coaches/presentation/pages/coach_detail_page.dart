import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
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
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/coach.dart';
import '../bloc/coaches_cubits.dart';
import '../widgets/coach_card.dart';

/// Coach service page: header, rating (or "New coach"), facts, 14-day slot
/// browser, reviews, and a sticky Book CTA.
class CoachDetailPage extends StatefulWidget {
  final int coachId;

  const CoachDetailPage({super.key, required this.coachId});

  @override
  State<CoachDetailPage> createState() => _CoachDetailPageState();
}

class _CoachDetailPageState extends State<CoachDetailPage> {
  AvailabilitySlot? _selected;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CoachDetailCubit(getCoachDetail: sl(), coachId: widget.coachId)..load()),
        BlocProvider(create: (_) => CoachAvailabilityCubit(sl(), widget.coachId)..load()),
        BlocProvider(create: (_) => CoachReviewsCubit(sl(), widget.coachId)..load()),
      ],
      child: BlocBuilder<CoachDetailCubit, ViewState<Coach>>(
        builder: (context, state) => Scaffold(
          body: ViewStateView<Coach>(
            state: state,
            loading: const _Skeleton(),
            onRetry: () => context.read<CoachDetailCubit>().load(),
            builder: (context, coach) => _Content(
              coach: coach,
              selected: _selected,
              onSelect: (slot) => setState(() => _selected = slot),
            ),
          ),
          bottomNavigationBar: switch (state) {
            ViewLoaded(:final data) => _BookBar(
                coach: data,
                selected: _selected,
                onBooked: () {
                  setState(() => _selected = null);
                  context.read<CoachAvailabilityCubit>().load();
                },
              ),
            _ => null,
          },
        ),
      ),
    );
  }
}

class _Skeleton extends StatelessWidget {
  const _Skeleton();

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        children: const [
          ShimmerBox(height: AppSizes.heroHeight, borderRadius: BorderRadius.zero),
          Padding(padding: AppSpacing.page, child: PlayerCardSkeleton()),
        ],
      );
}

class _Content extends StatelessWidget {
  final Coach coach;
  final AvailabilitySlot? selected;
  final ValueChanged<AvailabilitySlot> onSelect;

  const _Content({required this.coach, required this.selected, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final enums = context.enums;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: AppSizes.heroHeight,
          foregroundColor: AppColors.white,
          backgroundColor: context.tokens.background,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              fit: StackFit.expand,
              children: [
                Hero(
                  tag: 'coach-image-${coach.id}',
                  child: AppNetworkImage(
                    url: coach.photoUrl,
                    fallback: const DecoratedBox(decoration: BoxDecoration(gradient: AppGradients.training)),
                  ),
                ),
                const DecoratedBox(decoration: BoxDecoration(gradient: AppGradients.imageScrim)),
                PositionedDirectional(
                  start: AppSpacing.gutter,
                  end: AppSpacing.gutter,
                  bottom: AppSpacing.lg,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(coach.name, style: context.text.displaySmall?.copyWith(color: AppColors.white)),
                      Gap.xs,
                      CoachRatingBadge(rating: coach.rating, large: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: AppSpacing.page,
          sliver: SliverList.list(
            children: [
              _FactsRow(coach: coach),
              if (coach.bio != null && coach.bio!.isNotEmpty) ...[
                Gap.xl,
                Text(l10n.sectionAbout, style: context.text.titleLarge),
                Gap.sm,
                Text(coach.bio!, style: context.text.bodyMedium),
              ],
              if (coach.specialties.isNotEmpty) ...[
                Gap.xl,
                Text(l10n.sectionSpecialties, style: context.text.titleMedium),
                Gap.sm,
                _Chips(labels: coach.specialties.map((s) => enums.label(EnumGroup.trainingSkills, s)).toList()),
              ],
              if (coach.trainingTypes.isNotEmpty) ...[
                Gap.lg,
                Text(l10n.coachTrainingTypes, style: context.text.titleMedium),
                Gap.sm,
                _Chips(labels: coach.trainingTypes.map((s) => enums.label(EnumGroup.trainingTypes, s)).toList()),
              ],
              Gap.xxl,
              SectionHeader(title: l10n.coachAvailability),
              Gap.md,
              _AvailabilityBrowser(selected: selected, onSelect: onSelect),
              Gap.xxl,
              SectionHeader(title: l10n.coachReviews),
              Gap.md,
              const _Reviews(),
              Gap.huge,
            ],
          ),
        ),
      ],
    );
  }
}

class _FactsRow extends StatelessWidget {
  final Coach coach;

  const _FactsRow({required this.coach});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    Widget fact(IconData icon, String label, String value) => Expanded(
          child: AppCard(
            padding: AppSpacing.cardDense,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: AppColors.info, size: AppSizes.iconMd),
                Gap.xs,
                Text(value, style: AppTypography.number(context, size: 18), maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(label, style: context.text.labelSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
        );
    return Column(
      children: [
        Row(
          children: [
            fact(Icons.payments_rounded, l10n.bookingPrice, l10n.coachPerHour(Formatters.money(coach.pricePerHour, coach.currency))),
            Gap.sm,
            fact(
              Icons.workspace_premium_rounded,
              l10n.coachExperience,
              coach.yearsExperience == null ? l10n.valueDash : l10n.coachYearsExperience(coach.yearsExperience!),
            ),
          ],
        ),
        Gap.sm,
        Row(
          children: [
            fact(Icons.place_rounded, l10n.bookingLocation, coach.location ?? l10n.valueDash),
            Gap.sm,
            fact(Icons.translate_rounded, l10n.coachLanguages, coach.languages.isEmpty ? l10n.valueDash : coach.languages.join(', ')),
          ],
        ),
      ],
    );
  }
}

class _Chips extends StatelessWidget {
  final List<String> labels;

  const _Chips({required this.labels});

  @override
  Widget build(BuildContext context) => Wrap(
        spacing: AppSpacing.sm,
        runSpacing: AppSpacing.sm,
        children: [for (final l in labels) Chip(label: Text(l))],
      );
}

class _AvailabilityBrowser extends StatefulWidget {
  final AvailabilitySlot? selected;
  final ValueChanged<AvailabilitySlot> onSelect;

  const _AvailabilityBrowser({required this.selected, required this.onSelect});

  @override
  State<_AvailabilityBrowser> createState() => _AvailabilityBrowserState();
}

class _AvailabilityBrowserState extends State<_AvailabilityBrowser> {
  int _dayIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    return BlocBuilder<CoachAvailabilityCubit, ViewState<List<AvailabilityDay>>>(
      builder: (context, state) => ViewStateView<List<AvailabilityDay>>(
        state: state,
        loading: const ShimmerBox(height: 140, borderRadius: AppRadius.lgAll),
        onRetry: () => context.read<CoachAvailabilityCubit>().load(),
        builder: (context, days) {
          if (days.isEmpty) return Text(l10n.coachNoSlots, style: context.text.bodySmall);
          final index = _dayIndex.clamp(0, days.length - 1);
          final slots = days[index].slots.where((s) => s.isBookable).toList();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 76,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: days.length,
                  separatorBuilder: (_, _) => Gap.sm,
                  itemBuilder: (context, i) {
                    final d = days[i];
                    final open = d.slots.where((s) => s.isBookable).length;
                    final sel = i == index;
                    return InkWell(
                      onTap: () => setState(() => _dayIndex = i),
                      borderRadius: AppRadius.mdAll,
                      child: Container(
                        width: 58,
                        decoration: BoxDecoration(
                          color: sel ? AppColors.info : t.surface,
                          borderRadius: AppRadius.mdAll,
                          border: Border.all(color: sel ? AppColors.info : t.outline),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              DateFormatter.weekdayShort(d.date).toUpperCase(),
                              style: AppTypography.eyebrow(context, color: sel ? AppColors.white : t.textMuted),
                            ),
                            Text(
                              '${d.date.day}',
                              style: AppTypography.number(context, size: 22, color: sel ? AppColors.white : t.textPrimary),
                            ),
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: open > 0 ? (sel ? AppColors.white : AppColors.info) : AppColors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap.md,
              if (slots.isEmpty)
                Text(l10n.coachNoSlots, style: context.text.bodySmall)
              else
                Wrap(
                  spacing: AppSpacing.sm,
                  runSpacing: AppSpacing.sm,
                  children: [
                    for (final s in slots)
                      ChoiceChip(
                        label: Text('${s.startTime} – ${s.endTime}', textDirection: TextDirection.ltr),
                        selected: widget.selected?.id == s.id,
                        selectedColor: AppColors.info,
                        onSelected: (_) => widget.onSelect(s),
                      ),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}

class _Reviews extends StatelessWidget {
  const _Reviews();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocBuilder<CoachReviewsCubit, PagedState<CoachReview>>(
      builder: (context, state) {
        if (state.isFirstLoad) return const PlayerCardSkeleton();
        if (state.items.isEmpty) return Text(l10n.coachNoReviews, style: context.text.bodySmall);
        return Column(
          children: [
            for (final r in state.items) ...[
              AppCard(
                padding: AppSpacing.cardDense,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        PlayerAvatar(name: r.playerName, photoUrl: r.playerPhotoUrl, size: AppSizes.avatarXs, showRing: false),
                        Gap.sm,
                        Expanded(child: Text(r.playerName, style: context.text.titleSmall)),
                        for (var i = 1; i <= 5; i++)
                          Icon(
                            i <= r.rating ? Icons.star_rounded : Icons.star_outline_rounded,
                            size: AppSizes.iconSm,
                            color: AppColors.premiumGold,
                          ),
                      ],
                    ),
                    if (r.comment != null && r.comment!.isNotEmpty) ...[Gap.sm, Text(r.comment!)],
                    if (r.createdAt != null) ...[Gap.xs, Text(DateFormatter.dayMonth(r.createdAt!), style: context.text.labelSmall)],
                  ],
                ),
              ),
              Gap.sm,
            ],
            if (state.hasMore)
              TextButton(onPressed: () => context.read<CoachReviewsCubit>().loadMore(), child: Text(l10n.actionViewAll)),
          ],
        );
      },
    );
  }
}

class _BookBar extends StatelessWidget {
  final Coach coach;
  final AvailabilitySlot? selected;
  final VoidCallback onBooked;

  const _BookBar({required this.coach, required this.selected, required this.onBooked});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    return Container(
      decoration: BoxDecoration(color: t.surface, border: Border(top: BorderSide(color: t.outline))),
      padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.gutter, AppSpacing.md, AppSpacing.gutter, AppSpacing.md),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.coachPerHour(Formatters.money(coach.pricePerHour, coach.currency)),
                    style: AppTypography.number(context, size: 20, color: AppColors.info),
                  ),
                  Text(
                    selected == null
                        ? l10n.bookingPickSlot
                        : '${DateFormatter.weekdayDay(selected!.date)} · ${selected!.startTime}',
                    style: context.text.bodySmall,
                  ),
                ],
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: AppColors.info, foregroundColor: AppColors.white),
              onPressed: selected == null
                  ? null
                  : () async {
                      final booked = await showBookingSheet(context, coach: coach, slot: selected!);
                      if (booked == true) onBooked();
                    },
              child: Text(l10n.coachBook),
            ),
          ],
        ),
      ),
    );
  }
}

/// Slot, training type, notes and a price summary. A taken slot (400)
/// refreshes availability and explains why.
Future<bool?> showBookingSheet(BuildContext context, {required Coach coach, required AvailabilitySlot slot}) {
  final availability = context.read<CoachAvailabilityCubit>();
  return showModalBottomSheet<bool>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => BlocProvider(
      create: (_) => sl<BookCoachCubit>(),
      child: _BookingSheet(coach: coach, slot: slot, availability: availability),
    ),
  );
}

class _BookingSheet extends StatefulWidget {
  final Coach coach;
  final AvailabilitySlot slot;
  final CoachAvailabilityCubit availability;

  const _BookingSheet({required this.coach, required this.slot, required this.availability});

  @override
  State<_BookingSheet> createState() => _BookingSheetState();
}

class _BookingSheetState extends State<_BookingSheet> {
  final _notes = TextEditingController();
  late String? _type = widget.coach.trainingTypes.firstOrNull;

  @override
  void dispose() {
    _notes.dispose();
    super.dispose();
  }

  Future<void> _book() async {
    final l10n = AppLocalizations.of(context);
    final cubit = context.read<BookCoachCubit>();
    final ok = await cubit.request(
      widget.coach.id,
      availabilityId: widget.slot.id,
      trainingType: _type,
      notes: _notes.text.trim(),
    );
    if (!mounted) return;
    if (ok) {
      Navigator.of(context).pop(true);
      showAppSnack(context, l10n.bookingRequested, icon: Icons.check_circle_rounded);
      return;
    }
    final state = cubit.state;
    if (state is ActionFailure) {
      if (state.failure is BusinessFailure) {
        widget.availability.load();
        Navigator.of(context).pop(false);
        showAppSnack(context, l10n.bookingSlotTaken, icon: Icons.event_busy_rounded);
      } else {
        showFailure(context, state.failure);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final price = widget.coach.pricePerHour * widget.slot.durationMinutes / 60;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        AppSpacing.xl,
        0,
        AppSpacing.xl,
        MediaQuery.viewInsetsOf(context).bottom + AppSpacing.xl,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(l10n.bookingSheetTitle, style: context.text.titleLarge),
            Gap.lg,
            AppCard(
              child: Row(
                children: [
                  const Icon(Icons.event_available_rounded, color: AppColors.info),
                  Gap.md,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(DateFormatter.weekdayDay(widget.slot.date), style: context.text.titleSmall),
                        Text(
                          '${widget.slot.startTime} – ${widget.slot.endTime} · ${Formatters.minutes(widget.slot.durationMinutes)}',
                          style: context.text.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (widget.coach.trainingTypes.isNotEmpty) ...[
              Gap.lg,
              Text(l10n.bookingTrainingType, style: context.text.titleSmall),
              Gap.sm,
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  for (final type in widget.coach.trainingTypes)
                    ChoiceChip(
                      label: Text(context.enums.label(EnumGroup.trainingTypes, type)),
                      selected: _type == type,
                      selectedColor: AppColors.info,
                      onSelected: (_) => setState(() => _type = type),
                    ),
                ],
              ),
            ],
            Gap.lg,
            TextField(controller: _notes, maxLines: 2, decoration: InputDecoration(labelText: l10n.fieldNotesOptional)),
            Gap.lg,
            Row(
              children: [
                Expanded(child: Text(l10n.bookingTotal, style: context.text.titleSmall)),
                Text(
                  Formatters.money(price, widget.coach.currency),
                  style: AppTypography.number(context, size: 22, color: AppColors.info),
                ),
              ],
            ),
            Gap.xl,
            BlocBuilder<BookCoachCubit, ActionState>(
              builder: (context, state) => FilledButton(
                style: FilledButton.styleFrom(backgroundColor: AppColors.info, foregroundColor: AppColors.white),
                onPressed: state is ActionInProgress ? null : _book,
                child: state is ActionInProgress ? const ButtonSpinner() : Text(l10n.bookingConfirm),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
