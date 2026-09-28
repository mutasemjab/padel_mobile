import 'package:flutter/material.dart';

import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../domain/entities/booking.dart';

Color bookingStatusColor(BuildContext context, BookingStatus status) => switch (status) {
      BookingStatus.pending => AppColors.warning,
      BookingStatus.confirmed => AppColors.info,
      BookingStatus.completed => AppColors.success,
      BookingStatus.cancelled => context.tokens.textMuted,
      BookingStatus.rejected => AppColors.danger,
    };

/// Training session row. Training uses the info-blue identity. When
/// [showPlayer] is true (coach portal) the player is shown instead of the coach.
class BookingTile extends StatelessWidget {
  final Booking booking;
  final VoidCallback? onTap;
  final bool showPlayer;
  final Widget? trailing;

  const BookingTile({super.key, required this.booking, this.onTap, this.showPlayer = false, this.trailing});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final when = booking.scheduledAt;
    final name = showPlayer ? (booking.player?.name ?? '') : booking.coach.name;
    final photo = showPlayer ? booking.player?.photoUrl : booking.coach.photoUrl;

    return AppCard(
      onTap: onTap,
      padding: AppSpacing.cardDense,
      child: Row(
        children: [
          Container(
            width: 56,
            padding: const EdgeInsetsDirectional.symmetric(vertical: AppSpacing.sm),
            decoration: BoxDecoration(
              color: AppColors.info.withValues(alpha: 0.12),
              borderRadius: AppRadius.mdAll,
            ),
            child: Column(
              children: [
                Text(
                  when == null ? '—' : DateFormatter.weekdayShort(when).toUpperCase(),
                  style: AppTypography.eyebrow(context, color: AppColors.info),
                ),
                Text(
                  when == null ? '' : '${when.toLocal().day}',
                  style: AppTypography.number(context, size: 24, color: AppColors.info),
                ),
              ],
            ),
          ),
          Gap.md,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    PlayerAvatar(name: name, photoUrl: photo, size: AppSizes.avatarXs, showRing: false),
                    Gap.sm,
                    Expanded(child: Text(name, style: context.text.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis)),
                  ],
                ),
                Gap.xs,
                Text(
                  [
                    if (when != null) DateFormatter.time(when),
                    Formatters.minutes(booking.durationMinutes),
                    if (booking.trainingType != null) context.enums.label(EnumGroup.trainingTypes, booking.trainingType),
                  ].join(' · '),
                  style: context.text.bodySmall,
                ),
                Gap.sm,
                StatusChip(
                  label: context.enums.label(EnumGroup.bookingStatuses, booking.status.name),
                  color: bookingStatusColor(context, booking.status),
                ),
              ],
            ),
          ),
          if (trailing != null) trailing! else Icon(Icons.chevron_right_rounded, color: t.textMuted),
        ],
      ),
    );
  }
}
