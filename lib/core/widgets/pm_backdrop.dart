import 'dart:async';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_tokens.dart';

/// The login screen's atmosphere for every page: the court-green depth
/// gradient, two floodlight auras and the film grain. Painted once per route
/// behind a transparent [Scaffold] (see `AppTheme.pageTransitionsTheme`).
class PmBackdrop extends StatefulWidget {
  final Widget child;

  const PmBackdrop({super.key, required this.child});

  @override
  State<PmBackdrop> createState() => _PmBackdropState();
}

class _PmBackdropState extends State<PmBackdrop> {
  ui.Image? _grain = PmGrain.image;

  @override
  void initState() {
    super.initState();
    if (_grain == null) {
      PmGrain.load().then((img) {
        if (mounted) setState(() => _grain = img);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = context.tokens.isDark;
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Positioned.fill(
          child: RepaintBoundary(child: CustomPaint(painter: _BackdropPainter(dark: dark, grain: _grain))),
        ),
        widget.child,
      ],
    );
  }
}

class _BackdropPainter extends CustomPainter {
  final bool dark;
  final ui.Image? grain;

  _BackdropPainter({required this.dark, required this.grain});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: dark
              ? const [AppColors.green800, AppColors.green900, AppColors.green950]
              : const [AppColors.ivory, AppColors.cream, AppColors.lightSurface2],
          stops: const [0, .45, 1],
        ).createShader(rect),
    );
    // radial-gradient(1200px 700px at 70% -10%, #134b3d, transparent 60%)
    _aura(canvas, size, Offset(size.width * .7, -size.height * .1), size.width * 1.4,
        dark ? const Color(0xFF134B3D) : AppColors.goldSoft.withValues(alpha: .35));
    // radial-gradient(900px 600px at 0% 110%, #0d3b30, transparent 60%)
    _aura(canvas, size, Offset(0, size.height * 1.1), size.width * 1.2,
        dark ? const Color(0xFF0D3B30) : AppColors.green600.withValues(alpha: .08));
    final g = grain;
    if (g != null) {
      canvas.drawRect(
        rect,
        Paint()
          ..shader = ImageShader(g, TileMode.repeated, TileMode.repeated, Matrix4.identity().storage)
          ..blendMode = BlendMode.overlay
          ..color = Color.fromRGBO(0, 0, 0, dark ? .08 : .05),
      );
    }
  }

  void _aura(Canvas canvas, Size size, Offset c, double r, Color color) {
    canvas.drawRect(
      Offset.zero & size,
      Paint()
        ..shader = ui.Gradient.radial(c, r * .6, [color, color.withValues(alpha: 0)], const [0, 1]),
    );
  }

  @override
  bool shouldRepaint(_BackdropPainter old) => old.dark != dark || old.grain != grain;
}

/// One shared 160×160 noise tile (the CSS `feTurbulence` stand-in), decoded
/// once for the whole app.
class PmGrain {
  const PmGrain._();

  static Future<ui.Image>? _tile;

  /// The decoded tile, once [load] has completed.
  static ui.Image? image;

  static Future<ui.Image> load() => _tile ??= _make().then((img) => image = img);

  static Future<ui.Image> _make() {
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
}
