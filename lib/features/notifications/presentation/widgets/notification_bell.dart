import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../bloc/unread_count_cubit.dart';

/// Bell with the live unread badge; opens the notifications center.
class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnreadCountCubit, int>(
      builder: (context, count) => IconButton(
        tooltip: AppLocalizations.of(context).notificationsTitle,
        onPressed: () => context.push(AppRoutes.notifications),
        icon: Badge(
          isLabelVisible: count > 0,
          label: Text(count > 99 ? '99+' : '$count'),
          child: const Icon(Icons.notifications_none_rounded),
        ),
      ),
    );
  }
}
