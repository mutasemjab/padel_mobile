import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_tokens.dart';

/// Base shimmer block themed to light/dark. Skeletons are shaped like the
/// real content so the layout doesn't jump when data lands.
class ShimmerBox extends StatelessWidget {
  final double? width;
  final double height;
  final BorderRadius borderRadius;

  const ShimmerBox({super.key, this.width, this.height = 16, this.borderRadius = AppRadius.smAll});

  const ShimmerBox.circle({super.key, required double size})
    : width = size,
      height = size,
      borderRadius = AppRadius.pillAll;

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final box = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: AppColors.white, borderRadius: borderRadius),
    );
    if (context.reduceMotion) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: t.surface2, borderRadius: borderRadius),
      );
    }
    return Shimmer.fromColors(
      baseColor: t.surface2,
      highlightColor: Color.lerp(t.surface2, t.textMuted, 0.18)!,
      child: box,
    );
  }
}

/// Row skeleton: avatar + two lines (players, rankings, notifications).
class PlayerCardSkeleton extends StatelessWidget {
  const PlayerCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.cardDense,
      decoration: BoxDecoration(
        color: context.tokens.surface,
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: context.tokens.outline),
      ),
      child: const Row(
        children: [
          ShimmerBox.circle(size: AppSizes.avatarMd),
          Gap.md,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ShimmerBox(width: 140, height: 14), Gap.sm, ShimmerBox(width: 90, height: 12)],
            ),
          ),
          ShimmerBox(width: 44, height: 22),
        ],
      ),
    );
  }
}

/// Tall image-header card (tournament / coach list item).
class ImageCardSkeleton extends StatelessWidget {
  final double height;

  const ImageCardSkeleton({super.key, this.height = 160});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: context.tokens.surface,
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: context.tokens.outline),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerBox(height: height, borderRadius: BorderRadius.zero),
          const Padding(
            padding: AppSpacing.cardDense,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerBox(width: 90, height: 18),
                Gap.sm,
                ShimmerBox(width: 200, height: 16),
                Gap.sm,
                ShimmerBox(width: 120, height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Scoreboard-shaped skeleton for match cards.
class MatchCardSkeleton extends StatelessWidget {
  const MatchCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.card,
      decoration: BoxDecoration(
        color: context.tokens.surface,
        borderRadius: AppRadius.lgAll,
        border: Border.all(color: context.tokens.outline),
      ),
      child: const Column(
        children: [
          Row(children: [ShimmerBox(width: 60, height: 14), Spacer(), ShimmerBox(width: 40, height: 14)]),
          Gap.md,
          Row(
            children: [
              ShimmerBox.circle(size: 32),
              Gap.sm,
              ShimmerBox(width: 140, height: 14),
              Spacer(),
              ShimmerBox(width: 28, height: 24),
            ],
          ),
          Gap.sm,
          Row(
            children: [
              ShimmerBox.circle(size: 32),
              Gap.sm,
              ShimmerBox(width: 120, height: 14),
              Spacer(),
              ShimmerBox(width: 28, height: 24),
            ],
          ),
        ],
      ),
    );
  }
}

/// A vertical list of skeleton items for first-load states.
class SkeletonList extends StatelessWidget {
  final Widget Function() itemBuilder;
  final int count;
  final EdgeInsetsGeometry padding;

  const SkeletonList({super.key, required this.itemBuilder, this.count = 6, this.padding = AppSpacing.page});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: count,
      separatorBuilder: (_, _) => Gap.md,
      itemBuilder: (_, _) => itemBuilder(),
    );
  }
}

/// Generic first-load state: a skeleton list of [itemBuilder] rows.
class LoadingState extends StatelessWidget {
  final Widget Function()? itemBuilder;
  final int count;

  const LoadingState({super.key, this.itemBuilder, this.count = 6});

  @override
  Widget build(BuildContext context) =>
      SkeletonList(itemBuilder: itemBuilder ?? () => const PlayerCardSkeleton(), count: count);
}
