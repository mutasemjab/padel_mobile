import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';

import '../../../../core/widgets/entrance_animations.dart';

import '../../../../l10n/gen/app_localizations.dart';
import 'login_controls.dart';

/// Step 2 (`#stepOtp`): the 6-digit code.
class LoginOtpStep extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  /// `+962 7X XXX XXXX` as typed on step 1.
  final String phoneDisplay;

  /// `.boxes.done` — verified.
  final bool done;

  /// `.boxes.err` — wrong code (shake + red outline).
  final bool error;
  final int shakeTick;
  final bool loading;

  /// Seconds left on the resend timer; 0 enables "resend".
  final int resendIn;
  final bool resendBusy;

  /// Server message for a failed verify / resend (replaces the demo hint line).
  final String? message;
  final VoidCallback onBack;
  final VoidCallback onVerify;
  final VoidCallback onResend;

  const LoginOtpStep({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.phoneDisplay,
    required this.done,
    required this.error,
    required this.shakeTick,
    required this.loading,
    required this.resendIn,
    required this.resendBusy,
    required this.message,
    required this.onBack,
    required this.onVerify,
    required this.onResend,
  });

  static const length = 6;

  @override
  State<LoginOtpStep> createState() => _LoginOtpStepState();
}

class _LoginOtpStepState extends State<LoginOtpStep> {
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_rebuild);
    widget.controller.addListener(_rebuild);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_rebuild);
    widget.controller.removeListener(_rebuild);
    super.dispose();
  }

  void _rebuild() => setState(() {});

  static String _clock(int s) => '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final code = widget.controller.text;
    final focused = widget.focusNode.hasFocus;
    final rtl = Directionality.of(context) == TextDirection.rtl;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // .back-btn — the chevron points "back" for the current direction.
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Semantics(
            button: true,
            label: l10n.pmBack,
            excludeSemantics: true,
            child: GestureDetector(
              onTap: widget.onBack,
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.cream08,
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: AppColors.cream15),
                ),
                child: Transform.flip(flipX: !rtl, child: SvgPicture.string(LoginSvgs.chevron, width: 18, height: 18)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),
        LoginKicker(l10n.pmOtpKicker),
        LoginHeading(
          title: l10n.pmOtpTitle,
          subtitle: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '${l10n.pmOtpSentTo} '),
                // .num-chip + .edit in one placeholder: separate placeholders
                // are laid out as LTR runs and would swap places in Arabic.
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Text(widget.phoneDisplay, style: AppFonts.numeral(size: 15)),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: widget.onBack,
                        child: Text(l10n.pmOtpEdit, style: AppFonts.body(size: 12.5, color: AppColors.goldSoft)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        // .otp — visible boxes with the real input stretched invisibly on top.
        Stack(
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  for (var i = 0; i < LoginOtpStep.length; i++) ...[
                    if (i > 0) const SizedBox(width: 8),
                    Expanded(
                      child: ShakeX(
                        trigger: widget.shakeTick,
                        child: _OtpBox(
                          digit: i < code.length ? code[i] : '',
                          active:
                              focused &&
                              code.length < LoginOtpStep.length &&
                              i == code.length.clamp(0, LoginOtpStep.length - 1),
                          done: widget.done,
                          error: widget.error,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Positioned.fill(
              child: Opacity(
                opacity: 0,
                child: Semantics(
                  label: l10n.pmOtpLabel,
                  child: TextField(
                    controller: widget.controller,
                    focusNode: widget.focusNode,
                    keyboardType: TextInputType.number,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(LoginOtpStep.length),
                    ],
                    showCursor: false,
                    enableInteractiveSelection: false,
                    style: const TextStyle(fontSize: 16, color: Colors.transparent),
                    decoration: bareInputDecoration(),
                    expands: true,
                    maxLines: null,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        // .resend
        DefaultTextStyle.merge(
          style: AppFonts.body(size: 12.5, color: AppColors.cream40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(child: Text(l10n.pmOtpNotReceived)),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: widget.resendIn > 0 || widget.resendBusy ? null : widget.onResend,
                    child: Text(
                      l10n.pmOtpResend,
                      style: AppFonts.body(
                        size: 12.5,
                        color: widget.resendIn > 0 || widget.resendBusy ? AppColors.cream15 : AppColors.goldSoft,
                      ),
                    ),
                  ),
                  if (widget.resendIn > 0) ...[
                    const Text(' '),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(_clock(widget.resendIn), style: AppFonts.numeral(size: 14, color: AppColors.cream70)),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        GoldButton(
          label: l10n.pmOtpConfirm,
          enabled: code.length == LoginOtpStep.length,
          loading: widget.loading,
          onPressed: widget.onVerify,
        ),
        if (widget.message != null) ...[
          const SizedBox(height: 18),
          Text(
            widget.message!,
            textAlign: TextAlign.center,
            style: AppFonts.body(size: 11, height: 1.7, color: AppColors.danger),
          ),
        ],
      ],
    );
  }
}

/// `.box` with its filled / active / done / err states.
class _OtpBox extends StatefulWidget {
  final String digit;
  final bool active;
  final bool done;
  final bool error;

  const _OtpBox({required this.digit, required this.active, required this.done, required this.error});

  @override
  State<_OtpBox> createState() => _OtpBoxState();
}

class _OtpBoxState extends State<_OtpBox> with TickerProviderStateMixin {
  /// `@keyframes tick{0%{scale(.9)}60%{scale(1.06)}100%{scale(1)}}` .3s
  late final AnimationController _tick = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
    value: 1,
  );
  late final AnimationController _blink = AnimationController(vsync: this, duration: const Duration(seconds: 1));

  static final _tickScale = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: .9, end: 1.06).chain(CurveTween(curve: AppMotion.ease)), weight: 60),
    TweenSequenceItem(tween: Tween(begin: 1.06, end: 1.0).chain(CurveTween(curve: AppMotion.ease)), weight: 40),
  ]);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _syncBlink();
  }

  @override
  void didUpdateWidget(_OtpBox old) {
    super.didUpdateWidget(old);
    if (widget.digit.isNotEmpty && old.digit.isEmpty) {
      _tick.duration = AppMotion.of(context, const Duration(milliseconds: 300));
      _tick.forward(from: 0);
    }
    if (widget.active != old.active) _syncBlink();
  }

  /// `.box.active::after{animation:blink 1s steps(1) infinite}`
  void _syncBlink() {
    if (widget.active && !context.reduceMotion) {
      if (!_blink.isAnimating) _blink.repeat();
    } else {
      _blink.stop();
      _blink.value = 0;
    }
  }

  @override
  void dispose() {
    _tick.dispose();
    _blink.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filled = widget.digit.isNotEmpty;
    final Color border;
    if (widget.error) {
      border = AppColors.danger;
    } else if (widget.done) {
      border = const Color.fromRGBO(223, 240, 90, .5);
    } else if (widget.active) {
      border = AppColors.goldSoft;
    } else if (filled) {
      border = const Color.fromRGBO(227, 204, 151, .45);
    } else {
      border = AppColors.cream15;
    }

    return ScaleTransition(
      scale: _tick.drive(_tickScale),
      child: AnimatedContainer(
        duration: AppMotion.of(context, const Duration(milliseconds: 300)),
        curve: AppMotion.cssEase,
        height: 62,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.done ? const Color.fromRGBO(223, 240, 90, .1) : const Color.fromRGBO(4, 28, 22, .55),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: border),
          boxShadow: widget.active
              ? const [BoxShadow(color: Color.fromRGBO(201, 168, 106, .12), spreadRadius: 4)]
              : null,
        ),
        child: filled
            ? Text(
                widget.digit,
                style: AppFonts.numeral(size: 26, color: widget.done ? AppColors.ball : AppColors.cream),
              )
            : widget.active
            ? AnimatedBuilder(
                animation: _blink,
                builder: (_, _) => Opacity(
                  opacity: _blink.value < .5 ? 1 : 0,
                  child: Container(width: 2, height: 26, color: AppColors.goldSoft),
                ),
              )
            : null,
      ),
    );
  }
}
