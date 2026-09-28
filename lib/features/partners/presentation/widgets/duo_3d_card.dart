import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/court_lines.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../premium/presentation/widgets/three_d_viewer.dart';
import '../../domain/entities/duo_media.dart';
import '../bloc/duo_3d_cubit.dart';

/// Own partners tab: the duo 3D scene with the main partner — generate,
/// watch it process, and show the result (video, image or `.glb`).
class Duo3dCard extends StatelessWidget {
  const Duo3dCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<Duo3dCubit>()..load(),
      child: BlocConsumer<Duo3dCubit, Duo3dState>(
        listenWhen: (a, b) => b.lastFailure != null && a.lastFailure != b.lastFailure,
        listener: (context, state) => showFailure(context, state.lastFailure!),
        builder: (context, state) {
          final l10n = AppLocalizations.of(context);
          return AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Icon(Icons.view_in_ar_rounded, color: context.tokens.highlight),
                    Gap.md,
                    Expanded(child: Text(l10n.duo3dTitle, style: context.text.titleSmall)),
                  ],
                ),
                Gap.xs,
                Text(l10n.duo3dBody, style: context.text.bodySmall),
                Gap.lg,
                switch (state.view) {
                  ViewLoaded(:final data) => _Body(data: data, requesting: state.requesting),
                  ViewError(:final failure) => _failure(context, failure),
                  _ => const SizedBox(height: 180, child: Center(child: CircularProgressIndicator())),
                },
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _failure(BuildContext context, Failure failure) {
    if (failure.isPremiumRequired) {
      return PremiumRequiredState(compact: true, message: AppLocalizations.of(context).duo3dPremium);
    }
    return ErrorState(failure: failure, compact: true, onRetry: () => context.read<Duo3dCubit>().load());
  }
}

class _Body extends StatelessWidget {
  final DuoMediaState data;
  final bool requesting;

  const _Body({required this.data, required this.requesting});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (!data.providerConfigured) return ComingSoonState(compact: true, message: l10n.duo3dComingSoon);

    final current = data.current;
    final pending = current?.status.isPending ?? false;
    final shown = current?.status == DuoMediaStatus.completed ? current : data.latestCompleted;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (shown != null) ...[_DuoMediaView(media: shown), Gap.md],
        if (pending)
          _Notice(icon: Icons.hourglass_top_rounded, text: l10n.duo3dProcessing, busy: true)
        else if (current?.status == DuoMediaStatus.failed)
          _Notice(icon: Icons.error_outline_rounded, text: l10n.duo3dFailed)
        else if (data.requiresPhotos)
          _Notice(icon: Icons.photo_camera_outlined, text: l10n.duo3dNeedsPhotos),
        if (!pending) ...[
          Gap.md,
          FilledButton.icon(
            onPressed: requesting || data.requiresPhotos ? null : () => context.read<Duo3dCubit>().generate(),
            icon: requesting
                ? const SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 2))
                : const Icon(Icons.auto_awesome_rounded),
            label: Text(shown == null ? l10n.duo3dGenerate : l10n.duo3dRegenerate),
          ),
        ],
      ],
    );
  }
}

class _Notice extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool busy;

  const _Notice({required this.icon, required this.text, this.busy = false});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      if (busy)
        SizedBox.square(
          dimension: 18,
          child: CircularProgressIndicator(strokeWidth: 2, color: context.tokens.highlight),
        )
      else
        Icon(icon, size: 18, color: context.tokens.textMuted),
      Gap.sm,
      Expanded(child: Text(text, style: context.text.bodySmall)),
    ],
  );
}

class _DuoMediaView extends StatelessWidget {
  final DuoMedia media;

  const _DuoMediaView({required this.media});

  @override
  Widget build(BuildContext context) {
    final url = media.mediaUrl;
    if (url == null || url.isEmpty) return const SizedBox.shrink();
    return switch (media.mediaType) {
      DuoMediaType.model => ThreeDViewer(assetUrl: url, alt: AppLocalizations.of(context).duo3dTitle),
      DuoMediaType.image => ClipRRect(
        borderRadius: AppRadius.xlAll,
        child: AspectRatio(
          aspectRatio: 4 / 5,
          child: AppNetworkImage(url: url),
        ),
      ),
      DuoMediaType.video => _DuoVideo(url: url, poster: media.thumbnailUrl),
    };
  }
}

/// Muted, looping clip; tap to pause / resume.
class _DuoVideo extends StatefulWidget {
  final String url;
  final String? poster;

  const _DuoVideo({required this.url, this.poster});

  @override
  State<_DuoVideo> createState() => _DuoVideoState();
}

class _DuoVideoState extends State<_DuoVideo> {
  late VideoPlayerController _controller;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _open();
  }

  @override
  void didUpdateWidget(_DuoVideo old) {
    super.didUpdateWidget(old);
    if (old.url != widget.url) {
      _controller.dispose();
      _ready = false;
      _open();
    }
  }

  void _open() {
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url));
    _controller.initialize().then((_) {
      if (!mounted) return;
      _controller
        ..setLooping(true)
        ..setVolume(0)
        ..play();
      setState(() => _ready = true);
    }, onError: (_) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: AppRadius.xlAll,
      child: AspectRatio(
        aspectRatio: _ready ? _controller.value.aspectRatio : 4 / 5,
        child: _ready
            ? GestureDetector(
                onTap: () => setState(() => _controller.value.isPlaying ? _controller.pause() : _controller.play()),
                child: VideoPlayer(_controller),
              )
            : Stack(
                fit: StackFit.expand,
                children: [
                  const DecoratedBox(
                    decoration: BoxDecoration(gradient: AppGradients.court),
                    child: CourtLinesBackground(),
                  ),
                  if (widget.poster != null) AppNetworkImage(url: widget.poster),
                  const Center(child: CircularProgressIndicator()),
                ],
              ),
      ),
    );
  }
}
