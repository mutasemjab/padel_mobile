import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_durations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

/// Full-screen celebratory overlay for a newly-unlocked achievement: a
/// scrim, a scaling-in trophy icon and a handful of staggered confetti
/// pieces built purely from flutter_animate + Flutter primitives — there is
/// no Lottie asset in this project, so this deliberately avoids one.
/// Auto-dismisses after [AppDurations.celebrationAnimation] or on tap.
Future<void> showAchievementCelebration(
  BuildContext context, {
  required String achievementMessage,
}) {
  final overlay = Overlay.of(context, rootOverlay: true);
  final completer = Completer<void>();
  late OverlayEntry entry;
  var dismissed = false;

  void dismiss() {
    if (dismissed) return;
    dismissed = true;
    entry.remove();
    completer.complete();
  }

  entry = OverlayEntry(
    builder: (_) => _CelebrationOverlay(message: achievementMessage, onDismiss: dismiss),
  );
  overlay.insert(entry);

  Future.delayed(AppDurations.celebrationAnimation, dismiss);

  return completer.future;
}

class _CelebrationOverlay extends StatelessWidget {
  final String message;
  final VoidCallback onDismiss;

  const _CelebrationOverlay({required this.message, required this.onDismiss});

  static const _confettiColors = [
    AppColors.premiumGold,
    AppColors.clayOrange,
    AppColors.courtGreen,
    AppColors.live,
    AppColors.accent,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final random = Random();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onDismiss,
      child: Material(
        color: AppColors.scrim,
        child: Stack(
          children: [
            for (var i = 0; i < 12; i++)
              PositionedDirectional(
                start: random.nextDouble() * size.width,
                top: size.height * 0.32,
                child: Container(
                      width: 7 + random.nextDouble() * 7,
                      height: 7 + random.nextDouble() * 7,
                      decoration: BoxDecoration(
                        color: _confettiColors[i % _confettiColors.length],
                        shape: i.isEven ? BoxShape.circle : BoxShape.rectangle,
                        borderRadius: i.isEven ? null : BorderRadius.circular(2),
                      ),
                    )
                    .animate(delay: (i * 55).ms)
                    .moveY(
                      begin: 0,
                      end: 200 + random.nextDouble() * 140,
                      duration: 900.ms,
                      curve: Curves.easeIn,
                    )
                    .fadeOut(delay: 350.ms, duration: 550.ms),
              ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.emoji_events_rounded, size: 96, color: AppColors.premiumGold)
                      .animate()
                      .scale(
                        begin: const Offset(0.2, 0.2),
                        end: const Offset(1, 1),
                        duration: 450.ms,
                        curve: Curves.easeOutBack,
                      )
                      .fadeIn(duration: 200.ms),
                  Gap.xl,
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.xxxl),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.white),
                    ),
                  ).animate().fadeIn(delay: 250.ms, duration: 300.ms),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
