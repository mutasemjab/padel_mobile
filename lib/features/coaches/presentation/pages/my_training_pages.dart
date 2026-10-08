import 'package:fl_chart/fl_chart.dart';
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
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/booking.dart';
import '../bloc/coaches_cubits.dart';
import '../widgets/booking_tile.dart';

/// Upcoming / past sessions.
class MyBookingsPage extends StatelessWidget {
  const MyBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.myBookingsTitle),
          actions: [
            IconButton(
              tooltip: l10n.trainingProgressTitle,
              icon: const Icon(Icons.trending_up_rounded),
              onPressed: () => context.push(AppRoutes.trainingProgress),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md),
            tabs: [Tab(text: l10n.myBookingsUpcoming), Tab(text: l10n.myBookingsPast)],
          ),
        ),
        body: const TabBarView(children: [_BookingList(upcoming: true), _BookingList(upcoming: false)]),
      ),
    );
  }
}

class _BookingList extends StatelessWidget {
  final bool upcoming;

  const _BookingList({required this.upcoming});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => MyBookingsCubit(sl(), upcoming: upcoming)..load()),
        BlocProvider(create: (_) => sl<BookingActionCubit>()),
      ],
      child: BlocBuilder<MyBookingsCubit, PagedState<Booking>>(
        builder: (context, state) {
          final cubit = context.read<MyBookingsCubit>();
          return PagedStateView<Booking>(
            state: state,
            onLoadMore: cubit.loadMore,
            onRefresh: cubit.refresh,
            onRetry: cubit.load,
            empty: EmptyState(
              icon: Icons.event_note_rounded,
              title: l10n.myBookingsEmpty,
              message: l10n.emptyCoachesMessage,
              accent: AppColors.info,
              ctaLabel: upcoming ? l10n.coachBook : null,
              onCta: upcoming ? () => context.push(AppRoutes.coaches) : null,
            ),
            itemBuilder: (context, b, _) => BookingTile(
              booking: b,
              onTap: () async {
                await context.push(AppRoutes.booking(b.id));
                if (context.mounted) cubit.refresh();
              },
              // Pending requests (and confirmed ones inside the window) can be cancelled right here.
              trailing: b.canCancel
                  ? TextButton(
                      style: TextButton.styleFrom(foregroundColor: AppColors.danger),
                      onPressed: () async {
                        if (await cancelBookingFlow(context, b) && context.mounted) cubit.refresh();
                      },
                      child: Text(l10n.actionCancel),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}

class BookingDetailPage extends StatelessWidget {
  final int id;

  const BookingDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BookingDetailCubit(sl(), id)..load()),
        BlocProvider(create: (_) => sl<BookingActionCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.bookingDetailTitle)),
        body: BlocListener<BookingActionCubit, ActionState>(
          listener: (context, state) {
            if (state is ActionFailure) showFailure(context, state.failure);
            if (state is ActionSuccess) context.read<BookingDetailCubit>().refresh();
          },
          child: BlocBuilder<BookingDetailCubit, ViewState<Booking>>(
            builder: (context, state) => ViewStateView<Booking>(
              state: state,
              onRetry: () => context.read<BookingDetailCubit>().load(),
              builder: (context, booking) => _BookingDetail(booking: booking),
            ),
          ),
        ),
      ),
    );
  }
}

class _BookingDetail extends StatelessWidget {
  final Booking booking;

  const _BookingDetail({required this.booking});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final b = booking;
    Widget row(String label, String? value) => value == null || value.isEmpty
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.sm),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 120, child: Text(label, style: context.text.bodySmall)),
                Expanded(child: Text(value, style: context.text.bodyMedium)),
              ],
            ),
          );
    return ListView(
      padding: AppSpacing.page,
      children: [
        BookingTile(booking: b, trailing: const SizedBox.shrink()),
        Gap.lg,
        AppCard(
          child: Column(
            children: [
              if (b.scheduledAt != null) row(l10n.fieldDateTime, DateFormatter.matchTime(b.scheduledAt!)),
              row(l10n.bookingDuration, Formatters.minutes(b.durationMinutes)),
              row(l10n.bookingLocation, b.location),
              row(l10n.bookingTrainingType, b.trainingType == null ? null : context.enums.label(EnumGroup.trainingTypes, b.trainingType)),
              row(l10n.bookingPrice, b.price == null ? null : Formatters.money(b.price!, b.currency)),
              row(l10n.bookingNotes, b.notes),
              if (b.rejectionReason != null) row(l10n.bookingStatus, l10n.bookingRejectedReason(b.rejectionReason!)),
              if (b.cancelledBy != null)
                row(
                  l10n.bookingStatus,
                  l10n.bookingCancelledBy(b.cancelledBy == 'coach' ? l10n.bookingByCoach : l10n.bookingByPlayer) +
                      (b.cancellationReason == null ? '' : ' · ${b.cancellationReason}'),
                ),
            ],
          ),
        ),
        if (b.feedback != null && b.feedback!.isNotEmpty) ...[
          Gap.lg,
          SectionHeader(title: l10n.bookingFeedback),
          Gap.sm,
          AppCard(child: Text(b.feedback!)),
        ],
        if (b.xpAwarded != null && b.xpAwarded! > 0) ...[
          Gap.md,
          Text(l10n.bookingXpAwarded(b.xpAwarded!), style: context.text.labelLarge),
        ],
        if (b.progress.isNotEmpty) ...[
          Gap.lg,
          SectionHeader(title: l10n.bookingProgressRecorded),
          Gap.sm,
          for (final p in b.progress) _ProgressLine(entry: p),
        ],
        if (b.review != null) ...[
          Gap.lg,
          SectionHeader(title: l10n.bookingYourReview),
          Gap.sm,
          AppCard(
            child: Row(
              children: [
                for (var i = 1; i <= 5; i++)
                  Icon(i <= b.review!.rating ? Icons.star_rounded : Icons.star_outline_rounded, color: AppColors.premiumGold),
                Gap.md,
                if (b.review!.comment != null) Expanded(child: Text(b.review!.comment!)),
              ],
            ),
          ),
        ],
        Gap.xxl,
        if (b.canReview)
          FilledButton.icon(
            onPressed: () => _showReviewSheet(context, b),
            icon: const Icon(Icons.star_rounded),
            label: Text(l10n.bookingReview),
          ),
        if (b.canCancel) ...[
          Gap.sm,
          OutlinedButton(
            style: OutlinedButton.styleFrom(foregroundColor: AppColors.danger),
            onPressed: () => _cancel(context, b),
            child: Text(l10n.bookingCancel),
          ),
          Gap.xs,
          Text(l10n.bookingCancelWindow, style: context.text.bodySmall, textAlign: TextAlign.center),
        ],
      ],
    );
  }

  Future<void> _cancel(BuildContext context, Booking b) => cancelBookingFlow(context, b);

  Future<void> _showReviewSheet(BuildContext context, Booking b) async {
    final l10n = AppLocalizations.of(context);
    final actions = context.read<BookingActionCubit>();
    var rating = 5;
    final comment = TextEditingController();
    final submitted = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (sheet) => StatefulBuilder(
        builder: (sheet, setState) => Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            AppSpacing.xl,
            0,
            AppSpacing.xl,
            MediaQuery.viewInsetsOf(sheet).bottom + AppSpacing.xl,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l10n.bookingReview, style: sheet.text.titleLarge),
              Gap.lg,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 1; i <= 5; i++)
                    IconButton(
                      iconSize: 36,
                      onPressed: () => setState(() => rating = i),
                      icon: Icon(i <= rating ? Icons.star_rounded : Icons.star_outline_rounded, color: AppColors.premiumGold),
                    ),
                ],
              ),
              Gap.md,
              TextField(controller: comment, maxLines: 3, decoration: InputDecoration(labelText: l10n.bookingReviewComment)),
              Gap.xl,
              FilledButton(onPressed: () => Navigator.of(sheet).pop(true), child: Text(l10n.actionSend)),
            ],
          ),
        ),
      ),
    );
    if (submitted == true && await actions.review(b.id, rating: rating, comment: comment.text.trim()) && context.mounted) {
      showAppSnack(context, l10n.bookingReviewThanks, icon: Icons.star_rounded);
    }
    comment.dispose();
  }
}

/// Asks for an optional reason and cancels the booking (needs a [BookingActionCubit] above).
Future<bool> cancelBookingFlow(BuildContext context, Booking b) async {
  final l10n = AppLocalizations.of(context);
  final actions = context.read<BookingActionCubit>();
  final reason = await _promptText(context, title: l10n.bookingCancel, label: l10n.bookingCancelReason);
  if (reason == null || !context.mounted) return false;
  final ok = await actions.cancel(b.id, reason: reason.isEmpty ? null : reason);
  if (!context.mounted) return ok;
  if (ok) {
    showAppSnack(context, l10n.bookingCancelled);
  } else if (actions.state is ActionFailure) {
    showFailure(context, (actions.state as ActionFailure).failure);
  }
  return ok;
}

Future<String?> _promptText(BuildContext context, {required String title, required String label}) async {
  final controller = TextEditingController();
  final l10n = AppLocalizations.of(context);
  final result = await showDialog<String>(
    context: context,
    builder: (dialog) => AlertDialog(
      title: Text(title),
      content: TextField(controller: controller, maxLines: 2, decoration: InputDecoration(labelText: label)),
      actions: [
        TextButton(onPressed: () => Navigator.of(dialog).pop(), child: Text(l10n.actionBack)),
        FilledButton(onPressed: () => Navigator.of(dialog).pop(controller.text.trim()), child: Text(l10n.actionConfirm)),
      ],
    ),
  );
  controller.dispose();
  return result;
}

class _ProgressLine extends StatelessWidget {
  final TrainingProgress entry;

  const _ProgressLine({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          SizedBox(
            width: 110,
            child: Text(entry.skillLabel ?? context.enums.label(EnumGroup.trainingSkills, entry.skill), style: context.text.bodySmall),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: AppRadius.pillAll,
              child: LinearProgressIndicator(value: entry.score / 10, color: AppColors.info, minHeight: 8),
            ),
          ),
          Gap.sm,
          Text('${entry.score}/10', style: AppTypography.number(context, size: 15, color: AppColors.info)),
        ],
      ),
    );
  }
}

/// Per-skill progress lines from coach assessments.
class TrainingProgressPage extends StatelessWidget {
  const TrainingProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => sl<TrainingProgressCubit>()..load(),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.trainingProgressTitle)),
        body: BlocBuilder<TrainingProgressCubit, ViewState<TrainingProgressReport>>(
          builder: (context, state) => ViewStateView<TrainingProgressReport>(
            state: state,
            onRetry: () => context.read<TrainingProgressCubit>().load(),
            empty: EmptyState(
              icon: Icons.trending_up_rounded,
              title: l10n.trainingProgressTitle,
              message: l10n.trainingProgressEmpty,
              accent: AppColors.info,
            ),
            builder: (context, report) => TrainingProgressView(report: report),
          ),
        ),
      ),
    );
  }
}

/// Reused by the coach portal's player-progress screen.
class TrainingProgressView extends StatelessWidget {
  final TrainingProgressReport report;

  const TrainingProgressView({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return ListView(
      padding: AppSpacing.page,
      children: [
        for (final skill in report.bySkill) ...[
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(context.enums.label(EnumGroup.trainingSkills, skill.skill), style: context.text.titleMedium),
                    ),
                    if (skill.latestScore != null)
                      Text(l10n.trainingLatest(skill.latestScore!), style: AppTypography.number(context, size: 18, color: AppColors.info)),
                  ],
                ),
                Text(
                  [
                    l10n.trainingAssessments(skill.assessments),
                    if (skill.change != null) Formatters.signed(skill.change!),
                  ].join(' · '),
                  style: context.text.bodySmall,
                ),
                if (skill.history.length >= 2) ...[
                  Gap.md,
                  SizedBox(height: 120, child: _SkillChart(points: skill.history)),
                ],
              ],
            ),
          ),
          Gap.md,
        ],
      ],
    );
  }
}

class _SkillChart extends StatelessWidget {
  final List<SkillScorePoint> points;

  const _SkillChart({required this.points});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final sorted = [...points]..sort((a, b) => a.date.compareTo(b.date));
    return LineChart(
      LineChartData(
        minY: 0,
        maxY: 10,
        gridData: FlGridData(
          drawVerticalLine: false,
          horizontalInterval: 5,
          getDrawingHorizontalLine: (_) => FlLine(color: t.outline, strokeWidth: 1),
        ),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(topTitles: AxisTitles(), rightTitles: AxisTitles(), bottomTitles: AxisTitles()),
        lineBarsData: [
          LineChartBarData(
            spots: [for (var i = 0; i < sorted.length; i++) FlSpot(i.toDouble(), sorted[i].score.toDouble())],
            color: AppColors.info,
            barWidth: 3,
            isCurved: true,
            preventCurveOverShooting: true,
            belowBarData: BarAreaData(show: true, color: AppColors.info.withValues(alpha: 0.12)),
          ),
        ],
      ),
    );
  }
}
