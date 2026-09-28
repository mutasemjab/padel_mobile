import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/widgets/entrance_animations.dart';
import 'login_controls.dart';

/// `.sheet` — frosted bottom panel with the handle; slides in on mount,
/// out on [done], and rides above the keyboard.
class LoginSheet extends StatelessWidget {
  final bool done;
  final double keyboard;
  final double maxHeight;
  final double bottomPadding;
  final Widget child;

  const LoginSheet({
    super.key,
    required this.done,
    required this.keyboard,
    required this.maxHeight,
    required this.bottomPadding,
    required this.child,
  });

  static const _radius = BorderRadius.vertical(top: Radius.circular(34));

  @override
  Widget build(BuildContext context) {
    // sheetIn 1s .5s ease backwards
    return EntranceAnimation(
      delay: const Duration(milliseconds: 500),
      duration: const Duration(seconds: 1),
      builder: (context, intro, child) => TweenAnimationBuilder<double>(
        tween: Tween(end: done ? 1.05 : 0),
        duration: AppMotion.of(context, const Duration(milliseconds: 800)),
        curve: AppMotion.ease,
        child: child,
        builder: (_, out, child) => FractionalTranslation(translation: Offset(0, (1 - intro) + out), child: child),
      ),
      child: Padding(
        padding: EdgeInsets.only(bottom: keyboard),
        child: CustomPaint(
          painter: const OuterShadowPainter(
            shadow: BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .5),
              offset: Offset(0, -30),
              blurRadius: 60,
              spreadRadius: -20,
            ),
            radius: _radius,
          ),
          child: ClipRRect(
            borderRadius: _radius,
            child: BackdropFilter(
              // blur(22px) saturate(140%)
              filter: ui.ImageFilter.compose(
                outer: const ColorFilter.matrix(_saturate140),
                inner: ui.ImageFilter.blur(sigmaX: 22, sigmaY: 22),
              ),
              child: CustomPaint(
                foregroundPainter: const TopHairlinePainter(color: Color.fromRGBO(227, 204, 151, .22), radius: 34),
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color.fromRGBO(10, 58, 47, .78), Color.fromRGBO(6, 38, 31, .96)],
                      stops: [0, .4],
                    ),
                  ),
                  child: Stack(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: math.max(0, maxHeight)),
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          padding: EdgeInsets.fromLTRB(24, 28, 24, bottomPadding),
                          child: child,
                        ),
                      ),
                      // ::before handle
                      Positioned(
                        top: 10,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            width: 38,
                            height: 4,
                            decoration: BoxDecoration(color: AppColors.cream15, borderRadius: BorderRadius.circular(4)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// CSS `saturate(1.4)` color matrix.
  static const _saturate140 = <double>[
    1.3149,
    -.2861,
    -.0289,
    0,
    0,
    -.0851,
    1.1139,
    -.0289,
    0,
    0,
    -.0851,
    -.2861,
    1.3711,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ];
}
