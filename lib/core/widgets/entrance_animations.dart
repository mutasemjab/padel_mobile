import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_effects.dart';

/// Runs a one-shot keyframe animation once [play] is true, after [delay].
/// Before it starts the builder sees `0` (the CSS `from` state) — every
/// entrance in the design is either `both`/`backwards` filled or starts from
/// an invisible base style, so this matches the browser. Setting [play] back
/// to false resets it (used by "replay").
class EntranceAnimation extends StatefulWidget {
  final bool play;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final Widget? child;
  final Widget Function(BuildContext context, double t, Widget? child) builder;

  const EntranceAnimation({
    super.key,
    this.play = true,
    this.delay = Duration.zero,
    required this.duration,
    this.curve = AppMotion.ease,
    this.child,
    required this.builder,
  });

  @override
  State<EntranceAnimation> createState() => _EntranceAnimationState();
}

class _EntranceAnimationState extends State<EntranceAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this);
  Timer? _timer;
  bool _started = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _c.duration = AppMotion.of(context, widget.duration);
    if (!_started && widget.play) _start();
  }

  @override
  void didUpdateWidget(EntranceAnimation old) {
    super.didUpdateWidget(old);
    if (widget.play && !old.play) _start();
    if (!widget.play && old.play) {
      _timer?.cancel();
      _started = false;
      _c.value = 0;
    }
  }

  void _start() {
    _started = true;
    _timer?.cancel();
    _timer = Timer(widget.delay, () {
      if (mounted) _c.forward(from: 0);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _c,
    child: widget.child,
    builder: (context, child) => widget.builder(context, widget.curve.transform(_c.value), child),
  );
}

/// `@keyframes rise{from{opacity:0;transform:translateY(16px)}to{opacity:1;transform:none}}`
class RiseIn extends StatelessWidget {
  final bool play;
  final Duration delay;
  final Duration duration;
  final Widget child;

  const RiseIn({
    super.key,
    this.play = true,
    required this.delay,
    this.duration = const Duration(milliseconds: 900),
    required this.child,
  });

  @override
  Widget build(BuildContext context) => EntranceAnimation(
    play: play,
    delay: delay,
    duration: duration,
    child: child,
    builder: (_, t, child) => Opacity(
      opacity: t.clamp(0.0, 1.0),
      child: Transform.translate(offset: Offset(0, 16 * (1 - t)), child: child),
    ),
  );
}

/// `@keyframes pop{from{opacity:0;transform:scale(.6)}to{opacity:1;transform:scale(1)}}`
class PopIn extends StatelessWidget {
  final bool play;
  final Duration delay;
  final Duration duration;
  final Widget child;

  /// Base style before the animation starts (`.w-ring .mark` sits at
  /// `scale(.4); opacity:0` until it pops).
  final double hiddenScale;

  const PopIn({
    super.key,
    this.play = true,
    required this.delay,
    required this.duration,
    this.hiddenScale = .6,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => EntranceAnimation(
    play: play,
    delay: delay,
    duration: duration,
    child: child,
    builder: (_, t, child) => Opacity(
      opacity: t.clamp(0.0, 1.0),
      child: Transform.scale(scale: t == 0 ? hiddenScale : .6 + .4 * t, child: child),
    ),
  );
}

/// `@keyframes shake{20%,60%{translateX(-6px)}40%,80%{translateX(6px)}}` over
/// .4s, replayed every time [trigger] changes.
class ShakeX extends StatefulWidget {
  final int trigger;
  final Widget child;

  const ShakeX({super.key, required this.trigger, required this.child});

  @override
  State<ShakeX> createState() => _ShakeXState();
}

class _ShakeXState extends State<ShakeX> with SingleTickerProviderStateMixin {
  late final AnimationController _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));

  static final _x = TweenSequence<double>([
    for (final (a, b) in const [(0.0, -6.0), (-6.0, 6.0), (6.0, -6.0), (-6.0, 6.0), (6.0, 0.0)])
      TweenSequenceItem(
        tween: Tween(begin: a, end: b).chain(CurveTween(curve: AppMotion.cssEase)),
        weight: 1,
      ),
  ]);

  @override
  void didUpdateWidget(ShakeX old) {
    super.didUpdateWidget(old);
    if (widget.trigger != old.trigger) {
      _c.duration = AppMotion.of(context, const Duration(milliseconds: 400));
      _c.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: _c,
    child: widget.child,
    builder: (_, child) =>
        Transform.translate(offset: Offset(_c.isAnimating ? _x.transform(_c.value) : 0, 0), child: child),
  );
}
