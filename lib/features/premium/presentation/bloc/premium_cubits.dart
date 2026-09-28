import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_durations.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../../core/state/base_cubits.dart';
import '../../../../core/state/view_state.dart';
import '../../domain/entities/ai_insight.dart';
import '../../domain/entities/premium.dart';
import '../../domain/usecases/premium_usecases.dart';

class PremiumOverview {
  final PremiumCatalog catalog;

  /// Null when the status couldn't be loaded (e.g. coach-only account).
  final PremiumStatus? status;

  const PremiumOverview({required this.catalog, this.status});
}

/// Plans (public) + my status (player).
class PremiumCubit extends ViewCubit<PremiumOverview> {
  final GetPremiumPlansUseCase getPlans;
  final GetPremiumStatusUseCase getStatus;

  PremiumCubit({required this.getPlans, required this.getStatus});

  @override
  ApiResult<PremiumOverview> fetch() async {
    final plans = await getPlans();
    final status = await getStatus();
    return plans.map((catalog) => PremiumOverview(catalog: catalog, status: status.toNullable()));
  }

  @override
  bool isEmpty(PremiumOverview data) => false;
}

/// `premium/checkout` → Payment, or 503 (coming soon).
class CheckoutCubit extends ActionCubit {
  final StartCheckoutUseCase startCheckout;

  CheckoutCubit(this.startCheckout);

  Future<bool> checkout(String planKey) => run(() => startCheckout(planKey));
}

class PaymentsCubit extends PagedCubit<Payment> {
  final GetMyPaymentsUseCase getPayments;

  PaymentsCubit(this.getPayments);

  @override
  ApiResult<Paginated<Payment>> fetchPage(int page) => getPayments(page: page);
}

/// Polls `GET payments/{reference}` until the backend reports a terminal
/// status. The app never decides a payment succeeded on its own.
class PaymentStatusCubit extends ViewCubit<Payment> {
  final GetPaymentUseCase getPayment;
  final String reference;
  Timer? _timer;

  PaymentStatusCubit(this.getPayment, this.reference);

  @override
  ApiResult<Payment> fetch() async {
    final result = await getPayment(reference);
    result.match((_) => null, (p) {
      if (p.status.isTerminal) {
        _timer?.cancel();
      } else {
        _timer ??= Timer.periodic(AppDurations.jobPoll, (_) => refresh());
      }
    });
    return result;
  }

  @override
  bool isEmpty(Payment data) => false;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}

class AiInsightsState {
  final ViewState<AiInsightsOverview> overview;
  final Set<AiInsightType> busy;
  final Failure? lastFailure;

  const AiInsightsState({this.overview = const ViewState.initial(), this.busy = const {}, this.lastFailure});

  AiInsightsState copyWith({ViewState<AiInsightsOverview>? overview, Set<AiInsightType>? busy, Failure? lastFailure}) =>
      AiInsightsState(overview: overview ?? this.overview, busy: busy ?? this.busy, lastFailure: lastFailure);
}

/// The 7 insight cards. Generation returns 202 while pending; each pending
/// insight is polled every few seconds until it settles.
class AiInsightsCubit extends Cubit<AiInsightsState> {
  final GetAiInsightsUseCase getInsights;
  final GenerateAiInsightUseCase generate;
  final GetAiInsightUseCase getInsight;
  final Map<int, Timer> _polls = {};

  AiInsightsCubit({required this.getInsights, required this.generate, required this.getInsight})
      : super(const AiInsightsState());

  Future<void> load() async {
    emit(state.copyWith(overview: const ViewState.loading()));
    final result = await getInsights();
    if (isClosed) return;
    result.match(
      (f) => emit(state.copyWith(overview: ViewState.error(f))),
      (overview) {
        emit(state.copyWith(overview: ViewState.loaded(overview)));
        for (final insight in overview.insights.values.whereType<AiInsight>()) {
          if (insight.status.isWorking) _poll(insight);
        }
      },
    );
  }

  Future<void> run(AiInsightType type, {bool refresh = false}) async {
    emit(state.copyWith(busy: {...state.busy, type}));
    final result = await generate(type, refresh: refresh);
    if (isClosed) return;
    result.match(
      (f) => emit(state.copyWith(busy: {...state.busy}..remove(type), lastFailure: f)),
      (insight) {
        _put(type, insight);
        if (insight.status.isWorking) _poll(insight);
      },
    );
  }

  void _poll(AiInsight insight) {
    if (_polls.containsKey(insight.id)) return;
    _polls[insight.id] = Timer.periodic(AppDurations.jobPoll, (timer) async {
      final result = await getInsight(insight.id);
      if (isClosed) return timer.cancel();
      result.match((_) => null, (fresh) {
        final type = fresh.type ?? insight.type;
        if (type != null) _put(type, fresh);
        if (!fresh.status.isWorking) _polls.remove(insight.id)?.cancel();
      });
    });
  }

  void _put(AiInsightType type, AiInsight insight) {
    final current = state.overview.dataOrNull;
    if (current == null) return;
    final insights = {...current.insights, type: insight};
    emit(state.copyWith(
      overview: ViewState.loaded(AiInsightsOverview(types: current.types, insights: insights)),
      busy: {...state.busy}..remove(type),
    ));
  }

  @override
  Future<void> close() {
    for (final t in _polls.values) {
      t.cancel();
    }
    return super.close();
  }
}

class ThreeDState {
  final ViewState<ThreeDProfileState> profile;
  final bool requesting;
  final Failure? lastFailure;

  const ThreeDState({this.profile = const ViewState.initial(), this.requesting = false, this.lastFailure});

  ThreeDState copyWith({ViewState<ThreeDProfileState>? profile, bool? requesting, Failure? lastFailure}) =>
      ThreeDState(profile: profile ?? this.profile, requesting: requesting ?? this.requesting, lastFailure: lastFailure);
}

/// 3D identity lifecycle: status → request (202 / 503 / 400 no photo) → poll.
class ThreeDCubit extends Cubit<ThreeDState> {
  final GetMy3dProfileUseCase getProfile;
  final Request3dProfileUseCase request;
  Timer? _timer;

  ThreeDCubit({required this.getProfile, required this.request}) : super(const ThreeDState());

  Future<void> load({bool silent = false}) async {
    if (!silent) emit(state.copyWith(profile: const ViewState.loading()));
    final result = await getProfile();
    if (isClosed) return;
    result.match(
      (f) {
        if (!silent) emit(state.copyWith(profile: ViewState.error(f)));
      },
      (p) {
        emit(state.copyWith(profile: ViewState.loaded(p)));
        if (p.current?.status.isWorking ?? false) {
          _timer ??= Timer.periodic(AppDurations.jobPoll, (_) => load(silent: true));
        } else {
          _timer?.cancel();
          _timer = null;
        }
      },
    );
  }

  Future<void> generate() async {
    emit(state.copyWith(requesting: true));
    final result = await request();
    if (isClosed) return;
    result.match(
      (f) => emit(state.copyWith(requesting: false, lastFailure: f)),
      (_) {
        emit(state.copyWith(requesting: false));
        load(silent: true);
      },
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
