import 'package:flutter/material.dart';

import '../theme/app_spacing.dart';
import 'feedback.dart';

/// Generic infinite-scroll list: fires [onLoadMore] when the user nears the
/// bottom and [hasMore] is true, and shows a small trailing spinner while
/// [isLoadingMore] — used by every paginated feature list instead of each
/// screen re-implementing scroll-threshold detection. Optional [header]
/// scrolls with the list; items get a staggered entrance.
class PaginatedListView<T> extends StatefulWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final VoidCallback onLoadMore;
  final bool hasMore;
  final bool isLoadingMore;
  final EdgeInsetsGeometry padding;
  final Widget? separator;
  final Future<void> Function()? onRefresh;
  final Widget? header;
  final bool animateEntrance;

  const PaginatedListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onLoadMore,
    required this.hasMore,
    required this.isLoadingMore,
    this.padding = AppSpacing.page,
    this.separator,
    this.onRefresh,
    this.header,
    this.animateEntrance = true,
  });

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    if (!widget.hasMore || widget.isLoadingMore) return;
    if (_controller.position.pixels >= _controller.position.maxScrollExtent - 300) {
      widget.onLoadMore();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasHeader = widget.header != null;
    final offset = hasHeader ? 1 : 0;
    final list = ListView.separated(
      controller: _controller,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: widget.padding,
      itemCount: widget.items.length + offset + (widget.hasMore ? 1 : 0),
      separatorBuilder: (_, index) => hasHeader && index == 0 ? Gap.lg : (widget.separator ?? Gap.md),
      itemBuilder: (context, index) {
        if (hasHeader && index == 0) return widget.header!;
        final i = index - offset;
        if (i >= widget.items.length) {
          return const Padding(
            padding: EdgeInsetsDirectional.symmetric(vertical: AppSpacing.xl),
            child: Center(child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2.5))),
          );
        }
        final child = widget.itemBuilder(context, widget.items[i], i);
        // Only the first screenful animates; recycled rows further down the
        // list would otherwise replay the entrance while scrolling.
        return widget.animateEntrance && i < 12 ? child.staggered(context, i) : child;
      },
    );

    if (widget.onRefresh == null) return list;
    return RefreshIndicator(onRefresh: widget.onRefresh!, child: list);
  }
}
