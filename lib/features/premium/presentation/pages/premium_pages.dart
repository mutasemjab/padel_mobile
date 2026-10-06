import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../domain/entities/ai_insight.dart';
import '../../domain/entities/premium.dart';
import '../bloc/premium_cubits.dart';
import '../widgets/ai_insight_card.dart';
import '../widgets/three_d_viewer.dart';

/// Builds "Premium never affects your …" from the backend's `never_affects`.
String neverAffectsLine(AppLocalizations l10n, List<String> keys) {
  if (keys.isEmpty) return l10n.premiumNeverAffectsDefault;
  final items = keys
      .map((k) => switch (k) {
            'skill_rating' => l10n.neverSkillRating,
            'season_ranking' => l10n.neverSeasonRanking,
            'seeding' => l10n.neverSeeding,
            'tournament_eligibility' => l10n.neverEligibility,
            'official_results' => l10n.neverOfficialResults,
            _ => EnumsService.humanize(k),
          })
      .join(', ');
  return l10n.premiumNeverAffects(items);
}

class _NeverAffects extends StatelessWidget {
  final List<String> keys;

  const _NeverAffects({required this.keys});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.cardDense,
      decoration: BoxDecoration(
        color: AppColors.premiumGold.withValues(alpha: 0.1),
        borderRadius: AppRadius.mdAll,
        border: Border.all(color: AppColors.premiumGold.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.balance_rounded, color: AppColors.premiumGold),
          Gap.md,
          Expanded(
            child: Text(
              neverAffectsLine(AppLocalizations.of(context), keys),
              style: context.text.bodyMedium?.copyWith(color: AppColors.premiumGoldLight, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

/// Premium hub / paywall.
class PremiumPage extends StatelessWidget {
  const PremiumPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<PremiumCubit>()..load()),
        BlocProvider(create: (_) => sl<CheckoutCubit>()),
      ],
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(foregroundColor: AppColors.white),
        body: DecoratedBox(
          decoration: const BoxDecoration(gradient: AppGradients.premiumSurface),
          child: BlocBuilder<PremiumCubit, ViewState<PremiumOverview>>(
            builder: (context, state) => ViewStateView<PremiumOverview>(
              state: state,
              loading: const Center(child: CircularProgressIndicator()),
              onRetry: () => context.read<PremiumCubit>().load(),
              builder: (context, data) => _PremiumContent(data: data, l10n: l10n),
            ),
          ),
        ),
      ),
    );
  }
}

class _PremiumContent extends StatelessWidget {
  final PremiumOverview data;
  final AppLocalizations l10n;

  const _PremiumContent({required this.data, required this.l10n});

  @override
  Widget build(BuildContext context) {
    final status = data.status;
    final never = status?.neverAffects.isNotEmpty ?? false ? status!.neverAffects : data.catalog.neverAffects;
    final features = [
      (Icons.auto_awesome_rounded, l10n.premiumFeatureAi, l10n.premiumFeatureAiBody, AppRoutes.aiInsights),
      (Icons.insights_rounded, l10n.premiumFeatureAnalytics, l10n.premiumFeatureAnalyticsBody, null),
      (Icons.view_in_ar_rounded, l10n.premiumFeature3d, l10n.premiumFeature3dBody, AppRoutes.threeD),
      (Icons.diamond_rounded, l10n.premiumFeatureBadges, l10n.premiumFeatureBadgesBody, null),
    ];
    return ListView(
      padding: EdgeInsetsDirectional.fromSTEB(
        AppSpacing.gutter,
        MediaQuery.paddingOf(context).top + kToolbarHeight,
        AppSpacing.gutter,
        AppSpacing.huge,
      ),
      children: [
        const PremiumBadge(),
        Gap.lg,
        Text(l10n.premiumHeadline, style: context.text.displaySmall?.copyWith(color: AppColors.white)),
        Gap.sm,
        Text(l10n.premiumSubhead, style: context.text.bodyLarge?.copyWith(color: AppColors.textMuted)),
        Gap.xl,
        _NeverAffects(keys: never),
        Gap.xl,
        if (status?.isPremium ?? false) _ActiveCard(status: status!),
        for (final (icon, title, body, route) in features) ...[
          _GlassCard(
            onTap: route == null || !(status?.isPremium ?? false) ? null : () => context.push(route),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(gradient: AppGradients.premium, shape: BoxShape.circle),
                  child: Icon(icon, color: AppColors.onPremium),
                ),
                Gap.md,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: context.text.titleSmall?.copyWith(color: AppColors.white)),
                      Text(body, style: context.text.bodySmall?.copyWith(color: AppColors.textMuted)),
                    ],
                  ),
                ),
                if (route != null && (status?.isPremium ?? false))
                  const Icon(Icons.chevron_right_rounded, color: AppColors.premiumGold),
              ],
            ),
          ),
          Gap.sm,
        ],
        if (!(status?.isPremium ?? false)) ...[
          Gap.xl,
          Text(l10n.premiumPlansTitle, style: context.text.titleLarge?.copyWith(color: AppColors.white)),
          Gap.md,
          if (data.catalog.plans.isEmpty)
            Text(l10n.premiumPlansUnavailable, style: context.text.bodySmall?.copyWith(color: AppColors.textMuted))
          else
            for (final plan in data.catalog.plans) ...[
              _PlanCard(plan: plan, checkoutAvailable: data.catalog.checkoutAvailable),
              Gap.sm,
            ],
          if (!data.catalog.checkoutAvailable) ...[
            Gap.md,
            Row(
              children: [
                const Icon(Icons.rocket_launch_rounded, color: AppColors.premiumGoldLight, size: AppSizes.iconSm),
                Gap.sm,
                Expanded(
                  child: Text(l10n.premiumCheckoutSoon, style: context.text.labelLarge?.copyWith(color: AppColors.premiumGoldLight)),
                ),
              ],
            ),
          ],
        ],
        Gap.xl,
        TextButton.icon(
          onPressed: () => context.push(AppRoutes.payments),
          icon: const Icon(Icons.receipt_long_rounded),
          label: Text(l10n.paymentsTitle),
        ),
      ],
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const _GlassCard({required this.child, this.onTap});

  @override
  Widget build(BuildContext context) => AppCard(
        onTap: onTap,
        color: AppColors.white.withValues(alpha: 0.05),
        borderColor: AppColors.premiumGold.withValues(alpha: 0.25),
        child: child,
      );
}

class _ActiveCard extends StatelessWidget {
  final PremiumStatus status;

  const _ActiveCard({required this.status});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final ends = status.subscription?.endsAt;
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.lg),
      child: AppCard(
        gradient: AppGradients.premium,
        borderColor: AppColors.transparent,
        shadows: AppShadows.gold,
        child: Row(
          children: [
            const Icon(Icons.verified_rounded, color: AppColors.onPremium, size: AppSizes.iconXl),
            Gap.md,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.premiumActive, style: context.text.titleMedium?.copyWith(color: AppColors.onPremium)),
                  if (ends != null)
                    Text(
                      l10n.premiumActiveUntil(DateFormatter.fullDate(ends)),
                      style: context.text.bodySmall?.copyWith(color: AppColors.onPremium),
                    ),
                  if (status.subscription?.plan != null || status.subscription?.amount != null)
                    Text(
                      [
                        if (status.subscription?.plan == 'monthly') l10n.premiumPlanMonthly,
                        if (status.subscription?.plan == 'yearly') l10n.premiumPlanYearly,
                        if (status.subscription?.amount != null) Formatters.money(status.subscription!.amount!, status.subscription!.currency),
                        if (status.subscription?.daysLeft != null) l10n.premiumDaysLeft(status.subscription!.daysLeft!),
                      ].join(' · '),
                      style: context.text.bodySmall?.copyWith(color: AppColors.onPremium),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  final PremiumPlan plan;
  final bool checkoutAvailable;

  const _PlanCard({required this.plan, required this.checkoutAvailable});

  Future<void> _checkout(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final cubit = context.read<CheckoutCubit>();
    if (await cubit.checkout(plan.key)) {
      final payment = (cubit.state as ActionSuccess).result as Payment;
      if (payment.checkoutUrl != null) {
        await launchUrl(Uri.parse(payment.checkoutUrl!), mode: LaunchMode.externalApplication);
      }
      if (context.mounted) await context.push(AppRoutes.payment(payment.reference));
      if (context.mounted) {
        context.read<AuthBloc>().add(const AuthEvent.refreshRequested());
        context.read<PremiumCubit>().refresh();
      }
      return;
    }
    if (!context.mounted) return;
    final state = cubit.state;
    if (state is ActionFailure) {
      if (state.failure is ProviderUnavailableFailure) {
        showAppSnack(context, l10n.premiumCheckoutSoon, icon: Icons.rocket_launch_rounded);
      } else {
        showFailure(context, state.failure);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _GlassCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.premiumPlanMonths(plan.months), style: context.text.titleMedium?.copyWith(color: AppColors.white)),
                Text(
                  Formatters.money(plan.price, plan.currency),
                  style: AppTypography.number(context, size: 26, color: AppColors.premiumGold),
                ),
              ],
            ),
          ),
          BlocBuilder<CheckoutCubit, ActionState>(
            builder: (context, state) => FilledButton(
              style: FilledButton.styleFrom(backgroundColor: AppColors.premiumGold, foregroundColor: AppColors.onPremium),
              onPressed: !checkoutAvailable || state is ActionInProgress ? null : () => _checkout(context),
              child: state is ActionInProgress ? const ButtonSpinner() : Text(l10n.premiumSubscribe),
            ),
          ),
        ],
      ),
    );
  }
}

/// Seven insight cards with generate / refresh and polling while pending.
class AiInsightsPage extends StatelessWidget {
  const AiInsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => sl<AiInsightsCubit>()..load(),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.aiTitle)),
        body: BlocConsumer<AiInsightsCubit, AiInsightsState>(
          listenWhen: (a, b) => b.lastFailure != null && a.lastFailure != b.lastFailure,
          listener: (context, state) => showFailure(context, state.lastFailure!),
          builder: (context, state) => ViewStateView<AiInsightsOverview>(
            state: state.overview,
            onRetry: () => context.read<AiInsightsCubit>().load(),
            builder: (context, overview) => RefreshIndicator(
              onRefresh: () => context.read<AiInsightsCubit>().load(),
              child: ListView.separated(
                padding: AppSpacing.page,
                itemCount: overview.types.length,
                separatorBuilder: (_, _) => Gap.md,
                itemBuilder: (context, i) {
                  final type = overview.types[i];
                  final insight = overview.insights[type];
                  return AiInsightCard(
                    type: type,
                    insight: insight,
                    busy: state.busy.contains(type),
                    onGenerate: () => context.read<AiInsightsCubit>().run(type, refresh: insight != null),
                  ).staggered(context, i);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 3D identity: viewer, generate, provider-not-configured and photo states.
class ThreeDPage extends StatelessWidget {
  const ThreeDPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => sl<ThreeDCubit>()..load(),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.threeDTitle)),
        body: BlocConsumer<ThreeDCubit, ThreeDState>(
          listenWhen: (a, b) => b.lastFailure != null && a.lastFailure != b.lastFailure,
          listener: (context, state) {
            final f = state.lastFailure!;
            if (f is ProviderUnavailableFailure) {
              showAppSnack(context, l10n.stateComingSoon3d, icon: Icons.rocket_launch_rounded);
            } else {
              showFailure(context, f);
            }
          },
          builder: (context, state) => ViewStateView<ThreeDProfileState>(
            state: state.profile,
            onRetry: () => context.read<ThreeDCubit>().load(),
            builder: (context, p) => _ThreeDContent(profile: p, requesting: state.requesting),
          ),
        ),
      ),
    );
  }
}

class _ThreeDContent extends StatelessWidget {
  final ThreeDProfileState profile;
  final bool requesting;

  const _ThreeDContent({required this.profile, required this.requesting});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final current = profile.current;
    final shown = current?.status == ThreeDStatus.completed ? current : profile.latestCompleted;
    final working = current?.status.isWorking ?? false;
    final cubit = context.read<ThreeDCubit>();
    return ListView(
      padding: AppSpacing.page,
      children: [
        if (shown?.assetUrl != null)
          ThreeDViewer(assetUrl: shown!.assetUrl!, alt: l10n.threeDTitle, height: 380)
        else
          EmptyState(
            icon: Icons.view_in_ar_rounded,
            title: l10n.threeDEmpty,
            message: l10n.premiumFeature3dBody,
            accent: AppColors.premiumGold,
            compact: true,
          ),
        Gap.xl,
        if (!profile.providerConfigured)
          AppCard(child: ComingSoonState(message: l10n.stateComingSoon3d, compact: true))
        else if (profile.requiresPhoto)
          AppCard(
            child: Column(
              children: [
                Text(l10n.threeDNeedsPhoto, style: context.text.bodyMedium, textAlign: TextAlign.center),
                Gap.md,
                FilledButton.icon(
                  onPressed: () async {
                    await context.push(AppRoutes.editProfile);
                    cubit.load();
                  },
                  icon: const Icon(Icons.add_a_photo_rounded),
                  label: Text(l10n.threeDUploadPhoto),
                ),
              ],
            ),
          )
        else if (working)
          AppCard(
            child: Row(
              children: [
                const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2)),
                Gap.md,
                Expanded(child: Text(l10n.threeDProcessing, style: context.text.bodyMedium)),
              ],
            ),
          )
        else ...[
          if (current?.status == ThreeDStatus.failed) ...[
            Text(current?.error ?? l10n.threeDFailed, style: context.text.bodySmall?.copyWith(color: AppColors.danger)),
            Gap.md,
          ],
          FilledButton.icon(
            style: FilledButton.styleFrom(backgroundColor: AppColors.premiumGold, foregroundColor: AppColors.onPremium),
            onPressed: requesting ? null : cubit.generate,
            icon: const Icon(Icons.view_in_ar_rounded),
            label: requesting
                ? const ButtonSpinner()
                : Text(shown == null ? l10n.threeDGenerate : l10n.threeDRegenerate),
          ),
        ],
      ],
    );
  }
}

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => sl<PaymentsCubit>()..load(),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.paymentsTitle)),
        body: BlocBuilder<PaymentsCubit, PagedState<Payment>>(
          builder: (context, state) {
            final cubit = context.read<PaymentsCubit>();
            return PagedStateView<Payment>(
              state: state,
              onLoadMore: cubit.loadMore,
              onRefresh: cubit.refresh,
              onRetry: cubit.load,
              empty: EmptyState(icon: Icons.receipt_long_rounded, title: l10n.paymentsEmpty, message: ''),
              itemBuilder: (context, p, _) => AppCard(
                onTap: () => context.push(AppRoutes.payment(p.reference)),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p.type == null ? p.reference : EnumsService.humanize(p.type!), style: context.text.titleSmall),
                          Text(
                            [l10n.paymentReference(p.reference), if (p.createdAt != null) DateFormatter.dayMonth(p.createdAt!)].join(' · '),
                            style: context.text.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(Formatters.money(p.amount, p.currency), style: AppTypography.number(context, size: 17)),
                        PaymentStatusBadge(status: p.status),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PaymentStatusBadge extends StatelessWidget {
  final PaymentTransactionStatus status;

  const PaymentStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final color = switch (status) {
      PaymentTransactionStatus.succeeded => AppColors.success,
      PaymentTransactionStatus.failed || PaymentTransactionStatus.cancelled => AppColors.danger,
      PaymentTransactionStatus.refunded => AppColors.info,
      _ => AppColors.warning,
    };
    final raw = switch (status) {
      PaymentTransactionStatus.requiresAction => 'requires_action',
      _ => status.name,
    };
    return StatusChip(label: context.enums.label(EnumGroup.paymentTransactionStatuses, raw), color: color);
  }
}

/// Polls one payment until the backend settles it.
class PaymentStatusPage extends StatelessWidget {
  final String reference;

  const PaymentStatusPage({super.key, required this.reference});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => PaymentStatusCubit(sl(), reference)..load(),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.paymentStatusTitle)),
        body: BlocBuilder<PaymentStatusCubit, ViewState<Payment>>(
          builder: (context, state) => ViewStateView<Payment>(
            state: state,
            onRetry: () => context.read<PaymentStatusCubit>().load(),
            builder: (context, p) {
              final (icon, color, title) = switch (p.status) {
                PaymentTransactionStatus.succeeded => (Icons.check_circle_rounded, AppColors.success, l10n.paymentSucceeded),
                PaymentTransactionStatus.failed || PaymentTransactionStatus.cancelled =>
                  (Icons.cancel_rounded, AppColors.danger, l10n.paymentFailedTitle),
                _ => (Icons.hourglass_top_rounded, AppColors.warning, l10n.paymentWaiting),
              };
              return ListView(
                padding: AppSpacing.page,
                children: [
                  Gap.xxl,
                  Icon(icon, size: 72, color: color),
                  Gap.lg,
                  Text(title, style: context.text.titleLarge, textAlign: TextAlign.center),
                  Gap.sm,
                  Text(
                    '${Formatters.money(p.amount, p.currency)} · ${l10n.paymentReference(p.reference)}',
                    style: context.text.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  if (p.failureReason != null) ...[
                    Gap.md,
                    Text(p.failureReason!, style: context.text.bodySmall?.copyWith(color: AppColors.danger), textAlign: TextAlign.center),
                  ],
                  Gap.xl,
                  if (!p.status.isTerminal && p.checkoutUrl != null)
                    FilledButton.icon(
                      onPressed: () => launchUrl(Uri.parse(p.checkoutUrl!), mode: LaunchMode.externalApplication),
                      icon: const Icon(Icons.open_in_new_rounded),
                      label: Text(l10n.paymentOpenCheckout),
                    ),
                  Gap.lg,
                  Text(l10n.paymentOnlyBackend, style: context.text.labelSmall, textAlign: TextAlign.center),
                  if (!p.status.isTerminal) ...[
                    Gap.lg,
                    Center(child: SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: context.tokens.highlight, strokeWidth: 2))),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
