import 'dart:async';

import 'package:flutter/material.dart';

import 'app.dart';
import 'core/di/injection.dart';
import 'core/localization/locale_controller.dart';
import 'core/meta/enums_service.dart';
import 'core/push/push_notification_service.dart';
import 'core/realtime/realtime_service.dart';
import 'core/theme/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleController.instance.load();
  await ThemeController.instance.load();
  await configureDependencies();

  // Push must be initialised before the first frame to catch the tap that
  // cold-started the app. Both degrade to no-ops when unavailable.
  await sl<PushNotificationService>().init();
  await sl<RealtimeService>().bootstrap().timeout(const Duration(seconds: 4), onTimeout: () {});

  // Labels for every enum; screens fall back to humanized values until loaded.
  unawaited(sl<EnumsService>().load());

  runApp(const PadelApp());
}
