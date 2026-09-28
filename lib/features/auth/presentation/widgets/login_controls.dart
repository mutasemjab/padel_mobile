import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';

/// Inline SVGs copied from `login.html`.
class LoginSvgs {
  const LoginSvgs._();

  static const flagJo =
      '<svg viewBox="0 0 30 20"><rect width="30" height="20" fill="#fff"/><rect width="30" height="6.67" fill="#000"/><rect y="13.33" width="30" height="6.67" fill="#007a3d"/><path d="M0 0 15 10 0 20z" fill="#ce1126"/><circle cx="5.2" cy="10" r="1.4" fill="#fff"/></svg>';
  static const check =
      '<svg width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="#06261f" stroke-width="3.2" stroke-linecap="round" stroke-linejoin="round"><path d="M5 12.5l4.5 4.5L19 7.5"/></svg>';
  static const apple =
      '<svg width="18" height="18" viewBox="0 0 24 24" fill="#111"><path d="M16.37 12.6c-.02-2.3 1.88-3.4 1.96-3.46-1.07-1.56-2.73-1.77-3.32-1.8-1.41-.14-2.76.83-3.47.83-.72 0-1.82-.81-2.99-.79-1.54.02-2.96.9-3.75 2.27-1.6 2.78-.41 6.89 1.15 9.14.76 1.1 1.67 2.34 2.86 2.3 1.15-.05 1.58-.74 2.97-.74 1.38 0 1.77.74 2.98.72 1.23-.02 2.01-1.12 2.76-2.23.87-1.28 1.23-2.52 1.25-2.58-.03-.01-2.4-.92-2.42-3.66zM14.1 5.86c.63-.77 1.06-1.83.94-2.89-.91.04-2.02.61-2.67 1.37-.58.67-1.09 1.76-.96 2.8 1.02.08 2.06-.52 2.69-1.28z"/></svg>';
  static const google =
      '<svg width="18" height="18" viewBox="0 0 24 24"><path fill="#4285F4" d="M22.5 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.9a5.05 5.05 0 0 1-2.19 3.31v2.75h3.54c2.08-1.91 3.25-4.73 3.25-8.07z"/><path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.54-2.75c-.98.66-2.24 1.06-3.74 1.06-2.87 0-5.3-1.94-6.17-4.55H2.18v2.84A11 11 0 0 0 12 23z"/><path fill="#FBBC05" d="M5.83 14.1a6.6 6.6 0 0 1 0-4.2V7.06H2.18a11 11 0 0 0 0 9.88l3.65-2.84z"/><path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15A10.97 10.97 0 0 0 12 1 11 11 0 0 0 2.18 7.06l3.65 2.84C6.7 7.3 9.13 5.38 12 5.38z"/></svg>';
  static const chevron =
      '<svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="#f3eedf" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M9 6l6 6-6 6"/></svg>';
  static const ball =
      '<svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="11" fill="#dff05a"/><path d="M3 7c4 1 6 4 6 7s-2 6-5 7M21 7c-4 1-6 4-6 7s2 6 5 7" stroke="#f7fbd9" stroke-width="1.4" fill="none" stroke-linecap="round"/></svg>';
}

/// `.kicker` — gold eyebrow with the glowing ball dot.
class LoginKicker extends StatelessWidget {
  final String text;

  const LoginKicker(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Container(
        width: 6,
        height: 6,
        decoration: const BoxDecoration(
          color: AppColors.ball,
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(color: AppColors.ball, blurRadius: 10)],
        ),
      ),
      const SizedBox(width: 8),
      Flexible(
        child: Text(text, style: AppFonts.body(size: 12, color: AppColors.goldSoft, letterSpacing: .3)),
      ),
    ],
  );
}

/// `h1` + `.sub` shared by both steps.
class LoginHeading extends StatelessWidget {
  final String title;
  final Widget subtitle;

  const LoginHeading({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 6),
      Text(title, style: AppFonts.display()),
      const SizedBox(height: 4),
      DefaultTextStyle.merge(
        style: AppFonts.body(size: 13.5, height: 1.7, color: AppColors.cream40),
        child: subtitle,
      ),
    ],
  );
}

/// Shared `.btn` press feedback: `:active{transform:scale(.97)}` over .15s.
class _Pressable extends StatefulWidget {
  final VoidCallback? onTap;
  final Widget child;

  const _Pressable({required this.onTap, required this.child});

  @override
  State<_Pressable> createState() => _PressableState();
}

class _PressableState extends State<_Pressable> {
  bool _down = false;

  void _set(bool v) {
    if (widget.onTap != null && _down != v) setState(() => _down = v);
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTapDown: (_) => _set(true),
    onTapUp: (_) => _set(false),
    onTapCancel: () => _set(false),
    onTap: widget.onTap,
    child: AnimatedScale(
      scale: _down ? .97 : 1,
      duration: AppMotion.of(context, const Duration(milliseconds: 150)),
      curve: AppMotion.cssEase,
      child: widget.child,
    ),
  );
}

/// `.btn.btn-gold` — gradient, glow, periodic sheen, disabled filter, spinner.
class GoldButton extends StatefulWidget {
  final String label;
  final bool enabled;
  final bool loading;
  final VoidCallback onPressed;

  const GoldButton({
    super.key,
    required this.label,
    required this.enabled,
    required this.loading,
    required this.onPressed,
  });

  @override
  State<GoldButton> createState() => _GoldButtonState();
}

class _GoldButtonState extends State<GoldButton> with TickerProviderStateMixin {
  late final AnimationController _sheen = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 3200),
  );
  Timer? _sheenDelay;

  static final _sheenX = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: -1.2, end: 1.2).chain(CurveTween(curve: AppMotion.cssEaseInOut)), weight: 40),
    TweenSequenceItem(tween: ConstantTween(1.2), weight: 60),
  ]);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncSheen();
  }

  @override
  void didUpdateWidget(GoldButton old) {
    super.didUpdateWidget(old);
    if (old.enabled != widget.enabled) _syncSheen();
  }

  /// `.btn-gold:not(:disabled)::after{animation:sheen 3.2s 1s ease-in-out infinite}`
  void _syncSheen() {
    _sheenDelay?.cancel();
    _sheen.stop();
    _sheen.value = 0;
    if (!widget.enabled) return;
    final reduced = context.reduceMotion;
    _sheenDelay = Timer(const Duration(seconds: 1), () {
      if (!mounted) return;
      if (reduced) {
        _sheen.value = 1;
      } else {
        _sheen.repeat();
      }
    });
  }

  @override
  void dispose() {
    _sheenDelay?.cancel();
    _sheen.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final interactive = widget.enabled && !widget.loading;
    return Semantics(
      button: true,
      enabled: widget.enabled,
      label: widget.label,
      excludeSemantics: true,
      child: _Pressable(
        onTap: interactive ? widget.onPressed : null,
        child: TweenAnimationBuilder<double>(
          tween: Tween(end: widget.enabled ? 0 : 1),
          duration: AppMotion.of(context, const Duration(milliseconds: 300)),
          curve: AppMotion.cssEase,
          child: SizedBox(
            height: 58,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: CssLinearGradient(145, colors: [AppColors.goldSoft, AppColors.gold]),
                    ),
                  ),
                  Center(
                    child: widget.loading
                        ? const _Spinner()
                        : Text(
                            widget.label,
                            style: AppFonts.body(size: 15.5, weight: FontWeight.w600, color: AppColors.green900),
                          ),
                  ),
                  AnimatedBuilder(
                    animation: _sheen,
                    builder: (_, _) => FractionalTranslation(
                      translation: Offset(_sheenX.transform(_sheen.value), 0),
                      child: const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: CssLinearGradient(
                            115,
                            colors: [Color(0x00FFFFFF), Color(0x73FFFFFF), Color(0x00FFFFFF)],
                            stops: [.35, .5, .65],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          builder: (context, d, child) => DecoratedBox(
            // box-shadow:0 14px 30px -12px rgba(201,168,106,.7); none when disabled.
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(201, 168, 106, .7).withValues(alpha: .7 * (1 - d)),
                  offset: const Offset(0, 14),
                  blurRadius: 30,
                  spreadRadius: -12,
                ),
              ],
            ),
            child: d == 0 ? child : ColorFiltered(colorFilter: ColorFilter.matrix(_disabledMatrix(d)), child: child),
          ),
        ),
      ),
    );
  }

  /// `filter: saturate(.3) brightness(.6)`, interpolated by [d] for the .3s
  /// filter transition.
  static List<double> _disabledMatrix(double d) {
    final s = 1 - .7 * d;
    final b = 1 - .4 * d;
    return [
      (.2126 + .7874 * s) * b,
      (.7152 - .7152 * s) * b,
      (.0722 - .0722 * s) * b,
      0,
      0,
      (.2126 - .2126 * s) * b,
      (.7152 + .2848 * s) * b,
      (.0722 - .0722 * s) * b,
      0,
      0,
      (.2126 - .2126 * s) * b,
      (.7152 - .7152 * s) * b,
      (.0722 + .9278 * s) * b,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ];
  }
}

/// `.btn .spin` — 18px ring, spin .8s linear.
class _Spinner extends StatefulWidget {
  const _Spinner();

  @override
  State<_Spinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<_Spinner> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!context.reduceMotion) _c.repeat();
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => RotationTransition(
    turns: _c,
    child: CustomPaint(size: const Size.square(18), painter: _SpinnerPainter()),
  );
}

class _SpinnerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = (Offset.zero & size).deflate(1);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawOval(rect, paint..color = const Color.fromRGBO(6, 38, 31, .3));
    // border-top-color: the top quarter of the ring (from -135° to -45°).
    canvas.drawArc(rect, -2.356, 1.571, false, paint..color = AppColors.green900);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// `.socials .btn` — `.btn-cream` (Apple) or `.btn-ghost` (Google).
class SocialSignInButton extends StatelessWidget {
  final String label;
  final String svg;
  final bool cream;
  final VoidCallback? onTap;

  /// Provider sheet / backend exchange in flight: spinner instead of the logo.
  final bool loading;

  const SocialSignInButton({
    super.key,
    required this.label,
    required this.svg,
    required this.cream,
    this.onTap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    label: label,
    excludeSemantics: true,
    child: _Pressable(
      onTap: loading ? null : onTap,
      child: Container(
        height: 54,
        decoration: BoxDecoration(
          color: cream ? AppColors.cream : AppColors.cream08,
          borderRadius: BorderRadius.circular(18),
          border: cream ? null : Border.all(color: AppColors.cream15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading)
              SizedBox.square(
                dimension: 18,
                child: CircularProgressIndicator(strokeWidth: 2, color: cream ? AppColors.green900 : AppColors.cream),
              )
            else
              SvgPicture.string(svg, width: 18, height: 18),
            const SizedBox(width: 10),
            Text(
              label,
              style: AppFonts.body(
                size: 14,
                weight: FontWeight.w500,
                color: cream ? const Color(0xFF111111) : AppColors.cream,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

/// Top border of a rounded panel that tapers along the corners, like CSS
/// `border-top` on an element with `border-radius` (Flutter can't combine a
/// single-side border with a radius).
class TopHairlinePainter extends CustomPainter {
  final Color color;
  final double radius;

  const TopHairlinePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final outer = RRect.fromRectAndCorners(
      Offset.zero & size,
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );
    // Inner edge: inset 1px on top only, so the stroke is 1px at the top and
    // thins to 0 where the corners meet the (border-less) sides.
    final inner = RRect.fromLTRBAndCorners(
      0,
      1,
      size.width,
      size.height,
      topLeft: Radius.elliptical(radius, radius - 1),
      topRight: Radius.elliptical(radius, radius - 1),
    );
    canvas.drawDRRect(outer, inner, Paint()..color = color);
  }

  @override
  bool shouldRepaint(TopHairlinePainter old) => old.color != color || old.radius != radius;
}

/// `box-shadow: inset 0 1px 0 <color>` on a rounded box.
class InsetTopHighlightPainter extends CustomPainter {
  final Color color;
  final double radius;

  const InsetTopHighlightPainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final box = RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius));
    final path = Path.combine(
      PathOperation.difference,
      Path()..addRRect(box),
      Path()..addRRect(box.shift(const Offset(0, 1))),
    );
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(InsetTopHighlightPainter old) => old.color != color || old.radius != radius;
}

/// A CSS outer `box-shadow`: unlike [BoxShadow] in a [BoxDecoration], the
/// browser never paints it underneath the box itself, which matters for the
/// translucent, backdrop-blurred panels in this design.
class OuterShadowPainter extends CustomPainter {
  final BoxShadow shadow;
  final BorderRadius radius;

  const OuterShadowPainter({required this.shadow, required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final box = Offset.zero & size;
    final spread = shadow.spreadRadius;
    Radius grow(Radius r) => Radius.elliptical(math.max(0, r.x + spread), math.max(0, r.y + spread));
    final shadowBox = RRect.fromRectAndCorners(
      box.shift(shadow.offset).inflate(spread),
      topLeft: grow(radius.topLeft),
      topRight: grow(radius.topRight),
      bottomLeft: grow(radius.bottomLeft),
      bottomRight: grow(radius.bottomRight),
    );
    canvas
      ..save()
      ..clipPath(
        Path.combine(
          PathOperation.difference,
          Path()..addRect(box.inflate(shadow.blurRadius * 2 + spread.abs() + shadow.offset.distance)),
          Path()..addRRect(radius.toRRect(box)),
        ),
      )
      ..drawRRect(shadowBox, shadow.toPaint())
      ..restore();
  }

  @override
  bool shouldRepaint(OuterShadowPainter old) => old.shadow != shadow || old.radius != radius;
}

/// Input decoration with nothing of its own: no fill, no borders in any state.
/// `InputDecoration.collapsed` alone still inherits the app theme's
/// `focusedBorder`, which drew a small box around the text on focus.
InputDecoration bareInputDecoration({String? hintText, TextStyle? hintStyle}) => InputDecoration(
  isCollapsed: true,
  filled: false,
  contentPadding: EdgeInsets.zero,
  hintText: hintText,
  hintStyle: hintStyle,
  border: InputBorder.none,
  enabledBorder: InputBorder.none,
  focusedBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  focusedErrorBorder: InputBorder.none,
  hoverColor: AppColors.transparent,
  focusColor: AppColors.transparent,
);
