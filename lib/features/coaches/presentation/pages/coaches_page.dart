import 'dart:async';

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
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/coach.dart';
import '../bloc/coaches_cubits.dart';
import '../widgets/coach_card.dart';

/// Coaching marketplace: search, training-type filter, sort.
class CoachesPage extends StatelessWidget {
  /// Inside the Play tab (no own app bar).
  final bool embedded;

  const CoachesPage({super.key, this.embedded = false});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final body = BlocProvider(
      create: (_) => sl<CoachesCubit>()..load(),
      child: const _CoachesView(),
    );
    if (embedded) return body;
    return Scaffold(appBar: AppBar(title: Text(l10n.coachesTitle)), body: body);
  }
}

class _CoachesView extends StatefulWidget {
  const _CoachesView();

  @override
  State<_CoachesView> createState() => _CoachesViewState();
}

class _CoachesViewState extends State<_CoachesView> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final cubit = context.read<CoachesCubit>();
    final types = context.enums.options(EnumGroup.trainingTypes);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.gutter, AppSpacing.md, AppSpacing.gutter, 0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: l10n.coachesSearchHint, prefixIcon: const Icon(Icons.search_rounded)),
                  onChanged: (v) {
                    _debounce?.cancel();
                    _debounce = Timer(const Duration(milliseconds: 400), () => cubit.apply(query: v.trim()));
                  },
                ),
              ),
              Gap.sm,
              PopupMenuButton<String>(
                icon: const Icon(Icons.sort_rounded),
                onSelected: (s) => cubit.apply(sort: s),
                itemBuilder: (_) => [
                  PopupMenuItem(value: 'rating', child: Text(l10n.coachesSortRating)),
                  PopupMenuItem(value: 'price', child: Text(l10n.coachesSortPrice)),
                  PopupMenuItem(value: 'name', child: Text(l10n.coachesSortName)),
                ],
              ),
            ],
          ),
        ),
        Gap.md,
        SizedBox(
          height: AppSizes.chipHeight + 8,
          child: BlocBuilder<CoachesCubit, PagedState<Coach>>(
            builder: (context, _) => ListView(
              scrollDirection: Axis.horizontal,
              padding: AppSpacing.pageH,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                  child: ChoiceChip(
                    label: Text(l10n.coachesFilterAll),
                    selected: cubit.trainingType == null,
                    onSelected: (_) => cubit.apply(clearType: true),
                  ),
                ),
                for (final t in types)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: AppSpacing.sm),
                    child: ChoiceChip(
                      label: Text(t.label),
                      selected: cubit.trainingType == t.value,
                      selectedColor: AppColors.info,
                      onSelected: (_) => cubit.apply(trainingType: t.value),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<CoachesCubit, PagedState<Coach>>(
            builder: (context, state) => PagedStateView<Coach>(
              state: state,
              onLoadMore: cubit.loadMore,
              onRefresh: cubit.refresh,
              onRetry: cubit.load,
              skeleton: () => const ImageCardSkeleton(height: 90),
              empty: EmptyState(
                icon: Icons.sports_rounded,
                title: l10n.emptyCoachesTitle,
                message: l10n.emptyCoachesMessage,
                accent: AppColors.info,
              ),
              itemBuilder: (context, coach, _) => CoachCard(coach: coach, onTap: () => context.push(AppRoutes.coach(coach.id))),
            ),
          ),
        ),
      ],
    );
  }
}
