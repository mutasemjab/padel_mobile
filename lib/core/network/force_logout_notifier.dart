import 'dart:async';

/// Broadcasts a global "session expired" event whenever any request gets a 401.
/// The app root listens to this and forces navigation to the login screen,
/// instead of every screen having to handle 401 individually.
class ForceLogoutNotifier {
  ForceLogoutNotifier._internal();

  static final ForceLogoutNotifier instance = ForceLogoutNotifier._internal();

  final StreamController<void> _controller = StreamController<void>.broadcast();

  Stream<void> get onForceLogout => _controller.stream;

  void notify() => _controller.add(null);

  void dispose() => _controller.close();
}
