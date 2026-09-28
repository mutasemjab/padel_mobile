import 'package:flutter/material.dart';

import '../state/view_state.dart';
import '../theme/app_spacing.dart';
import 'paginated_list_view.dart';
import 'shimmer_skeleton.dart';
import 'state_views.dart';

/// Renders a [ViewState]: skeleton while loading, [ErrorState] (offline /
/// premium / coming-soon aware) on failure, [empty] when empty, [builder]
/// when loaded.
class ViewStateView<T> extends StatelessWidget {
  final ViewState<T> state;
  final Widget Function(BuildContext context, T data) builder;
  final Widget? loading;
  final Widget? empty;
  final VoidCallback? onRetry;

  const ViewStateView({super.key, required this.state, required this.builder, this.loading, this.empty, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: switch (state) {
        ViewInitial<T>() ||
        ViewLoading<T>() => KeyedSubtree(key: const ValueKey('loading'), child: loading ?? const LoadingState()),
        ViewError<T>(:final failure) => KeyedSubtree(
          key: const ValueKey('error'),
          child: ErrorState(failure: failure, onRetry: onRetry),
        ),
        ViewEmpty<T>() => KeyedSubtree(key: const ValueKey('empty'), child: empty ?? const SizedBox.shrink()),
        ViewLoaded<T>(:final data) => KeyedSubtree(key: const ValueKey('loaded'), child: builder(context, data)),
      },
    );
  }
}

/// Renders a [PagedState] with infinite scroll + pull-to-refresh.
class PagedStateView<T> extends StatelessWidget {
  final PagedState<T> state;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final VoidCallback onLoadMore;
  final Future<void> Function() onRefresh;
  final VoidCallback onRetry;
  final Widget empty;
  final Widget Function()? skeleton;
  final Widget? header;
  final EdgeInsetsGeometry padding;
  final Widget? separator;

  const PagedStateView({
    super.key,
    required this.state,
    required this.itemBuilder,
    required this.onLoadMore,
    required this.onRefresh,
    required this.onRetry,
    required this.empty,
    this.skeleton,
    this.header,
    this.padding = AppSpacing.page,
    this.separator,
  });

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case PagedStatus.initial:
      case PagedStatus.loading:
        return SkeletonList(itemBuilder: skeleton ?? () => const PlayerCardSkeleton());
      case PagedStatus.error:
        return ErrorState(failure: state.failure!, onRetry: onRetry);
      case PagedStatus.empty:
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              if (header != null)
                SliverPadding(
                  padding: padding,
                  sliver: SliverToBoxAdapter(child: header),
                ),
              SliverFillRemaining(hasScrollBody: false, child: empty),
            ],
          ),
        );
      case PagedStatus.loaded:
        return PaginatedListView<T>(
          items: state.items,
          itemBuilder: itemBuilder,
          onLoadMore: onLoadMore,
          hasMore: state.hasMore,
          isLoadingMore: state.isLoadingMore,
          onRefresh: onRefresh,
          header: header,
          padding: padding,
          separator: separator,
        );
    }
  }
}
