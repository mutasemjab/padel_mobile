import 'package:flutter/material.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/coach.dart';

/// Marketplace row: photo, name, rating (or "New coach"), location, price,
/// top specialties and next availability.
class CoachCard extends StatelessWidget {
  final Coach coach;
  final VoidCallback onTap;

  const CoachCard({super.key, required this.coach, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    return AppCard(
      onTap: onTap,
      padding: AppSpacing.cardDense,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: 'coach-image-${coach.id}',
            child: ClipRRect(
              borderRadius: AppRadius.mdAll,
              child: SizedBox(
                width: 84,
                height: 104,
                child: AppNetworkImage(
                  url: coach.photoUrl,
                  fallback: const DecoratedBox(
                    decoration: BoxDecoration(gradient: AppGradients.training),
                    child: Icon(Icons.sports_rounded, color: AppColors.white, size: AppSizes.iconXl),
                  ),
                ),
              ),
            ),
          ),
          Gap.md,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(coach.name, style: context.text.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                    CoachRatingBadge(rating: coach.rating),
                  ],
                ),
                if (coach.location != null) ...[
                  Gap.xxs,
                  Row(
                    children: [
                      Icon(Icons.place_rounded, size: AppSizes.iconXs, color: t.textMuted),
                      Gap.xxs,
                      Expanded(
                        child: Text(coach.location!, style: context.text.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ],
                Gap.sm,
                Wrap(
                  spacing: AppSpacing.xs,
                  runSpacing: AppSpacing.xs,
                  children: [
                    for (final s in coach.specialties.take(3))
                      _Tag(label: sl<EnumsService>().label(EnumGroup.trainingSkills, s)),
                  ],
                ),
                Gap.sm,
                Row(
                  children: [
                    Text(
                      l10n.coachPerHour(Formatters.money(coach.pricePerHour, coach.currency)),
                      style: AppTypography.number(context, size: 17, color: AppColors.info),
                    ),
                    const Spacer(),
                    if (coach.nextAvailableAt != null)
                      Text(
                        l10n.coachNextAvailable(DateFormatter.weekdayDay(coach.nextAvailableAt!)),
                        style: context.text.labelSmall,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Stars + count, or "New coach" when there are no reviews (never 0 stars).
class CoachRatingBadge extends StatelessWidget {
  final CoachRating rating;
  final bool large;

  const CoachRatingBadge({super.key, required this.rating, this.large = false});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (!rating.hasReviews) {
      return Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs),
        decoration: BoxDecoration(color: AppColors.info.withValues(alpha: 0.14), borderRadius: AppRadius.pillAll),
        child: Text(l10n.newCoach, style: context.text.labelMedium?.copyWith(color: AppColors.info)),
      );
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_rounded, size: large ? AppSizes.iconMd : AppSizes.iconSm, color: AppColors.premiumGold),
        Gap.xxs,
        Text(
          rating.average!.toStringAsFixed(1),
          style: AppTypography.number(context, size: large ? 20 : 15),
        ),
        Gap.xxs,
        Text('(${rating.count})', style: context.text.labelSmall),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;

  const _Tag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs),
      decoration: BoxDecoration(color: context.tokens.surface2, borderRadius: AppRadius.pillAll),
      child: Text(label, style: context.text.labelSmall?.copyWith(color: context.tokens.textPrimary, letterSpacing: 0)),
    );
  }
}
