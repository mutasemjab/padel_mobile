import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/pm_art.dart';
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
      NotificationType.casualInvited || NotificationType.casualJoinRequested => (Icons.mail_rounded, AppColors.clay),
      NotificationType.casualRequestAccepted ||
      NotificationType.casualInviteAccepted ||
      NotificationType.casualFull => (Icons.groups_rounded, AppColors.success),
      NotificationType.casualRequestDeclined ||
      NotificationType.casualInviteDeclined ||
      NotificationType.casualCancelledNotFull ||
      NotificationType.casualCancelled => (Icons.event_busy_rounded, AppColors.danger),
      NotificationType.casualTimeChanged || NotificationType.casualCourtChanged => (Icons.edit_calendar_rounded, AppColors.info),
      NotificationType.casualReminder => (Icons.alarm_rounded, AppColors.clay),
      NotificationType.casualStarting => (Icons.sports_tennis_rounded, AppColors.live),
      NotificationType.tournamentRegistrationOpen => (Icons.emoji_events_rounded, AppColors.primary),
      NotificationType.partnerNeeded || NotificationType.partnerRemoved => (Icons.person_search_rounded, context.tokens.highlight),
      NotificationType.paymentRequired => (Icons.request_quote_rounded, AppColors.premiumGold),
      NotificationType.registrationChangesRequested => (Icons.edit_note_rounded, AppColors.info),
      NotificationType.duo3dReady => (Icons.view_in_ar_rounded, AppColors.premiumGold),
      NotificationType.tournamentCancelled => (Icons.event_busy_rounded, AppColors.danger),
      NotificationType.tournamentUpdated => (Icons.edit_calendar_rounded, AppColors.info),
      NotificationType.matchStarted => (Icons.sensors_rounded, AppColors.live),
      NotificationType.matchRescheduled => (Icons.edit_calendar_rounded, AppColors.primary),
      NotificationType.registrationPartnerInvite => (Icons.group_add_rounded, context.tokens.highlight),
      NotificationType.registrationPartnerAccepted => (Icons.how_to_reg_rounded, AppColors.success),
      NotificationType.registrationPartnerDeclined => (Icons.person_off_rounded, AppColors.danger),
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

    // A glass card per notification; unread ones carry a gold edge and glow.
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.gutter, vertical: AppSpacing.xs),
      child: AppCard(
        onTap: onTap,
        padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.md),
        borderColor: read ? null : (t.isDark ? AppColors.goldSoft.withValues(alpha: .4) : AppColors.green700.withValues(alpha: .35)),
        color: read ? null : (t.isDark ? const Color(0x14E3CC97) : AppColors.ivory),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [color.withValues(alpha: .26), color.withValues(alpha: .06)]),
                border: Border.all(color: color.withValues(alpha: .4)),
              ),
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
                    Text(
                      message,
                      style: context.text.bodySmall,
                      // Announcements are read in full; other notifications stay compact.
                      maxLines: notification.type == NotificationType.systemAnnouncement ? null : 3,
                      overflow: notification.type == NotificationType.systemAnnouncement ? null : TextOverflow.ellipsis,
                    ),
                  ],
                  Gap.xs,
                  Text(
                    DateFormatter.relative(context, notification.createdAt),
                    style: context.text.labelSmall?.copyWith(color: t.isDark ? AppColors.goldSoft.withValues(alpha: .75) : AppColors.green700),
                  ),
                ],
              ),
            ),
            if (!read)
              Padding(
                padding: const EdgeInsetsDirectional.only(top: AppSpacing.sm, start: AppSpacing.sm),
                child: PmPulseDot(color: t.isDark ? AppColors.ball : AppColors.green600, size: 8),
              ),
          ],
        ),
      ),
    );
  }
}
