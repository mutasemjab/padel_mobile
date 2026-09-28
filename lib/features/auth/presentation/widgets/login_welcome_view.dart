import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';

import '../../../../core/widgets/app_logo.dart';

import '../../../../core/widgets/entrance_animations.dart';

import '../../../../l10n/gen/app_localizations.dart';

/// `.welcome` — shown once the code is verified ([play]).
class LoginWelcomeView extends StatelessWidget {
  final bool play;
  final String playerId;

  const LoginWelcomeView({super.key, required this.play, required this.playerId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AnimatedOpacity(
      opacity: play ? 1 : 0,
      duration: AppMotion.of(context, const Duration(milliseconds: 600)),
      curve: AppMotion.cssEase,
      child: IgnorePointer(
        ignoring: !play,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _Confetti(play: play),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _Ring(play: play),
                  const SizedBox(height: 26),
                  RiseIn(
                    play: play,
                    delay: const Duration(milliseconds: 1300),
                    duration: const Duration(milliseconds: 800),
                    child: Text(
                      l10n.pmWelcomeTitle,
                      textAlign: TextAlign.center,
                      style: AppFonts.display(size: 32, height: 1.3),
                    ),
                  ),
                  const SizedBox(height: 6),
                  RiseIn(
                    play: play,
                    delay: const Duration(milliseconds: 1450),
                    duration: const Duration(milliseconds: 800),
                    child: Text(
                      l10n.pmWelcomeSubtitle,
                      textAlign: TextAlign.center,
                      style: AppFonts.body(size: 13.5, color: AppColors.cream40),
                    ),
                  ),
                  if (playerId.isNotEmpty) ...[
                    const SizedBox(height: 22),
                    RiseIn(
                      play: play,
                      delay: const Duration(milliseconds: 1600),
                      duration: const Duration(milliseconds: 800),
                      child: _PlayerIdChip(playerId: playerId),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// `.pid`
class _PlayerIdChip extends StatelessWidget {
  final String playerId;

  const _PlayerIdChip({required this.playerId});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      color: AppColors.cream08,
      borderRadius: BorderRadius.circular(14),
      border: Border.all(color: const Color.fromRGBO(227, 204, 151, .25)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Player ID', style: AppFonts.body(size: 11, color: AppColors.cream40)),
        const SizedBox(width: 10),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Text(playerId, style: AppFonts.numeral(size: 16, letterSpacing: 2, color: AppColors.goldSoft)),
        ),
      ],
    ),
  );
}

/// `.w-ring` — 150px progress ring (ringFill 1.2s .4s) with the logo popping
/// in the middle (pop .8s 1s).
class _Ring extends StatelessWidget {
  final bool play;

  const _Ring({required this.play});

  @override
  Widget build(BuildContext context) => SizedBox.square(
    dimension: 150,
    child: Stack(
      alignment: Alignment.center,
      children: [
        EntranceAnimation(
          play: play,
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 1200),
          builder: (_, t, _) => CustomPaint(size: const Size.square(150), painter: _RingPainter(t)),
        ),
        PopIn(
          play: play,
          delay: const Duration(seconds: 1),
          duration: const Duration(milliseconds: 800),
          hiddenScale: .4,
          child: const AppLogo(height: 66, colors: [AppColors.ivory, AppColors.gold]),
        ),
      ],
    ),
  );
}

class _RingPainter extends CustomPainter {
  final double progress;

  const _RingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    // The SVG is rotated -90°, so the ring starts at 12 o'clock; the
    // gradient (#dff05a → #c9a86a, top-left → bottom-right) rotates with it.
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(-math.pi / 2);
    canvas.translate(-size.width / 2, -size.height / 2);
    final s = size.width / 150;
    final rect = Rect.fromCircle(center: Offset(75 * s, 75 * s), radius: 70 * s);
    final stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3 * s;
    canvas.drawCircle(rect.center, rect.width / 2, stroke..color = AppColors.cream08);
    if (progress > 0) {
      // stroke-dasharray:440 on a 439.8 circumference.
      final sweep = 2 * math.pi * math.min(1.0, progress * 440 / (2 * math.pi * 70));
      canvas.drawArc(
        rect,
        0,
        sweep,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3 * s
          ..strokeCap = StrokeCap.round
          ..shader = const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.ball, AppColors.gold],
          ).createShader(Rect.fromLTWH(5 * s, 5 * s, 140 * s, 140 * s)),
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_RingPainter old) => old.progress != progress;
}

/// `.confetti` — 28 dots bursting from (50%, 40%) of the screen.
class _Confetti extends StatefulWidget {
  final bool play;

  const _Confetti({required this.play});

  @override
  State<_Confetti> createState() => _ConfettiState();
}

class _Particle {
  final Color color;
  final Offset to;
  final double delay;
  final Size size;

  const _Particle(this.color, this.to, this.delay, this.size);
}

class _ConfettiState extends State<_Confetti> with SingleTickerProviderStateMixin {
  /// Longest delay (.6s) + burst (1.4s).
  static const _total = 2.0;
  static const _curve = Cubic(.1, .7, .3, 1);
  static const _colors = [AppColors.ball, AppColors.goldSoft, AppColors.gold, AppColors.cream];

  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 2000));
  List<_Particle> _particles = const [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.play && _particles.isEmpty) _burst();
  }

  @override
  void didUpdateWidget(_Confetti old) {
    super.didUpdateWidget(old);
    if (widget.play && !old.play) _burst();
    if (!widget.play && old.play) {
      _c.value = 0;
      _particles = const [];
    }
  }

  void _burst() {
    final rnd = math.Random();
    _particles = [
      for (var i = 0; i < 28; i++)
        () {
          final a = rnd.nextDouble() * math.pi * 2, r = 90 + rnd.nextDouble() * 110;
          return _Particle(
            _colors[i % 4],
            Offset(math.cos(a) * r, math.sin(a) * r),
            .3 + rnd.nextDouble() * .3,
            Size(4 + rnd.nextDouble() * 5, 4 + rnd.nextDouble() * 5),
          );
        }(),
    ];
    if (context.reduceMotion) {
      _c.value = 1;
    } else {
      _c.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: RepaintBoundary(child: CustomPaint(painter: _ConfettiPainter(_c, _particles))),
  );
}

class _ConfettiPainter extends CustomPainter {
  final Animation<double> clock;
  final List<_Particle> particles;

  _ConfettiPainter(this.clock, this.particles) : super(repaint: clock);

  @override
  void paint(Canvas canvas, Size size) {
    if (particles.isEmpty || clock.value == 0) return;
    final elapsed = clock.value * _ConfettiState._total;
    final origin = Offset(size.width * .5, size.height * .4);
    for (final p in particles) {
      if (elapsed < p.delay) continue;
      final t = _ConfettiState._curve.transform(((elapsed - p.delay) / 1.4).clamp(0.0, 1.0));
      if (t >= 1) continue;
      final scale = 1 - .6 * t;
      // The dot's top-left sits on the origin; scale() is about its center.
      final center = origin + Offset(p.size.width / 2, p.size.height / 2) + p.to * t;
      canvas.drawOval(
        Rect.fromCenter(center: center, width: p.size.width * scale, height: p.size.height * scale),
        Paint()..color = p.color.withValues(alpha: 1 - t),
      );
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter old) => old.particles != particles;
}
