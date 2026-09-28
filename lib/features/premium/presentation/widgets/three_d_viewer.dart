import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/court_lines.dart';

/// Rotating `.glb` athlete identity on a court-texture stage.
class ThreeDViewer extends StatelessWidget {
  final String assetUrl;
  final String alt;
  final double height;

  const ThreeDViewer({super.key, required this.assetUrl, required this.alt, this.height = 300});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.xlAll,
      child: SizedBox(
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            const DecoratedBox(
              decoration: BoxDecoration(gradient: AppGradients.court),
              child: CourtLinesBackground(),
            ),
            ModelViewer(
              src: assetUrl,
              alt: alt,
              autoRotate: true,
              cameraControls: true,
              disableZoom: true,
              backgroundColor: AppColors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
