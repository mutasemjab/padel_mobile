import 'package:flutter/material.dart';

import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/badges.dart';
import '../../domain/entities/registration.dart';

/// Registration status pill (labels from `meta/enums`).
class RegistrationStatusChip extends StatelessWidget {
  final RegistrationStatus status;

  const RegistrationStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      RegistrationStatus.approved => AppColors.success,
      RegistrationStatus.pending => AppColors.warning,
      RegistrationStatus.waitlisted => AppColors.info,
      RegistrationStatus.rejected => AppColors.danger,
      RegistrationStatus.cancelled => context.tokens.textMuted,
    };
    final icon = switch (status) {
      RegistrationStatus.approved => Icons.check_circle_rounded,
      RegistrationStatus.waitlisted => Icons.hourglass_top_rounded,
      _ => null,
    };
    return StatusChip(
      label: context.enums.label(EnumGroup.registrationStatuses, status.name),
      color: color,
      icon: icon,
    );
  }
}

/// Payment status pill; hidden when no payment is required.
class PaymentStatusChip extends StatelessWidget {
  final PaymentStatus status;

  const PaymentStatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    if (status == PaymentStatus.notRequired) return const SizedBox.shrink();
    final color = switch (status) {
      PaymentStatus.paid => AppColors.success,
      PaymentStatus.pending => AppColors.warning,
      PaymentStatus.refunded => AppColors.info,
      PaymentStatus.notRequired => context.tokens.textMuted,
    };
    return StatusChip(
      label: context.enums.label(EnumGroup.paymentStatuses, status.apiValue),
      color: color,
      icon: Icons.payments_rounded,
    );
  }
}
