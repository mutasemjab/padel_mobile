import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/notification_item.dart';

(IconData, Color) notificationVisual(BuildContext context, NotificationType type) => switch (type) {
      NotificationType.registrationApproved || NotificationType.registrationPromoted => (Icons.how_to_reg_rounded, AppColors.success),
      NotificationType.registrationRejected => (Icons.person_off_rounded, AppColors.danger),
      NotificationType.registrationWaitlisted => (Icons.hourglass_top_rounded, AppColors.info),
      NotificationType.tournamentReminder => (Icons.emoji_events_rounded, AppColors.primary),
      NotificationType.matchReminder => (Icons.alarm_rounded, AppColors.primary),
      NotificationType.matchLive => (Icons.sensors_rounded, AppColors.live),
      NotificationType.resultVerified => (Icons.verified_rounded, AppColors.success),
      NotificationType.rankingChanged => (Icons.leaderboard_rounded, context.tokens.highlight),
      NotificationType.achievementUnlocked => (Icons.military_tech_rounded, AppColors.premiumGold),
      NotificationType.partnerRequest || NotificationType.partnerRequestAccepted => (Icons.handshake_rounded, context.tokens.highlight),
      NotificationType.challengeReceived => (Icons.sports_tennis_rounded, AppColors.clay),
      NotificationType.coachBookingRequested ||
      NotificationType.coachBookingConfirmed ||
      NotificationType.coachBookingCompleted => (Icons.event_available_rounded, AppColors.info),
      NotificationType.coachBookingRejected || NotificationType.coachBookingCancelled => (Icons.event_busy_rounded, AppColors.danger),
      NotificationType.paymentSucceeded => (Icons.payments_rounded, AppColors.success),
      NotificationType.paymentFailed => (Icons.money_off_rounded, AppColors.danger),
      NotificationType.threeDProfileReady => (Icons.view_in_ar_rounded, AppColors.premiumGold),
      NotificationType.threeDProfileFailed => (Icons.view_in_ar_rounded, AppColors.danger),
      NotificationType.systemAnnouncement => (Icons.campaign_rounded, AppColors.info),
      NotificationType.unknown => (Icons.notifications_rounded, context.tokens.textMuted),
    };

/// One notification. Title/message come localized from the backend
/// (`*_translations` for the current language); unknown types render
/// generically.
class NotificationTile extends StatelessWidget {
  final NotificationItem notification;
  final VoidCallback onTap;

  const NotificationTile({super.key, required this.notification, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final lang = Localizations.localeOf(context).languageCode;
    final (icon, color) = notificationVisual(context, notification.type);
    final title = notification.title(lang);
    final message = notification.message(lang);
    final read = notification.isRead;

    return InkWell(
      onTap: onTap,
      child: Container(
        color: read ? null : t.highlight.withValues(alpha: 0.05),
        padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.gutter, vertical: AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(color: color.withValues(alpha: 0.14), shape: BoxShape.circle),
              child: Icon(icon, color: color, size: AppSizes.iconMd),
            ),
            Gap.md,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? message ?? AppLocalizations.of(context).notificationsTitle,
                    style: context.text.titleSmall?.copyWith(fontWeight: read ? FontWeight.w500 : FontWeight.w700),
                  ),
                  if (title != null && message != null) ...[
                    Gap.xxs,
                    Text(message, style: context.text.bodySmall, maxLines: 3, overflow: TextOverflow.ellipsis),
                  ],
                  Gap.xs,
                  Text(DateFormatter.relative(context, notification.createdAt), style: context.text.labelSmall),
                ],
              ),
            ),
            if (!read)
              Container(
                width: AppSizes.dot,
                height: AppSizes.dot,
                margin: const EdgeInsetsDirectional.only(top: AppSpacing.sm, start: AppSpacing.sm),
                decoration: BoxDecoration(color: t.highlight, shape: BoxShape.circle),
              ),
          ],
        ),
      ),
    );
  }
}
