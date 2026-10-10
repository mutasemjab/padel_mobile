import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/pm_art.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../bloc/unread_count_cubit.dart';

/// Bell with the live unread badge; opens the notifications center.
class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnreadCountCubit, int>(
      builder: (context, count) => Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 4),
        child: PmIconSquare(
          icon: Icons.notifications_none_rounded,
          tooltip: AppLocalizations.of(context).notificationsTitle,
          onTap: () => context.push(AppRoutes.notifications),
          badge: count > 0 ? _Count(count: count) : null,
        ),
      ),
    );
  }
}

/// Live-red count bubble ringed in court green (`.icon-btn .dot`).
class _Count extends StatelessWidget {
  final int count;

  const _Count({required this.count});

  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(minWidth: 18),
    height: 18,
    padding: const EdgeInsetsDirectional.symmetric(horizontal: 4),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: AppColors.live,
      borderRadius: BorderRadius.circular(9),
      border: Border.all(color: context.tokens.isDark ? AppColors.green800 : AppColors.ivory, width: 2),
    ),
    child: Text(
      count > 99 ? '99+' : '$count',
      style: AppFonts.body(size: 9.5, weight: FontWeight.w700, color: AppColors.white, height: 1),
    ),
  );
}
