import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/badges.dart';
import '../../domain/entities/tournament.dart';

class TournamentStatusBadge extends StatelessWidget {
  final TournamentStatus status;

  const TournamentStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final (color, icon) = switch (status) {
      TournamentStatus.registrationOpen => (AppColors.success, Icons.how_to_reg_rounded),
      TournamentStatus.ongoing => (AppColors.live, Icons.sports_tennis_rounded),
      TournamentStatus.completed => (context.tokens.textMuted, Icons.flag_rounded),
      TournamentStatus.cancelled => (AppColors.danger, Icons.block_rounded),
      TournamentStatus.registrationClosed => (AppColors.warning, Icons.lock_clock_rounded),
      TournamentStatus.draft => (context.tokens.textMuted, Icons.edit_note_rounded),
    };
    return StatusChip(label: status.label(context), color: color, icon: icon);
  }
}
