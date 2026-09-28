import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_effects.dart';
import '../theme/app_tokens.dart';

/// The Playmaker "P" (from `assets/icon.png`) as a tintable mark.
///
/// `assets/logo-mark.png` is the icon's letter cut out on a transparent
/// background, so it can be filled with any color or gradient. By default it
/// is gold leaf on dark and logo green on light.
class AppLogo extends StatelessWidget {
  static const asset = 'assets/logo-mark.png';

  /// Width / height of the mark's artwork.
  static const aspectRatio = 641 / 816;

  final double height;
  final List<Color>? colors;
  final List<double>? stops;

  const AppLogo({super.key, this.height = 40, this.colors, this.stops});

  @override
  Widget build(BuildContext context) {
    final fill =
        colors ?? (context.tokens.isDark ? AppGradients.goldLeaf : const [AppColors.green800, AppColors.green800]);
    final width = height * aspectRatio;
    return Semantics(
      label: 'Playmaker',
      image: true,
      child: SizedBox(
        width: width,
        height: height,
        child: ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (rect) => CssLinearGradient(170, colors: fill, stops: stops).createShader(rect),
          child: Image.asset(asset, width: width, height: height, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
