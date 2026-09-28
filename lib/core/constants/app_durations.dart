import 'package:flutter/animation.dart';

class AppDurations {
  const AppDurations._();

  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);

  /// Live-match polling fallback when the backend doesn't say otherwise
  /// (`realtime/config.poll_interval_seconds` wins when present).
  static const Duration liveMatchPoll = Duration(seconds: 5);

  /// Poll interval while an AI insight / 3D job / payment is pending.
  static const Duration jobPoll = Duration(seconds: 4);

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration base = Duration(milliseconds: 250);
  static const Duration mediumAnimation = Duration(milliseconds: 400);
  static const Duration counter = Duration(milliseconds: 900);
  static const Duration celebrationAnimation = Duration(milliseconds: 1600);
  static const Duration staggerStep = Duration(milliseconds: 40);

  static const Curve curve = Curves.easeOutCubic;
}
