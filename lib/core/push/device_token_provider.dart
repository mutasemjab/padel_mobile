/// Supplies the FCM token (when Firebase is configured) so auth calls can
/// register / unregister the device. Returns null when push isn't available.
abstract class DeviceTokenProvider {
  Future<String?> currentToken();

  /// `android | ios | web`.
  String get platform;

  /// `DELETE device-tokens` for this device (before the session ends).
  Future<void> unregister();
}

/// Used in tests and when Firebase isn't configured.
class NoDeviceTokenProvider implements DeviceTokenProvider {
  const NoDeviceTokenProvider();

  @override
  Future<String?> currentToken() async => null;

  @override
  String get platform => 'android';

  @override
  Future<void> unregister() async {}
}
