import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/models/player_summary.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/player_card.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../bloc/player_tab_cubits.dart';

/// Search-and-pick a player (partner pickers). Resolves to null when dismissed.
Future<PlayerSummary?> showPlayerPicker(BuildContext context, {String? title, String? excludePlayerId}) {
  return showModalBottomSheet<PlayerSummary>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => BlocProvider(
      create: (_) => PlayerSearchCubit(sl())..load(),
      child: _PlayerPicker(title: title, excludePlayerId: excludePlayerId),
    ),
  );
}

class _PlayerPicker extends StatefulWidget {
  final String? title;
  final String? excludePlayerId;

  const _PlayerPicker({this.title, this.excludePlayerId});

  @override
  State<_PlayerPicker> createState() => _PlayerPickerState();
}

class _PlayerPickerState extends State<_PlayerPicker> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.85,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: AppSpacing.pageH,
            child: Text(widget.title ?? l10n.registerPickPartner, style: context.text.titleLarge),
          ),
          Gap.md,
          Padding(
            padding: AppSpacing.pageH,
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: l10n.searchPlayersHint, prefixIcon: const Icon(Icons.search_rounded)),
              onChanged: (value) {
                _debounce?.cancel();
                _debounce = Timer(
                  const Duration(milliseconds: 350),
                  () => context.read<PlayerSearchCubit>().search(q: value.trim()),
                );
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<PlayerSearchCubit, PagedState<PlayerSummary>>(
              builder: (context, state) {
                final cubit = context.read<PlayerSearchCubit>();
                final filtered = state.copyWith(
                  items: state.items.where((p) => p.playerId != widget.excludePlayerId).toList(),
                );
                return PagedStateView<PlayerSummary>(
                  state: filtered,
                  onLoadMore: cubit.loadMore,
                  onRefresh: cubit.refresh,
                  onRetry: cubit.load,
                  empty: EmptyState(icon: Icons.person_search_rounded, title: l10n.searchPlayersEmpty, message: ''),
                  itemBuilder: (context, p, _) => PlayerCard(
                    player: p,
                    dense: true,
                    onTap: () => Navigator.of(context).pop(p),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
