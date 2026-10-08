import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Pages inside the bottom-tab shell (/compete/..., /play/..., /rankings, /profile, /).
bool isInsideTabs(String route) {
  const roots = ['/compete', '/play', '/rankings', '/profile'];
  final path = Uri.parse(route).path;
  return path == '/' || roots.any((r) => path == r || path.startsWith('$r/'));
}

extension OpenRoute on BuildContext {
  /// Opens [route] safely from anywhere. A tab page `push`-ed from a page that
  /// lives outside the tab shell (notifications, my registrations, a player
  /// profile...) renders an empty screen in go_router, so in that case the
  /// app switches to the tab with `go` instead.
  void openRoute(String route) {
    final here = GoRouterState.of(this).uri.path;
    if (isInsideTabs(route) && !isInsideTabs(here)) {
      go(route);
    } else {
      push(route);
    }
  }
}
