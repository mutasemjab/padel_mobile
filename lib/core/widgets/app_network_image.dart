import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../theme/app_tokens.dart';

/// Cached network image with a themed placeholder and a graceful fallback
/// (never a broken-image icon on a hero).
class AppNetworkImage extends StatelessWidget {
  final String? url;
  final BoxFit fit;
  final Widget? fallback;

  const AppNetworkImage({super.key, required this.url, this.fit = BoxFit.cover, this.fallback});

  @override
  Widget build(BuildContext context) {
    final placeholder = fallback ?? ColoredBox(color: context.tokens.surface2);
    if (url == null || url!.isEmpty) return placeholder;
    return CachedNetworkImage(
      imageUrl: url!,
      fit: fit,
      fadeInDuration: const Duration(milliseconds: 200),
      placeholder: (_, _) => ColoredBox(color: context.tokens.surface2),
      errorWidget: (_, _, _) => placeholder,
    );
  }
}
