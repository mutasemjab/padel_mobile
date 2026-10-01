import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:padel/firebase_options.dart';

import '../constants/api_endpoints.dart';
import 'device_token_provider.dart';

/// FCM wiring: permission, device-token registration (`POST/DELETE
/// device-tokens`), foreground display through local notifications, and tap
/// routing. Everything degrades to a no-op when Firebase isn't configured
/// (missing google-services.json / GoogleService-Info.plist).
class PushNotificationService implements DeviceTokenProvider {
  final Dio dio;

  PushNotificationService(this.dio);

  static const _channel = AndroidNotificationChannel(
    'padel_default',
    'Padel',
    description: 'Match, tournament, booking and social updates',
    importance: Importance.high,
  );

  final FlutterLocalNotificationsPlugin _local =
      FlutterLocalNotificationsPlugin();
  final StreamController<Map<String, dynamic>> _taps =
      StreamController.broadcast();
  final StreamController<Map<String, dynamic>> _foreground =
      StreamController.broadcast();

  bool _available = false;
  StreamSubscription<String>? _refreshSub;
  Map<String, dynamic>? _pendingLaunchData;

  bool get isAvailable => _available;

  /// Push `data` of a notification the user tapped (values are strings).
  Stream<Map<String, dynamic>> get onTap => _taps.stream;

  /// Push `data` of messages received while the app is open.
  Stream<Map<String, dynamic>> get onForegroundMessage => _foreground.stream;

  @override
  String get platform => switch (defaultTargetPlatform) {
    _ when kIsWeb => 'web',
    TargetPlatform.iOS || TargetPlatform.macOS => 'ios',
    _ => 'android',
  };

  Future<void> init() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _available = true;
    } catch (e) {
      if (kDebugMode) debugPrint('Push disabled: Firebase not configured ($e)');
      return;
    }

    await _local.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/launcher_icon'),
        iOS: DarwinInitializationSettings(
          requestAlertPermission: false,
          requestBadgePermission: false,
          requestSoundPermission: false,
        ),
      ),
      onDidReceiveNotificationResponse: (response) {
        final payload = response.payload;
        if (payload == null) return;
        try {
          _taps.add((jsonDecode(payload) as Map).cast<String, dynamic>());
        } catch (_) {}
      },
    );
    await _local
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_channel);

    FirebaseMessaging.onMessage.listen(_showForeground);
    FirebaseMessaging.onMessageOpenedApp.listen((m) => _taps.add(m.data));
    final initial = await FirebaseMessaging.instance.getInitialMessage();
    if (initial != null) _pendingLaunchData = initial.data;
  }

  /// A notification that cold-started the app; consumed once the router is ready.
  Map<String, dynamic>? takeLaunchData() {
    final data = _pendingLaunchData;
    _pendingLaunchData = null;
    return data;
  }

  Future<bool> requestPermission() async {
    if (!_available) return false;
    final settings = await FirebaseMessaging.instance.requestPermission();
    await _local
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  Future<AuthorizationStatus?> permissionStatus() async {
    if (!_available) return null;
    return (await FirebaseMessaging.instance.getNotificationSettings())
        .authorizationStatus;
  }

  @override
  Future<String?> currentToken() async {
    if (!_available) return null;
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (_) {
      return null;
    }
  }

  /// After login: ask permission, register the token, keep it fresh.
  Future<void> onSignedIn() async {
    if (!_available) return;
    await requestPermission();
    final token = await currentToken();
    if (token != null) await _register(token);
    await _refreshSub?.cancel();
    _refreshSub = FirebaseMessaging.instance.onTokenRefresh.listen(_register);
  }

  /// Logout already sent the token to `auth/logout`; stop tracking refreshes.
  Future<void> onSignedOut() async {
    await _refreshSub?.cancel();
    _refreshSub = null;
  }

  Future<void> _register(String token) async {
    try {
      await dio.post(
        ApiEndpoints.deviceTokens,
        data: {
          'token': token,
          'platform': platform,
          'device_name': defaultTargetPlatform.name,
        },
      );
    } catch (e) {
      if (kDebugMode) debugPrint('Device token registration failed: $e');
    }
  }

  /// `DELETE device-tokens {token}` — must run while the bearer token is
  /// still valid, i.e. before `auth/logout`.
  @override
  Future<void> unregister() async {
    final token = await currentToken();
    if (token == null) return;
    try {
      await dio.delete(ApiEndpoints.deviceTokens, data: {'token': token});
    } catch (_) {}
  }

  Future<void> _showForeground(RemoteMessage message) async {
    _foreground.add(message.data);
    final notification = message.notification;
    final title = notification?.title ?? message.data['title']?.toString();
    final body = notification?.body ?? message.data['message']?.toString();
    if (title == null && body == null) return;
    await _local.show(
      id: message.hashCode & 0x7fffffff,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          channelDescription: _channel.description,
          importance: Importance.high,
          priority: Priority.high,
          icon: '@mipmap/launcher_icon',
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }
}
