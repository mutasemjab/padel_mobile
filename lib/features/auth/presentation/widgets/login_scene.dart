import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_tokens.dart';

import 'login_controls.dart';

/// `.screen` background + the `::after` film grain.
class LoginBackground extends StatefulWidget {
  const LoginBackground({super.key});

  @override
  State<LoginBackground> createState() => _LoginBackgroundState();
}

class _LoginBackgroundState extends State<LoginBackground> {
  static Future<ui.Image>? _grain;
  ui.Image? _image;

  /// A 160×160 RGBA noise tile standing in for the SVG `feTurbulence`
  /// (fractalNoise, all four channels noisy around the mid value).
  static Future<ui.Image> _makeGrain() {
    const n = 160;
    final rnd = math.Random(7);
    final px = Uint8List(n * n * 4);
    for (var i = 0; i < px.length; i += 4) {
      px[i] = 64 + rnd.nextInt(128);
      px[i + 1] = 64 + rnd.nextInt(128);
      px[i + 2] = 64 + rnd.nextInt(128);
      px[i + 3] = 96 + rnd.nextInt(96);
    }
    final done = Completer<ui.Image>();
    ui.decodeImageFromPixels(px, n, n, ui.PixelFormat.rgba8888, done.complete);
    return done.future;
  }

  @override
  void initState() {
    super.initState();
    (_grain ??= _makeGrain()).then((img) {
      if (mounted) setState(() => _image = img);
    });
  }

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    child: CustomPaint(painter: _BackgroundPainter(_image), size: Size.infinite),
  );
}

class _BackgroundPainter extends CustomPainter {
  final ui.Image? grain;

  _BackgroundPainter(this.grain);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.green800, AppColors.green900, AppColors.green950],
          stops: [0, .55, 1],
        ).createShader(rect),
    );
    final g = grain;
    if (g != null) {
      // opacity:.08; mix-blend-mode:overlay
      canvas.drawRect(
        rect,
        Paint()
          ..shader = ImageShader(g, TileMode.repeated, TileMode.repeated, Matrix4.identity().storage)
          ..blendMode = BlendMode.overlay
          ..color = const Color.fromRGBO(0, 0, 0, .08),
      );
    }
  }

  @override
  bool shouldRepaint(_BackgroundPainter old) => old.grain != grain;
}

/// `.scene` — glow, court (drawn in), floodlight beams, dotted trail and the
/// flying ball. Occupies the top 62% of the screen; [done] zooms it to 1.15.
class LoginCourtScene extends StatefulWidget {
  final bool done;

  const LoginCourtScene({super.key, required this.done});

  @override
  State<LoginCourtScene> createState() => _LoginCourtSceneState();
}

class _LoginCourtSceneState extends State<LoginCourtScene> with TickerProviderStateMixin {
  late final AnimationController _draw = AnimationController(vsync: this, duration: const Duration(milliseconds: 2400));
  late final AnimationController _fly = AnimationController(vsync: this, duration: const Duration(milliseconds: 4400));
  late final AnimationController _spin = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  late final AnimationController _flicker = AnimationController(vsync: this, duration: const Duration(seconds: 6));
  Timer? _drawDelay;
  bool _started = false;

  /// `@keyframes flicker{0%,100%{opacity:.5}50%{opacity:.28}}`, ease-in-out.
  static final _flickerOpacity = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: .5, end: .28).chain(CurveTween(curve: AppMotion.cssEaseInOut)), weight: 1),
    TweenSequenceItem(tween: Tween(begin: .28, end: .5).chain(CurveTween(curve: AppMotion.cssEaseInOut)), weight: 1),
  ]);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    final reduced = context.reduceMotion;
    // .line: animation draw 2.4s .3s ease forwards
    _drawDelay = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) return;
      if (reduced) {
        _draw.value = 1;
      } else {
        _draw.forward();
      }
    });
    if (reduced) {
      // One near-instant iteration: everything rests on its final frame.
      _fly.value = 1;
      _spin.value = 0;
      _flicker.value = 0;
    } else {
      _fly.repeat(reverse: true);
      _spin.repeat();
      _flicker.repeat();
    }
  }

  @override
  void dispose() {
    _drawDelay?.cancel();
    _draw.dispose();
    _fly.dispose();
    _spin.dispose();
    _flicker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final w = c.maxWidth, h = c.maxHeight;
        final view = _ViewBox.slice(w, h);
        return AnimatedScale(
          scale: widget.done ? 1.15 : 1,
          duration: AppMotion.of(context, const Duration(seconds: 1)),
          curve: AppMotion.ease,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // .glow
              Positioned(
                left: w / 2 - 210,
                top: h * .4 - 210,
                width: 420,
                height: 420,
                child: RepaintBoundary(
                  child: ImageFiltered(
                    imageFilter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10, tileMode: TileMode.decal),
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          // radial-gradient(circle …) is sized to the farthest corner.
                          radius: math.sqrt2 / 2,
                          colors: [
                            Color.fromRGBO(26, 107, 86, .95),
                            Color.fromRGBO(26, 107, 86, .35),
                            Color.fromRGBO(26, 107, 86, 0),
                          ],
                          stops: [0, .4, .68],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // svg.court
              Positioned.fill(
                child: RepaintBoundary(
                  child: CustomPaint(
                    painter: _CourtPainter(
                      view: view,
                      progress: CurvedAnimation(parent: _draw, curve: AppMotion.cssEase),
                    ),
                  ),
                ),
              ),
              // .beam.l / .beam.r
              _beam(left: -40, angle: -20, phase: 0),
              _beam(right: -40, angle: 20, phase: .5),
              // svg.trail
              Positioned.fill(
                child: RepaintBoundary(child: CustomPaint(painter: _TrailPainter(view))),
              ),
              // .ball
              AnimatedBuilder(
                animation: _fly,
                builder: (_, child) {
                  final p = view.map(_BallPath.at(const Cubic(.45, .05, .55, .95).transform(_fly.value)));
                  return Positioned(left: p.dx - 9, top: p.dy - 9, width: 18, height: 18, child: child!);
                },
                child: DecoratedBox(
                  // filter: drop-shadow(0 0 10px rgba(223,240,90,.6)) around the r=11 disc.
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: Color.fromRGBO(223, 240, 90, .6), blurRadius: 7.8)],
                  ),
                  child: RotationTransition(
                    turns: _spin,
                    child: SvgPicture.string(LoginSvgs.ball, width: 18, height: 18),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _beam({double? left, double? right, required double angle, required double phase}) => Positioned(
    left: left,
    right: right,
    top: -60,
    width: 170,
    height: 440,
    child: FadeTransition(
      opacity: _flicker.drive(_PhaseShift(phase)).drive(_flickerOpacity),
      child: Transform.rotate(
        angle: angle * math.pi / 180,
        child: const RepaintBoundary(child: CustomPaint(painter: _BeamPainter())),
      ),
    ),
  );
}

/// `animation-delay:-3s` on a 6s loop == start half way through.
class _PhaseShift extends Animatable<double> {
  final double phase;

  const _PhaseShift(this.phase);

  @override
  double transform(double t) => (t + phase) % 1;
}

/// SVG `viewBox="0 0 390 520" preserveAspectRatio="xMidYMin slice"`.
class _ViewBox {
  final double scale;
  final double dx;

  const _ViewBox(this.scale, this.dx);

  factory _ViewBox.slice(double w, double h) {
    final s = math.max(w / 390, h / 520);
    return _ViewBox(s, (w - 390 * s) / 2);
  }

  Offset map(Offset p) => Offset(dx + p.dx * scale, p.dy * scale);

  void apply(Canvas canvas) {
    canvas.translate(dx, 0);
    canvas.scale(scale);
  }

  @override
  bool operator ==(Object other) => other is _ViewBox && other.scale == scale && other.dx == dx;

  @override
  int get hashCode => Object.hash(scale, dx);
}

/// `M 330 300 Q 250 140 185 250 Q 130 150 60 235`
class _BallPath {
  static final Path path = Path()
    ..moveTo(330, 300)
    ..quadraticBezierTo(250, 140, 185, 250)
    ..quadraticBezierTo(130, 150, 60, 235);
  static final ui.PathMetric _metric = path.computeMetrics().first;

  /// `offset-distance` [t] (0–1) along the path, by arc length.
  static Offset at(double t) => _metric.getTangentForOffset(_metric.length * t.clamp(0.0, 1.0))!.position;
}

class _CourtPainter extends CustomPainter {
  final _ViewBox view;
  final Animation<double> progress;

  _CourtPainter({required this.view, required this.progress}) : super(repaint: progress);

  static Path _poly(List<double> pts) {
    final p = Path()..moveTo(pts[0], pts[1]);
    for (var i = 2; i < pts.length; i += 2) {
      p.lineTo(pts[i], pts[i + 1]);
    }
    return p..close();
  }

  static final _glass = [
    _poly([130, 190, 260, 190, 260, 150, 130, 150]),
    _poly([130, 190, 130, 150, -40, 420, -40, 500]),
    _poly([260, 190, 260, 150, 430, 420, 430, 500]),
  ];
  static final _lines = [
    _poly([130, 190, 260, 190, 430, 500, -40, 500]),
    Path()
      ..moveTo(118, 212)
      ..lineTo(272, 212),
    Path()
      ..moveTo(40, 355)
      ..lineTo(350, 355),
    Path()
      ..moveTo(195, 212)
      ..lineTo(195, 355),
  ];

  /// `stroke-dasharray:1200; stroke-dashoffset:<offset>` — the visible
  /// intervals of a path of length [len].
  static void _drawDashed(
    Canvas canvas,
    Path path,
    double offset,
    Paint paint, {
    double dash = 1200,
    double gap = 1200,
  }) {
    for (final m in path.computeMetrics()) {
      final period = dash + gap;
      for (var start = -offset; start < m.length; start += period) {
        final a = math.max(0.0, start), b = math.min(m.length, start + dash);
        if (b > a) canvas.drawPath(m.extractPath(a, b), paint);
      }
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    view.apply(canvas);
    const box = Rect.fromLTWH(0, 0, 390, 520);
    canvas.saveLayer(box.inflate(60), Paint());

    // .glass
    final glassFill = Paint()..color = const Color.fromRGBO(243, 238, 223, .03);
    final glassStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = const Color.fromRGBO(243, 238, 223, .1);
    for (final g in _glass) {
      canvas
        ..drawPath(g, glassFill)
        ..drawPath(g, glassStroke);
    }

    // .line — drawn in by animating the dash offset 1200 → 0.
    final line = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1
      ..color = AppColors.cream.withValues(alpha: .2);
    final offset = 1200 * (1 - progress.value);
    for (final l in _lines) {
      _drawDashed(canvas, l, offset, line);
    }

    // .net — the CSS class opacity (.3) wins over the dashed line's
    // presentation attribute, exactly as the browser renders it.
    final net = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3
      ..color = AppColors.cream.withValues(alpha: .3);
    canvas.drawLine(const Offset(92, 262), const Offset(298, 262), net);
    _drawDashed(
      canvas,
      Path()
        ..moveTo(92, 253)
        ..lineTo(298, 253),
      0,
      net,
      dash: 2,
      gap: 3,
    );

    // mask="url(#m)" — vertical fade.
    canvas.drawRect(
      box.inflate(60),
      Paint()
        ..blendMode = BlendMode.dstIn
        ..shader = ui.Gradient.linear(
          const Offset(0, 0),
          const Offset(0, 520),
          const [Color(0x00FFFFFF), Color(0x00FFFFFF), Color(0xFFFFFFFF), Color(0x80FFFFFF), Color(0x00FFFFFF)],
          const [0, .1, .35, .75, 1],
        ),
    );
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(_CourtPainter old) => old.view != view;
}

class _TrailPainter extends CustomPainter {
  final _ViewBox view;

  const _TrailPainter(this.view);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    view.apply(canvas);
    // stroke:url(#trailGrad) over the path's bounding box (x 60 → 330), opacity .45.
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1
      ..shader = ui.Gradient.linear(
        const Offset(60, 0),
        const Offset(330, 0),
        [
          AppColors.ball.withValues(alpha: 0),
          AppColors.ball.withValues(alpha: .45),
          AppColors.ball.withValues(alpha: 0),
        ],
        const [0, .5, 1],
      );
    _CourtPainter._drawDashed(canvas, _BallPath.path, 0, paint, dash: 3, gap: 6);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_TrailPainter old) => old.view != view;
}

class _BeamPainter extends CustomPainter {
  const _BeamPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    // linear-gradient(180deg, rgba(243,238,223,.22), transparent 75%); filter: blur(16px)
    canvas.drawRect(
      rect,
      Paint()
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16)
        ..shader = ui.Gradient.linear(
          rect.topCenter,
          rect.bottomCenter,
          const [Color.fromRGBO(243, 238, 223, .22), Color.fromRGBO(243, 238, 223, 0)],
          const [0, .75],
        ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
