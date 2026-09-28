import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/entrance_animations.dart';
import 'login_controls.dart';

/// `.brand` — emblem, wordmark and tagline at the top of the login page.
/// Fades and lifts away once [done].
class LoginBrand extends StatelessWidget {
  final bool done;

  const LoginBrand({super.key, required this.done});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: done ? 0 : 1,
      duration: AppMotion.of(context, const Duration(milliseconds: 600)),
      curve: AppMotion.cssEase,
      child: TweenAnimationBuilder<double>(
        tween: Tween(end: done ? -30 : 0),
        duration: AppMotion.of(context, const Duration(milliseconds: 900)),
        curve: AppMotion.ease,
        builder: (_, y, child) => Transform.translate(offset: Offset(0, y), child: child),
        child: IgnorePointer(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const PopIn(delay: Duration(milliseconds: 200), duration: Duration(seconds: 1), child: _Emblem()),
                const SizedBox(height: 22),
                RiseIn(
                  delay: const Duration(milliseconds: 450),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 9),
                    child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (r) => const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [AppColors.ivory, AppColors.goldSoft],
                      ).createShader(r),
                      child: Text('PLAYMAKER', style: AppFonts.numeral(size: 30, letterSpacing: 9, height: 1)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RiseIn(
                  delay: const Duration(milliseconds: 600),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const _Hairline(),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          'The Digital Identity of Padel',
                          textAlign: TextAlign.center,
                          style: AppFonts.numeral(size: 13, italic: true, color: AppColors.cream70, letterSpacing: .4),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const _Hairline(mirrored: true),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Hairline extends StatelessWidget {
  final bool mirrored;

  const _Hairline({this.mirrored = false});

  @override
  Widget build(BuildContext context) => Transform.flip(
    flipX: mirrored,
    child: const SizedBox(
      width: 22,
      height: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0x00C9A86A), AppColors.gold])),
      ),
    ),
  );
}

/// `.emblem` — frosted tile, pulsing halo rings, gold logo mark.
class _Emblem extends StatelessWidget {
  const _Emblem();

  static const _radius = 34.0;

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: 112,
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CustomPaint(
          painter: const OuterShadowPainter(
            shadow: BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .6),
              offset: Offset(0, 30),
              blurRadius: 60,
              spreadRadius: -20,
            ),
            radius: BorderRadius.all(Radius.circular(_radius)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(_radius),
            child: BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radius),
                  gradient: const CssLinearGradient(
                    160,
                    colors: [Color.fromRGBO(243, 238, 223, .10), Color.fromRGBO(243, 238, 223, .02)],
                  ),
                  border: Border.all(color: const Color.fromRGBO(227, 204, 151, .3)),
                ),
                child: CustomPaint(
                  painter: const InsetTopHighlightPainter(color: Color.fromRGBO(255, 255, 255, .1), radius: _radius),
                  child: const Center(
                    child: AppLogo(height: 70, colors: AppGradients.goldLeaf, stops: [0, .55, 1]),
                  ),
                ),
              ),
            ),
          ),
        ),
        const Positioned(left: -1, top: -1, right: -1, bottom: -1, child: _Halo(delay: Duration(milliseconds: 1200))),
        const Positioned(left: -1, top: -1, right: -1, bottom: -1, child: _Halo(delay: Duration(milliseconds: 2800))),
      ],
    ),
  );
}

/// `.emblem::before/::after` — `halo 3.2s <delay> ease-out infinite`.
class _Halo extends StatefulWidget {
  final Duration delay;

  const _Halo({required this.delay});

  @override
  State<_Halo> createState() => _HaloState();
}

class _HaloState extends State<_Halo> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 3200));
  Timer? _delay;
  bool _running = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_delay != null) return;
    final reduced = context.reduceMotion;
    _delay = Timer(widget.delay, () {
      if (!mounted) return;
      setState(() => _running = true);
      if (reduced) {
        _c.value = 1;
      } else {
        _c.repeat();
      }
    });
  }

  @override
  void dispose() {
    _delay?.cancel();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _c,
    builder: (_, child) {
      // Before the delay elapses the ring shows its base style.
      final t = _running ? AppMotion.cssEaseOut.transform(_c.value) : 0.0;
      final opacity = _running ? .9 * (1 - t) : 1.0;
      return Opacity(
        opacity: opacity,
        child: Transform.scale(scale: 1 + .55 * t, child: child),
      );
    },
    child: DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_Emblem._radius),
        border: Border.all(color: const Color.fromRGBO(227, 204, 151, .35)),
      ),
    ),
  );
}
