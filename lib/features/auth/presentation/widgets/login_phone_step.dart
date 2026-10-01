import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_text_styles.dart';

import '../../../../core/widgets/entrance_animations.dart';

import '../../../../core/utils/jo_phone_formatter.dart';

import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/social_credential.dart';
import 'login_controls.dart';

/// Step 1 (`#stepPhone`): Jordanian mobile number.
class LoginPhoneStep extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  /// Shown in the hint slot in the error color, and outlines + shakes the
  /// field. Null shows the normal SMS hint.
  final String? error;

  /// Bump to replay the field shake.
  final int shakeTick;
  final bool loading;
  final VoidCallback onSubmit;
  final VoidCallback? onApple;
  final VoidCallback? onGoogle;

  /// Which social button is busy, if any.
  final SocialProvider? socialLoading;
  final VoidCallback? onStaffSignIn;

  const LoginPhoneStep({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.error,
    required this.shakeTick,
    required this.loading,
    required this.onSubmit,
    this.onApple,
    this.onGoogle,
    this.socialLoading,
    this.onStaffSignIn,
  });

  @override
  State<LoginPhoneStep> createState() => _LoginPhoneStepState();
}

class _LoginPhoneStepState extends State<LoginPhoneStep> {
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final valid = JoPhoneFormatter.isValid(JoPhoneFormatter.digits(widget.controller.text));
    final hasError = widget.error != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        LoginKicker(l10n.pmPhoneKicker),
        LoginHeading(title: l10n.pmPhoneTitle, subtitle: Text(l10n.pmPhoneSubtitle)),
        const SizedBox(height: 22),
        ShakeX(
          trigger: widget.shakeTick,
          child: _PhoneField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            focused: widget.focusNode.hasFocus,
            valid: valid,
            error: hasError,
            label: l10n.pmPhoneLabel,
            onSubmitted: valid && !widget.loading ? widget.onSubmit : null,
          ),
        ),
        const SizedBox(height: 8),
        // .hint (min-height:16px)
        ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 16),
          child: AnimatedDefaultTextStyle(
            duration: AppMotion.of(context, const Duration(milliseconds: 200)),
            style: AppFonts.body(size: 11.5, color: hasError ? AppColors.danger : AppColors.cream40),
            child: Text(widget.error ?? l10n.pmPhoneHint),
          ),
        ),
        const SizedBox(height: 14),
        GoldButton(label: l10n.pmContinue, enabled: valid, loading: widget.loading, onPressed: widget.onSubmit),
        // .or
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 4),
          child: Row(
            children: [
              const Expanded(child: Divider(height: 1, thickness: 1, color: AppColors.cream08)),
              const SizedBox(width: 12),
              Text(l10n.pmOrContinueWith, style: AppFonts.body(size: 12, color: AppColors.cream40)),
              const SizedBox(width: 12),
              const Expanded(child: Divider(height: 1, thickness: 1, color: AppColors.cream08)),
            ],
          ),
        ),
        // .socials
        Row(
          children: [
            if (defaultTargetPlatform == TargetPlatform.iOS) ...[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SocialSignInButton(
                    label: 'Apple',
                    svg: LoginSvgs.apple,
                    cream: true,
                    onTap: widget.onApple,
                    loading: widget.socialLoading == SocialProvider.apple,
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SocialSignInButton(
                  label: 'Google',
                  svg: LoginSvgs.google,
                  cream: false,
                  onTap: widget.onGoogle,
                  loading: widget.socialLoading == SocialProvider.google,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        // .legal
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: l10n.pmLegalPrefix),
              TextSpan(
                text: l10n.pmLegalTerms,
                style: const TextStyle(color: AppColors.goldSoft),
              ),
              TextSpan(text: l10n.pmLegalAnd),
              TextSpan(
                text: l10n.pmLegalPrivacy,
                style: const TextStyle(color: AppColors.goldSoft),
              ),
            ],
          ),
          textAlign: TextAlign.center,
          style: AppFonts.body(size: 11, height: 1.7, color: AppColors.cream40),
        ),
        if (widget.onStaffSignIn != null) _StaffSignIn(onTap: widget.onStaffSignIn!),
      ],
    );
  }
}

/// Scorekeeper sign-in, styled as a second `.legal` line.
class _StaffSignIn extends StatefulWidget {
  final VoidCallback onTap;

  const _StaffSignIn({required this.onTap});

  @override
  State<_StaffSignIn> createState() => _StaffSignInState();
}

class _StaffSignInState extends State<_StaffSignIn> {
  late final _tap = TapGestureRecognizer()..onTap = () => widget.onTap();

  @override
  void dispose() {
    _tap.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Text.rich(
    TextSpan(
      text: AppLocalizations.of(context).pmStaffSignIn,
      style: const TextStyle(color: AppColors.goldSoft),
      recognizer: _tap,
    ),
    textAlign: TextAlign.center,
    style: AppFonts.body(size: 11, height: 1.7, color: AppColors.cream40),
  );
}

/// `.field` — flag, +962, national number input and the ✓ badge. Always LTR.
class _PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool focused;
  final bool valid;
  final bool error;
  final String label;
  final VoidCallback? onSubmitted;

  const _PhoneField({
    required this.controller,
    required this.focusNode,
    required this.focused,
    required this.valid,
    required this.error,
    required this.label,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final border = error
        ? AppColors.danger
        : focused
        ? const Color.fromRGBO(227, 204, 151, .6)
        : AppColors.cream15;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        // <label> — tapping anywhere on the field focuses the input.
        onTap: focusNode.requestFocus,
        child: AnimatedContainer(
          duration: AppMotion.of(context, const Duration(milliseconds: 250)),
          curve: AppMotion.cssEase,
          height: 60,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(4, 28, 22, .55),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: border),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(201, 168, 106, .12).withValues(alpha: focused ? .12 : 0),
                spreadRadius: 4,
              ),
            ],
          ),
          child: Row(
            children: [
              // .cc
              Container(
                height: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 0, 14, 0),
                decoration: const BoxDecoration(
                  border: Border(right: BorderSide(color: AppColors.cream08)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        boxShadow: const [BoxShadow(color: Color.fromRGBO(0, 0, 0, .2), spreadRadius: 1)],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: SvgPicture.string(LoginSvgs.flagJo, width: 24, height: 16, fit: BoxFit.fill),
                    ),
                    const SizedBox(width: 8),
                    Text('+962', style: AppFonts.numeral(size: 16, color: AppColors.cream70)),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Semantics(
                    label: label, // aria-label
                    child: TextField(
                      controller: controller,
                      focusNode: focusNode,
                      keyboardType: TextInputType.phone,
                      autofillHints: const [AutofillHints.telephoneNumberNational],
                      inputFormatters: [JoPhoneFormatter()],
                      textInputAction: TextInputAction.done,
                      onSubmitted: onSubmitted == null ? null : (_) => onSubmitted!(),
                      textAlignVertical: TextAlignVertical.center,
                      cursorColor: AppColors.cream,
                      style: AppFonts.numeral(size: 19, letterSpacing: 1),
                      decoration: bareInputDecoration(
                        hintText: '7X XXX XXXX',
                        hintStyle: AppFonts.numeral(size: 19, letterSpacing: 1, color: AppColors.cream15),
                      ),
                    ),
                  ),
                ),
              ),
              // .ok
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: AnimatedScale(
                  scale: valid ? 1 : 0,
                  duration: AppMotion.of(context, const Duration(milliseconds: 350)),
                  curve: AppMotion.ease,
                  child: Container(
                    width: 24,
                    height: 24,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(color: AppColors.ball, shape: BoxShape.circle),
                    child: SvgPicture.string(LoginSvgs.check, width: 12, height: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
