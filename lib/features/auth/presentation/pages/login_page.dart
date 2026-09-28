import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/failure_l10n.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/utils/jo_phone_formatter.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/entities/social_credential.dart';
import '../../domain/usecases/sign_in_usecases.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/login_brand.dart';
import '../widgets/login_otp_step.dart';
import '../widgets/login_phone_step.dart';
import '../widgets/login_scene.dart';
import '../widgets/login_sheet.dart';
import '../widgets/login_welcome_view.dart';

/// `/login` — phone number + OTP (`auth/otp/send|resend|verify`), or Google /
/// Apple (`auth/social/{provider}`).
///
/// The verified session is persisted by the repository right away but only
/// handed to [AuthBloc] once the welcome animation has played, because the
/// router leaves `/login` the moment the bloc turns authenticated.
class LoginPage extends StatefulWidget {
  /// Injectable for tests; resolved from the service locator otherwise.
  final SendOtpUseCase? sendOtp;
  final ResendOtpUseCase? resendOtp;
  final VerifyOtpUseCase? verifyOtp;
  final SocialSignInUseCase? socialSignIn;

  const LoginPage({super.key, this.sendOtp, this.resendOtp, this.verifyOtp, this.socialSignIn});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

enum _Step { phone, otp }

class _LoginPageState extends State<LoginPage> {
  static const _defaultCooldown = 30;

  /// Time the welcome view plays before the app opens.
  static const _welcomeDuration = Duration(milliseconds: 3600);

  late final _sendOtp = widget.sendOtp ?? sl<SendOtpUseCase>();
  late final _resendOtp = widget.resendOtp ?? sl<ResendOtpUseCase>();
  late final _verifyOtp = widget.verifyOtp ?? sl<VerifyOtpUseCase>();
  late final _social = widget.socialSignIn ?? sl<SocialSignInUseCase>();

  final _phone = TextEditingController();
  final _phoneFocus = FocusNode();
  final _otp = TextEditingController();
  final _otpFocus = FocusNode();
  final _phoneKey = GlobalKey();
  final _otpKey = GlobalKey();

  _Step _step = _Step.phone;

  /// Which side each hidden step waits on (`.step.back` in the design).
  bool _phoneBack = false;
  bool _otpBack = false;

  String? _phoneError;
  int _phoneShake = 0;
  bool _sending = false;

  /// E.164 number the current OTP session was sent to.
  String? _sentPhone;
  String? _sessionId;
  String _sentTo = '';
  bool _otpDone = false;
  bool _otpError = false;
  int _otpShake = 0;
  bool _verifying = false;
  String? _otpMessage;
  int _resendIn = 0;
  bool _resending = false;
  Timer? _resendTimer;

  SocialProvider? _socialLoading;
  AuthSession? _session;
  bool _done = false;
  final _pending = <Timer>[];

  @override
  void initState() {
    super.initState();
    _phone.addListener(_onPhoneChanged);
    _otp.addListener(_onOtpChanged);
  }

  @override
  void dispose() {
    _resendTimer?.cancel();
    for (final t in _pending) {
      t.cancel();
    }
    _phone.dispose();
    _phoneFocus.dispose();
    _otp.dispose();
    _otpFocus.dispose();
    super.dispose();
  }

  void _later(Duration d, VoidCallback fn) => _pending.add(
    Timer(d, () {
      if (mounted) fn();
    }),
  );

  String _message(Failure failure) => failure.localizedMessage(context);

  String get _digits => JoPhoneFormatter.digits(_phone.text);

  String _lastPhone = '';

  void _onPhoneChanged() {
    if (_phone.text == _lastPhone) return;
    _lastPhone = _phone.text;
    final d = _digits;
    final wrongPrefix = d.length == 9 && !JoPhoneFormatter.isValid(d);
    final l10n = AppLocalizations.of(context);
    setState(() {
      _phoneError = wrongPrefix ? l10n.pmPhoneInvalid : null;
      if (wrongPrefix) _phoneShake++;
    });
  }

  String _lastOtp = '';

  /// Auto-verifies on the 6th digit.
  void _onOtpChanged() {
    if (_otp.text == _lastOtp) return;
    _lastOtp = _otp.text;
    setState(() {
      _otpError = false;
      _otpDone = false;
    });
    if (_otp.text.length == LoginOtpStep.length) _verify();
  }

  void _go(_Step to, {required bool back}) {
    setState(() {
      if (to == _Step.otp) {
        _phoneBack = !back;
        _otpBack = back;
      } else {
        _otpBack = !back;
        _phoneBack = back;
      }
      _step = to;
    });
  }

  void _startTimer(int? seconds) {
    _resendTimer?.cancel();
    setState(() => _resendIn = seconds ?? _defaultCooldown);
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return t.cancel();
      setState(() => _resendIn = math.max(0, _resendIn - 1));
      if (_resendIn == 0) t.cancel();
    });
  }

  Future<void> _send() async {
    final d = _digits;
    if (!JoPhoneFormatter.isValid(d) || _sending) return;
    final phone = JoPhoneFormatter.e164(d);
    setState(() => _sending = true);
    final result = await _sendOtp(phone: phone);
    if (!mounted) return;
    result.match(
      (failure) => setState(() {
        _sending = false;
        _phoneError = _message(failure);
        _phoneShake++;
      }),
      (challenge) {
        _sessionId = challenge.sessionId;
        _sentPhone = phone;
        setState(() {
          _sending = false;
          _sentTo = '+962 ${_phone.text}';
          _otpMessage = null;
          _otpError = false;
          _otpDone = false;
        });
        _go(_Step.otp, back: false);
        _otp.clear();
        _startTimer(challenge.resendAvailableIn);
        _later(const Duration(milliseconds: 400), _otpFocus.requestFocus);
      },
    );
  }

  void _toPhone() {
    if (_verifying) return;
    _go(_Step.phone, back: true);
    _later(const Duration(milliseconds: 400), _phoneFocus.requestFocus);
  }

  Future<void> _resend() async {
    final sessionId = _sessionId, phone = _sentPhone;
    if (_resendIn > 0 || _resending || sessionId == null || phone == null) return;
    setState(() {
      _resending = true;
      _otpMessage = null;
    });
    final result = await _resendOtp(sessionId: sessionId, phone: phone);
    if (!mounted) return;
    result.match(
      (failure) => setState(() {
        _resending = false;
        _otpMessage = _message(failure);
      }),
      (challenge) {
        _sessionId = challenge.sessionId;
        setState(() => _resending = false);
        _startTimer(challenge.resendAvailableIn);
      },
    );
  }

  Future<void> _verify() async {
    final sessionId = _sessionId, phone = _sentPhone;
    if (_verifying || _otp.text.length != LoginOtpStep.length || _done || sessionId == null || phone == null) return;
    setState(() {
      _verifying = true;
      _otpMessage = null;
    });
    final result = await _verifyOtp(sessionId: sessionId, phone: phone, code: _otp.text);
    if (!mounted) return;
    result.match(
      (failure) {
        setState(() {
          _verifying = false;
          _otpError = true;
          _otpShake++;
          _otpMessage = _message(failure);
        });
        _later(const Duration(milliseconds: 700), () {
          _lastOtp = '';
          _otp.clear();
          setState(() => _otpError = false);
          _otpFocus.requestFocus();
        });
      },
      (session) {
        setState(() {
          _session = session;
          _verifying = false;
          _otpDone = true;
        });
        _otpFocus.unfocus();
        _resendTimer?.cancel();
        _later(const Duration(milliseconds: 500), _celebrate);
      },
    );
  }

  /// Welcome view, then into the app.
  void _celebrate() {
    setState(() => _done = true);
    _later(_welcomeDuration, _enterApp);
  }

  Future<void> _socialSignIn(SocialProvider provider) async {
    if (_socialLoading != null || _sending) return;
    FocusScope.of(context).unfocus();
    setState(() {
      _socialLoading = provider;
      _phoneError = null;
    });
    final result = await _social(provider);
    if (!mounted) return;
    result.match(
      (failure) => setState(() {
        _socialLoading = null;
        _phoneError = _message(failure);
      }),
      (session) {
        setState(() {
          _socialLoading = null;
          _session = session;
        });
        if (session != null) _celebrate();
      },
    );
  }

  /// Hands the session to [AuthBloc]; the router then opens the right shell.
  /// New accounts start without a complete profile, so they finish it first.
  Future<void> _enterApp() async {
    final session = _session;
    if (session == null) return;
    final router = GoRouter.of(context);
    final bloc = context.read<AuthBloc>();
    final signedIn = bloc.stream.firstWhere((s) => s is AuthAuthenticated);
    bloc.add(AuthEvent.sessionEstablished(session));
    await signedIn;
    if (!session.profileCompleted && session.accountType.hasPlayerProfile) {
      router
        ..go(AppRoutes.home)
        ..push(AppRoutes.editProfile);
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final size = media.size;
    final rtl = Directionality.of(context) == TextDirection.rtl;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.green950,
      ),
      child: PopScope(
        canPop: _step == _Step.phone || _done,
        onPopInvokedWithResult: (didPop, _) {
          if (!didPop) _toPhone();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.green950,
          body: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              const Positioned.fill(child: LoginBackground()),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: size.height * .62,
                child: IgnorePointer(child: LoginCourtScene(done: _done)),
              ),
              Positioned(top: 118, left: 0, right: 0, child: LoginBrand(done: _done)),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: LoginSheet(
                  done: _done,
                  keyboard: media.viewInsets.bottom,
                  maxHeight: size.height - media.viewInsets.bottom - media.padding.top,
                  bottomPadding: math.max(34, media.padding.bottom),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      _slot(
                        key: _phoneKey,
                        visible: _step == _Step.phone,
                        back: _phoneBack,
                        rtl: rtl,
                        child: LoginPhoneStep(
                          controller: _phone,
                          focusNode: _phoneFocus,
                          error: _phoneError,
                          shakeTick: _phoneShake,
                          loading: _sending,
                          onSubmit: _send,
                          onApple: () => _socialSignIn(SocialProvider.apple),
                          onGoogle: () => _socialSignIn(SocialProvider.google),
                          socialLoading: _socialLoading,
                          onStaffSignIn: () => context.push(AppRoutes.scorekeeperLogin),
                        ),
                      ),
                      _slot(
                        key: _otpKey,
                        visible: _step == _Step.otp,
                        back: _otpBack,
                        rtl: rtl,
                        child: LoginOtpStep(
                          controller: _otp,
                          focusNode: _otpFocus,
                          phoneDisplay: _sentTo,
                          done: _otpDone,
                          error: _otpError,
                          shakeTick: _otpShake,
                          loading: _verifying,
                          resendIn: _resendIn,
                          resendBusy: _resending,
                          message: _otpMessage,
                          onBack: _toPhone,
                          onVerify: _verify,
                          onResend: _resend,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: LoginWelcomeView(play: _done, playerId: _session?.player?.playerId ?? ''),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// The hidden step is taken out of flow, faded (.45s) and shifted ∓40px
  /// (.6s); offsets mirror in LTR so steps still flow "forward". [key] keeps
  /// the animated wrapper alive while it moves in and out of the
  /// [Positioned] slot, so the transitions run.
  Widget _slot({
    required GlobalKey key,
    required bool visible,
    required bool back,
    required bool rtl,
    required Widget child,
  }) {
    final dx = visible ? 0.0 : (back ? 40.0 : -40.0) * (rtl ? 1 : -1);
    final content = IgnorePointer(
      key: key,
      ignoring: !visible,
      child: ExcludeSemantics(
        excluding: !visible,
        child: AnimatedOpacity(
          opacity: visible ? 1 : 0,
          duration: AppMotion.of(context, const Duration(milliseconds: 450)),
          curve: AppMotion.cssEase,
          child: TweenAnimationBuilder<double>(
            tween: Tween(end: dx),
            duration: AppMotion.of(context, const Duration(milliseconds: 600)),
            curve: AppMotion.ease,
            child: child,
            builder: (_, x, child) => Transform.translate(offset: Offset(x, 0), child: child),
          ),
        ),
      ),
    );
    return visible ? content : Positioned(top: 0, left: 0, right: 0, child: content);
  }
}
