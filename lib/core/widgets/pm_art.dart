import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_effects.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_tokens.dart';
import '../theme/app_theme.dart';
import 'app_logo.dart';

/// The home hero's perspective court (glass walls, service lines, net),
/// fading out halfway down. Drawn in the design's 358×400 box with
/// `xMidYMin slice`.
class PmCourtArt extends StatelessWidget {
  final double opacity;

  const PmCourtArt({super.key, this.opacity = 1});

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: RepaintBoundary(child: CustomPaint(painter: _CourtPainter(opacity), size: Size.infinite)),
  );
}

class _CourtPainter extends CustomPainter {
  final double opacity;

  _CourtPainter(this.opacity);

  @override
  void paint(Canvas canvas, Size size) {
    final s = math.max(size.width / 358, size.height / 400);
    final dx = (size.width - 358 * s) / 2;
    Offset p(double x, double y) => Offset(dx + x * s, y * s);
    Path poly(List<double> xy) {
      final path = Path()..moveTo(p(xy[0], xy[1]).dx, p(xy[0], xy[1]).dy);
      for (var i = 2; i < xy.length; i += 2) {
        path.lineTo(p(xy[i], xy[i + 1]).dx, p(xy[i], xy[i + 1]).dy);
      }
      return path..close();
    }

    canvas.saveLayer(Offset.zero & size, Paint());
    final glassFill = Paint()..color = AppColors.cream.withValues(alpha: .03 * opacity);
    final glassEdge = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = AppColors.cream.withValues(alpha: .1 * opacity);
    for (final g in [
      [112.0, 40.0, 246.0, 40.0, 246.0, 10.0, 112.0, 10.0],
      [112.0, 40.0, 112.0, 10.0, -20.0, 190.0, -20.0, 260.0],
      [246.0, 40.0, 246.0, 10.0, 378.0, 190.0, 378.0, 260.0],
    ]) {
      final path = poly(g);
      canvas
        ..drawPath(path, glassFill)
        ..drawPath(path, glassEdge);
    }
    final line = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1
      ..color = AppColors.cream.withValues(alpha: .2 * opacity);
    canvas
      ..drawPath(poly([112, 40, 246, 40, 378, 260, -20, 260]), line)
      ..drawLine(p(100, 60), p(258, 60), line)
      ..drawLine(p(32, 175), p(326, 175), line)
      ..drawLine(p(179, 60), p(179, 175), line)
      ..drawLine(
        p(77, 96),
        p(281, 96),
        Paint()
          ..strokeWidth = 1.4
          ..color = AppColors.cream.withValues(alpha: .32 * opacity),
      );
    // mask: white → .7 at 30% → transparent at 50%
    final h = 400 * s;
    canvas.drawRect(
      Offset.zero & size,
      Paint()
        ..blendMode = BlendMode.dstIn
        ..shader = ui.Gradient.linear(
          Offset.zero,
          Offset(0, h),
          [const Color(0xFFFFFFFF), const Color(0xB3FFFFFF), const Color(0x00FFFFFF)],
          const [0, .3, .5],
        ),
    );
    canvas.restore();
  }

  @override
  bool shouldRepaint(_CourtPainter old) => old.opacity != opacity;
}

/// The lime padel ball, as drawn in the login and home designs.
class PmBall extends StatelessWidget {
  final double size;

  const PmBall({super.key, this.size = 18});

  @override
  Widget build(BuildContext context) => SizedBox.square(dimension: size, child: CustomPaint(painter: _BallPainter()));
}

class _BallPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final k = size.width / 24;
    canvas.scale(k);
    canvas.drawCircle(const Offset(12, 12), 11, Paint()..color = AppColors.ball);
    final seam = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeCap = StrokeCap.round
      ..color = AppColors.ballSeam;
    canvas
      ..drawPath(Path()..moveTo(3, 7)..cubicTo(7, 8, 9, 11, 9, 14)..cubicTo(9, 17, 7, 20, 4, 21), seam)
      ..drawPath(Path()..moveTo(21, 7)..cubicTo(17, 8, 15, 11, 15, 14)..cubicTo(15, 17, 17, 20, 20, 21), seam);
  }

  @override
  bool shouldRepaint(_BallPainter old) => false;
}

/// The ball flying its arc over the hero court (`offset-path` in the design),
/// spinning, with the lime glow. Rests mid-arc when motion is reduced.
class PmFlyingBall extends StatefulWidget {
  const PmFlyingBall({super.key});

  @override
  State<PmFlyingBall> createState() => _PmFlyingBallState();
}

class _PmFlyingBallState extends State<PmFlyingBall> with TickerProviderStateMixin {
  late final AnimationController _fly = AnimationController(vsync: this, duration: const Duration(milliseconds: 4400));
  late final AnimationController _spin = AnimationController(vsync: this, duration: const Duration(seconds: 1));
  static const _curve = Cubic(.45, .05, .55, .95);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.reduceMotion) {
      _fly.value = .5;
      _spin.stop();
    } else if (!_fly.isAnimating) {
      _fly.repeat(reverse: true);
      _spin.repeat();
    }
  }

  @override
  void dispose() {
    _fly.dispose();
    _spin.dispose();
    super.dispose();
  }

  /// `M 300 92 Q 230 -6 160 84 Q 110 14 40 70`, by arc length (approximated per half).
  static Offset _at(double t) {
    Offset q(Offset a, Offset c, Offset b, double u) => a * ((1 - u) * (1 - u)) + c * (2 * (1 - u) * u) + b * (u * u);
    if (t < .55) return q(const Offset(300, 92), const Offset(230, -6), const Offset(160, 84), t / .55);
    return q(const Offset(160, 84), const Offset(110, 14), const Offset(40, 70), (t - .55) / .45);
  }

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: LayoutBuilder(
      builder: (context, c) {
        final s = math.max(c.maxWidth / 358, c.maxHeight / 400);
        final dx = (c.maxWidth - 358 * s) / 2;
        return AnimatedBuilder(
          animation: Listenable.merge([_fly, _spin]),
          builder: (context, _) {
            final o = _at(_curve.transform(_fly.value));
            return Stack(
              children: [
                Positioned(
                  left: dx + o.dx * s - 9,
                  top: o.dy * s - 9,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(color: Color(0x99DFF05A), blurRadius: 14)],
                    ),
                    child: Transform.rotate(angle: _spin.value * 2 * math.pi, child: const PmBall()),
                  ),
                ),
              ],
            );
          },
        );
      },
    ),
  );
}

/// Diagonal light sweeping across a panel every 8s (`.sheen`).
class PmSheen extends StatefulWidget {
  const PmSheen({super.key});

  @override
  State<PmSheen> createState() => _PmSheenState();
}

class _PmSheenState extends State<PmSheen> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(seconds: 8));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!context.reduceMotion && !_c.isAnimating) _c.repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (context.reduceMotion) return const SizedBox.shrink();
    return IgnorePointer(
      child: AnimatedBuilder(
        animation: _c,
        builder: (context, _) {
          final v = Curves.easeInOut.transform((_c.value / .35).clamp(0, 1));
          return FractionalTranslation(
            translation: Offset(-1.2 + 2.4 * v, 0),
            child: const DecoratedBox(
              decoration: BoxDecoration(
                gradient: CssLinearGradient(
                  115,
                  colors: [Color(0x00FFFFFF), Color(0x0FFFFFFF), Color(0x00FFFFFF)],
                  stops: [.35, .48, .6],
                ),
              ),
              child: SizedBox.expand(),
            ),
          );
        },
      ),
    );
  }
}

/// Deep court panel with the green aura, optional court art, flying ball and
/// sheen — the home hero card, reusable for every page's headline block.
class PmHeroPanel extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool court;
  final bool ball;
  final Color? borderColor;
  final Gradient? aura;
  final BorderRadius radius;

  const PmHeroPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 18),
    this.court = true,
    this.ball = false,
    this.borderColor,
    this.aura,
    this.radius = const BorderRadius.all(Radius.circular(30)),
  });

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: AppGlass.hero(radius: radius, border: borderColor),
    child: ClipRRect(
      borderRadius: radius,
      child: Stack(
        children: [
          Positioned.fill(child: DecoratedBox(decoration: BoxDecoration(gradient: aura ?? AppGlass.aura))),
          if (court) const Positioned.fill(child: PmCourtArt()),
          if (ball) const Positioned.fill(child: PmFlyingBall()),
          const Positioned.fill(child: PmSheen()),
          // inset 0 1px 0 rgba(255,255,255,.08)
          const Positioned(top: 0, left: 24, right: 24, child: SizedBox(height: 1, child: ColoredBox(color: Color(0x14FFFFFF)))),
          Padding(padding: padding, child: PmNightCourt(child: child)),
        ],
      ),
    ),
  );
}

/// Court panels are night-green in both themes, so whatever sits on them
/// (cards, chips, buttons) is themed dark — no cream cards on green in light.
class PmNightCourt extends StatelessWidget {
  final Widget child;

  const PmNightCourt({super.key, required this.child});

  static final Map<String, ThemeData> _cache = {};

  @override
  Widget build(BuildContext context) {
    if (context.tokens.isDark) return child;
    final lang = Localizations.maybeLocaleOf(context)?.languageCode ?? 'ar';
    return Theme(data: _cache[lang] ??= AppTheme.dark(languageCode: lang), child: child);
  }
}

/// Gold-leaf text (`linear-gradient(180deg,#fffbef,var(--gold-soft) 60%,var(--gold))`).
class PmGoldText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;

  const PmGoldText(this.text, {super.key, required this.style, this.textAlign});

  @override
  Widget build(BuildContext context) => ShaderMask(
    blendMode: BlendMode.srcIn,
    shaderCallback: (r) => const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: AppGradients.goldLeaf,
      stops: [0, .6, 1],
    ).createShader(r),
    child: Text(text, style: style.copyWith(color: AppColors.white), textAlign: textAlign),
  );
}

/// `.seal` — the "PLAYMAKER RANKED" gold plate with the P mark.
class PmSeal extends StatelessWidget {
  final String label;

  const PmSeal(this.label, {super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsetsDirectional.fromSTEB(9, 4, 10, 4),
    decoration: BoxDecoration(gradient: AppGradients.goldButton, borderRadius: BorderRadius.circular(8)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: TextDirection.ltr,
      children: [
        const AppLogo(height: 10, colors: [AppColors.green900, AppColors.green900]),
        const SizedBox(width: 6),
        Text(
          label.toUpperCase(),
          style: AppFonts.body(size: 10, weight: FontWeight.w700, color: AppColors.green900, letterSpacing: .3),
        ),
      ],
    ),
  );
}

enum PmChipTone { gold, live, muted, ball }

/// `.chip` — frosted pill with an optional glowing dot.
class PmChip extends StatelessWidget {
  final String label;
  final PmChipTone tone;
  final bool dot;
  final IconData? icon;

  const PmChip(this.label, {super.key, this.tone = PmChipTone.gold, this.dot = false, this.icon});

  @override
  Widget build(BuildContext context) {
    final dark = context.tokens.isDark;
    final (fg, border, bg, dotColor) = switch (tone) {
      PmChipTone.live => (const Color(0xFFFFD9D4), const Color(0x73FF6A5C), const Color(0x1FFF6A5C), AppColors.live),
      PmChipTone.muted => (
        dark ? AppColors.cream70 : AppColors.lightTextMuted,
        dark ? AppColors.cream15 : AppColors.lightOutline,
        dark ? const Color(0x8C06261F) : AppColors.ivory,
        AppColors.ball,
      ),
      PmChipTone.ball => dark
          ? (AppColors.ball, const Color(0x47DFF05A), const Color(0x1FDFF05A), AppColors.ball)
          : (AppColors.green700, AppColors.green600.withValues(alpha: .35), AppColors.green600.withValues(alpha: .08), AppColors.green600),
      PmChipTone.gold => (
        dark ? AppColors.goldSoft : AppColors.green800,
        dark ? const Color(0x40E3CC97) : AppColors.lightOutline,
        dark ? const Color(0x8C06261F) : AppColors.ivory,
        AppColors.ball,
      ),
    };
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 11, vertical: 5),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(99), border: Border.all(color: border)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (dot) ...[PmPulseDot(color: dotColor), const SizedBox(width: 7)],
          if (icon != null) ...[Icon(icon, size: 13, color: fg), const SizedBox(width: 5)],
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.body(size: 11.5, weight: FontWeight.w500, color: fg),
            ),
          ),
        ],
      ),
    );
  }
}

/// Glowing dot that breathes (`animation: pulse 1.8s infinite`).
class PmPulseDot extends StatefulWidget {
  final Color color;
  final double size;

  const PmPulseDot({super.key, this.color = AppColors.ball, this.size = 6});

  @override
  State<PmPulseDot> createState() => _PmPulseDotState();
}

class _PmPulseDotState extends State<PmPulseDot> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 1800));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!context.reduceMotion && !_c.isAnimating) _c.repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => FadeTransition(
    opacity: TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1, end: .3), weight: 1),
      TweenSequenceItem(tween: Tween(begin: .3, end: 1), weight: 1),
    ]).animate(_c),
    child: Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: widget.color,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: widget.color, blurRadius: 10)],
      ),
    ),
  );
}

/// The C → Elite ladder: done segments in gold, the player's segment half
/// filled, and the lime marker on it.
class PmLevelLadder extends StatelessWidget {
  final String? level;

  const PmLevelLadder({super.key, required this.level});

  static const levels = ['C', 'C+', 'B', 'B+', 'A', 'A+', 'Elite'];

  @override
  Widget build(BuildContext context) {
    final i = levels.indexOf(level ?? '');
    final dark = context.tokens.isDark;
    final track = dark ? AppColors.cream08 : AppColors.lightOutline;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: LayoutBuilder(
        builder: (context, c) {
          const gap = 3.0;
          final seg = (c.maxWidth - gap * 6) / 7;
          return Column(
            children: [
              SizedBox(
                height: 13,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 4,
                      left: 0,
                      right: 0,
                      child: Row(
                        children: [
                          for (var k = 0; k < 7; k++) ...[
                            if (k > 0) const SizedBox(width: gap),
                            Container(
                              width: seg,
                              height: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                color: k < i ? null : (k == i ? null : track),
                                gradient: k < i
                                    ? const LinearGradient(colors: [AppColors.gold, AppColors.goldSoft])
                                    : k == i
                                    ? LinearGradient(colors: [AppColors.goldSoft, AppColors.goldSoft, track, track], stops: const [0, .5, .5, 1])
                                    : null,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    if (i >= 0)
                      Positioned(
                        top: 0,
                        left: i * (seg + gap) + seg / 2 - 6.5,
                        child: Container(
                          width: 13,
                          height: 13,
                          decoration: BoxDecoration(
                            color: AppColors.ball,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.green800, width: 3),
                            boxShadow: const [BoxShadow(color: AppColors.ball, blurRadius: 14)],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  for (var k = 0; k < 7; k++)
                    Expanded(
                      child: Text(
                        levels[k],
                        textAlign: TextAlign.center,
                        style: AppFonts.numeral(
                          size: 10,
                          weight: k == i ? FontWeight.w700 : FontWeight.w500,
                          color: k == i ? (dark ? AppColors.ball : AppColors.green700) : (dark ? AppColors.cream40 : AppColors.lightTextMuted),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

/// 42px frosted square for header actions (`.icon-btn`), with optional red dot.
class PmIconSquare extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final String? tooltip;
  final Widget? badge;

  const PmIconSquare({super.key, required this.icon, this.onTap, this.tooltip, this.badge});

  @override
  Widget build(BuildContext context) {
    final dark = context.tokens.isDark;
    final box = Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: dark ? AppColors.cream08 : AppColors.ivory,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: dark ? AppColors.cream15 : AppColors.lightOutline),
      ),
      child: Icon(icon, size: 20, color: dark ? AppColors.cream : AppColors.green800),
    );
    final child = Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          clipBehavior: Clip.none,
          children: [box, if (badge != null) PositionedDirectional(top: -4, end: -4, child: badge!)],
        ),
      ),
    );
    return tooltip == null ? child : Tooltip(message: tooltip!, child: child);
  }
}

/// The live point in 80px gold-leaf Playfair that flips on change.
class PmGoldDigit extends StatelessWidget {
  final String value;

  const PmGoldDigit({super.key, required this.value});

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
    duration: context.reduceMotion ? Duration.zero : const Duration(milliseconds: 260),
    transitionBuilder: (child, a) => FadeTransition(
      opacity: a,
      child: SlideTransition(position: Tween(begin: const Offset(0, .25), end: Offset.zero).animate(a), child: child),
    ),
    child: PmGoldText(
      value,
      key: ValueKey(value),
      style: AppFonts.numeral(size: 80, height: 1, fontFeatures: AppTypography.tabular),
    ),
  );
}

/// The home design's social card edge: a dashed cream outline around glass
/// (`border:1px dashed`), so casual play never reads as official.
class PmDashedBorder extends StatelessWidget {
  final Widget child;
  final BorderRadius radius;
  final Color? color;

  const PmDashedBorder({super.key, required this.child, this.radius = const BorderRadius.all(Radius.circular(22)), this.color});

  @override
  Widget build(BuildContext context) => CustomPaint(
    foregroundPainter: _DashPainter(
      color ?? (context.tokens.isDark ? const Color(0x47F3EEDF) : AppColors.lightTextMuted.withValues(alpha: .45)),
      radius,
    ),
    child: child,
  );
}

class _DashPainter extends CustomPainter {
  final Color color;
  final BorderRadius radius;

  _DashPainter(this.color, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()..addRRect(radius.toRRect((Offset.zero & size).deflate(.5)));
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    for (final m in path.computeMetrics()) {
      for (double d = 0; d < m.length; d += 9) {
        canvas.drawPath(m.extractPath(d, math.min(d + 5, m.length)), paint);
      }
    }
  }

  @override
  bool shouldRepaint(_DashPainter old) => old.color != color || old.radius != radius;
}
