import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/di/injection.dart';
import '../../../core/network/api_result.dart';
import '../../../core/routing/app_routes.dart';
import '../../../core/routing/open_route.dart';
import '../../../core/state/base_cubits.dart';
import '../../../core/state/view_state.dart';
import '../../../core/theme/app_effects.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/widgets/app_card.dart';
import '../../../core/widgets/app_network_image.dart';
import '../../../core/widgets/court_lines.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/section_header.dart';
import '../../../core/widgets/state_builders.dart';
import '../../../l10n/gen/app_localizations.dart';
import '../../casual_matches/presentation/bloc/casual_cubits.dart';
import '../../tournaments/domain/entities/venue.dart';
import '../../tournaments/presentation/widgets/tournament_card.dart';
import '../domain/entities/venue_detail.dart';
import '../domain/usecases/venues_usecases.dart';

class VenueDetailCubit extends ViewCubit<VenueDetail> {
  final GetVenueUseCase getVenue;
  final int id;

  VenueDetailCubit(this.getVenue, this.id);

  @override
  ApiResult<VenueDetail> fetch() => getVenue(id);

  @override
  bool isEmpty(VenueDetail data) => false;
}

class VenuesPage extends StatefulWidget {
  const VenuesPage({super.key});

  @override
  State<VenuesPage> createState() => _VenuesPageState();
}

class _VenuesPageState extends State<VenuesPage> {
  late final VenuesCubit _cubit = sl<VenuesCubit>()..load();
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.venuesTitle)),
        body: Column(
          children: [
            Padding(
              padding: AppSpacing.pageH,
              child: TextField(
                decoration: InputDecoration(hintText: l10n.actionSearch, prefixIcon: const Icon(Icons.search_rounded)),
                onChanged: (v) {
                  _debounce?.cancel();
                  _debounce = Timer(const Duration(milliseconds: 400), () => _cubit.search(v.trim()));
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<VenuesCubit, PagedState<Venue>>(
                builder: (context, state) => PagedStateView<Venue>(
                  state: state,
                  onLoadMore: _cubit.loadMore,
                  onRefresh: _cubit.refresh,
                  onRetry: _cubit.load,
                  empty: EmptyState(icon: Icons.stadium_rounded, title: l10n.venuesEmpty, message: ''),
                  itemBuilder: (context, v, _) => AppCard(
                    onTap: () => context.push(AppRoutes.venue(v.id)),
                    padding: AppSpacing.cardDense,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: AppRadius.mdAll,
                          child: SizedBox(
                            width: 64,
                            height: 64,
                            child: AppNetworkImage(
                              url: v.imageUrl,
                              fallback: const DecoratedBox(decoration: BoxDecoration(gradient: AppGradients.court)),
                            ),
                          ),
                        ),
                        Gap.md,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(v.name, style: context.text.titleSmall),
                              Text([v.city, if (v.address != null) v.address!].join(' · '), style: context.text.bodySmall),
                              Text(l10n.venueCourts(v.courtsCount ?? v.courts.length), style: context.text.labelSmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VenueDetailPage extends StatelessWidget {
  final int id;

  const VenueDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => VenueDetailCubit(sl(), id)..load(),
      child: Scaffold(
        body: BlocBuilder<VenueDetailCubit, ViewState<VenueDetail>>(
          builder: (context, state) => ViewStateView<VenueDetail>(
            state: state,
            onRetry: () => context.read<VenueDetailCubit>().load(),
            builder: (context, detail) {
              final v = detail.venue;
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 200,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(v.name),
                      background: AppNetworkImage(
                        url: v.imageUrl,
                        fallback: const DecoratedBox(
                          decoration: BoxDecoration(gradient: AppGradients.court),
                          child: CourtLinesBackground(),
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: AppSpacing.page,
                    sliver: SliverList.list(
                      children: [
                        AppCard(
                          onTap: v.hasLocation ? () => launchUrl(v.mapUri!, mode: LaunchMode.externalApplication) : null,
                          child: Row(
                            children: [
                              Icon(Icons.place_rounded, color: context.tokens.highlight),
                              Gap.md,
                              Expanded(child: Text([v.city, if (v.address != null) v.address!].join(' · '))),
                              if (v.hasLocation) const Icon(Icons.open_in_new_rounded),
                            ],
                          ),
                        ),
                        if (v.hasLocation) ...[
                          Gap.sm,
                          FilledButton.icon(
                            onPressed: () => launchUrl(v.mapUri!, mode: LaunchMode.externalApplication),
                            icon: const Icon(Icons.map_rounded),
                            label: Text(AppLocalizations.of(context).openInGoogleMaps),
                          ),
                        ],
                        if (v.description != null) ...[Gap.lg, Text(v.description!)],
                        if (v.courts.isNotEmpty) ...[
                          Gap.xl,
                          SectionHeader(title: l10n.venueCourts(v.courts.length)),
                          Gap.sm,
                          Wrap(
                            spacing: AppSpacing.sm,
                            runSpacing: AppSpacing.sm,
                            children: [
                              for (final c in v.courts) Chip(label: Text(c.type == null ? c.name : '${c.name} · ${c.type}')),
                            ],
                          ),
                        ],
                        Gap.xl,
                        SectionHeader(title: l10n.venueUpcoming),
                        Gap.md,
                        if (detail.upcomingTournaments.isEmpty) Text(l10n.emptyTournamentsMessage, style: context.text.bodySmall),
                        for (final t in detail.upcomingTournaments) ...[
                          TournamentCard(tournament: t, compact: true, onTap: () => context.openRoute(AppRoutes.tournament(t.id))),
                          Gap.md,
                        ],
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
