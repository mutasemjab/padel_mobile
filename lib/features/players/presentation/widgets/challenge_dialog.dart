import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/error/failure_l10n.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../bloc/challenge_cubit.dart';

/// Prompts for an optional message, then submits a challenge via
/// `POST players/{playerId}/challenge`, closing itself on success.
Future<void> showChallengeDialog(BuildContext context, {required String playerId, required String playerName}) {
  return showDialog(
    context: context,
    builder: (dialogContext) => BlocProvider(
      create: (_) => sl<ChallengeCubit>(),
      child: _ChallengeDialogContent(playerId: playerId, playerName: playerName),
    ),
  );
}

class _ChallengeDialogContent extends StatefulWidget {
  final String playerId;
  final String playerName;

  const _ChallengeDialogContent({required this.playerId, required this.playerName});

  @override
  State<_ChallengeDialogContent> createState() => _ChallengeDialogContentState();
}

class _ChallengeDialogContentState extends State<_ChallengeDialogContent> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocConsumer<ChallengeCubit, ChallengeActionState>(
      listener: (context, state) {
        if (state is ChallengeActionSent) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.challengeSentTo(widget.playerName))),
          );
        } else if (state is ChallengeActionFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.failure.localizedMessage(context))),
          );
        }
      },
      builder: (context, state) {
        final isSending = state is ChallengeActionSending;
        return AlertDialog(
          title: Text(l10n.challengeTitle(widget.playerName)),
          content: TextField(
            controller: _controller,
            maxLines: 3,
            decoration: InputDecoration(hintText: l10n.hintAddMessage),
          ),
          actions: [
            TextButton(
              onPressed: isSending ? null : () => Navigator.of(context).pop(),
              child: Text(l10n.actionCancel),
            ),
            FilledButton(
              onPressed: isSending
                  ? null
                  : () => context.read<ChallengeCubit>().send(
                        widget.playerId,
                        message: _controller.text.trim().isEmpty ? null : _controller.text.trim(),
                      ),
              child: isSending
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.actionSend),
            ),
          ],
        );
      },
    );
  }
}
