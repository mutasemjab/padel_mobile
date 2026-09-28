import 'dart:async';

import 'package:flutter/foundation.dart';

/// Bridges a Bloc's state [Stream] into a [Listenable] so go_router's
/// `refreshListenable` re-evaluates `redirect` on every auth state change.
class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
