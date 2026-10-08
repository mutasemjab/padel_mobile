import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/country_field.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../players/domain/entities/player.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../bloc/edit_profile_cubit.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/delete_account_dialog.dart';

/// Personal fields only — competitive fields are never editable.
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final player = context.read<AuthBloc>().state.currentPlayer;
    return BlocProvider(
      create: (_) => sl<EditProfileCubit>(),
      child: player == null ? const Scaffold() : _EditProfileView(player: player),
    );
  }
}

class _EditProfileView extends StatefulWidget {
  final Player player;

  const _EditProfileView({required this.player});

  @override
  State<_EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<_EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  late final _name = TextEditingController(text: widget.player.name);
  late final _phone = TextEditingController(text: widget.player.phone ?? '');
  late String? _country = widget.player.country;
  late final _bio = TextEditingController(text: widget.player.bio ?? '');
  late String? _gender = widget.player.gender?.name;
  late String? _side = widget.player.side?.name;
  late DateTime? _dob = widget.player.dateOfBirth;
  String? _photoUrl;

  static const _maxPhotoBytes = 4 * 1024 * 1024;

  @override
  void dispose() {
    _name.dispose();
    _phone.dispose();
    _bio.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto(ImageSource source) async {
    final l10n = AppLocalizations.of(context);
    final file = await ImagePicker().pickImage(source: source, maxWidth: 1080, maxHeight: 1080, imageQuality: 85);
    if (file == null || !mounted) return;
    if (await file.length() > _maxPhotoBytes) {
      if (mounted) showAppSnack(context, l10n.editProfilePhotoHint);
      return;
    }
    if (!mounted) return;
    final cubit = context.read<EditProfileCubit>();
    if (await cubit.upload(file.path) && mounted) {
      final updated = (cubit.state as ActionSuccess).result as Player;
      setState(() => _photoUrl = updated.photoUrl);
      context.read<AuthBloc>().add(AuthEvent.playerUpdated(updated));
    }
  }

  Future<void> _pickDob() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      // Calendar only: no pencil, dates cannot be typed.
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      // Birth dates are years back: open on the year list, then month and day.
      initialDatePickerMode: DatePickerMode.year,
      initialDate: _dob ?? DateTime(now.year - 25),
      firstDate: DateTime(1920),
      lastDate: now,
    );
    if (picked != null) setState(() => _dob = picked);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final l10n = AppLocalizations.of(context);
    final cubit = context.read<EditProfileCubit>();
    final ok = await cubit.save({
      'name': _name.text.trim(),
      'phone': _phone.text.trim().isEmpty ? null : _phone.text.trim(),
      'country': _country?.toUpperCase(),
      'gender': _gender,
      'side': _side,
      'bio': _bio.text.trim().isEmpty ? null : _bio.text.trim(),
      'date_of_birth': _dob == null ? null : DateFormatter.apiDate(_dob!),
    });
    if (!mounted || !ok) return;
    context.read<AuthBloc>().add(AuthEvent.playerUpdated((cubit.state as ActionSuccess).result as Player));
    showAppSnack(context, l10n.editProfileSaved, icon: Icons.check_circle_rounded);
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.editProfileTitle)),
      body: BlocConsumer<EditProfileCubit, ActionState>(
        listener: (context, state) {
          if (state is ActionFailure && state.failure is! ValidationFailure) showFailure(context, state.failure);
        },
        builder: (context, state) {
          final busy = state is ActionInProgress;
          final validation = state is ActionFailure && state.failure is ValidationFailure
              ? state.failure as ValidationFailure
              : null;
          return Form(
            key: _formKey,
            child: ListView(
              padding: AppSpacing.page,
              children: [
                Center(
                  child: Column(
                    children: [
                      PlayerAvatar(
                        name: widget.player.name,
                        photoUrl: _photoUrl ?? widget.player.photoUrl,
                        level: widget.player.level?.label,
                        isPremium: widget.player.isPremium,
                        size: AppSizes.avatarXl,
                      ),
                      Gap.md,
                      Wrap(
                        spacing: AppSpacing.sm,
                        children: [
                          OutlinedButton.icon(
                            onPressed: busy ? null : () => _pickPhoto(ImageSource.gallery),
                            icon: const Icon(Icons.photo_library_rounded),
                            label: Text(l10n.editProfilePhoto),
                          ),
                          IconButton.outlined(
                            onPressed: busy ? null : () => _pickPhoto(ImageSource.camera),
                            icon: const Icon(Icons.photo_camera_rounded),
                          ),
                        ],
                      ),
                      Gap.xs,
                      Text(l10n.editProfilePhotoHint, style: context.text.bodySmall, textAlign: TextAlign.center),
                    ],
                  ),
                ),
                Gap.xxl,
                AppCard(
                  child: Row(
                    children: [
                      Icon(Icons.verified_user_rounded, color: context.tokens.highlight),
                      Gap.md,
                      Expanded(child: Text(l10n.editProfileCompetitiveNote, style: context.text.bodySmall)),
                    ],
                  ),
                ),
                Gap.xl,
                AuthTextField(
                  controller: _name,
                  label: l10n.fieldFullName,
                  errorText: validation?.firstErrorFor('name'),
                  validator: (v) => (v == null || v.trim().isEmpty) ? l10n.errorNameRequired : null,
                ),
                Gap.lg,
                AuthTextField(
                  controller: _phone,
                  label: l10n.fieldPhoneOptional,
                  keyboardType: TextInputType.phone,
                  errorText: validation?.firstErrorFor('phone'),
                ),
                Gap.lg,
                CountryField(
                  value: _country,
                  label: l10n.fieldCountry,
                  errorText: validation?.firstErrorFor('country'),
                  onChanged: (code) => setState(() => _country = code),
                ),
                Gap.lg,
                Row(
                  children: [
                    Expanded(
                      child: _EnumDropdown(
                        label: l10n.fieldGender,
                        group: EnumGroup.genders,
                        value: _gender,
                        onChanged: (v) => setState(() => _gender = v),
                      ),
                    ),
                    Gap.md,
                    Expanded(
                      child: _EnumDropdown(
                        label: l10n.fieldSide,
                        group: EnumGroup.playerSides,
                        value: _side,
                        onChanged: (v) => setState(() => _side = v),
                      ),
                    ),
                  ],
                ),
                Gap.lg,
                InkWell(
                  onTap: _pickDob,
                  borderRadius: AppRadius.mdAll,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: l10n.fieldDateOfBirth,
                      errorText: validation?.firstErrorFor('date_of_birth'),
                      suffixIcon: const Icon(Icons.cake_rounded),
                    ),
                    child: Text(_dob == null ? l10n.valueDash : DateFormatter.fullDate(_dob!)),
                  ),
                ),
                Gap.lg,
                TextFormField(
                  controller: _bio,
                  maxLines: 3,
                  maxLength: 500,
                  decoration: InputDecoration(labelText: l10n.fieldBio, errorText: validation?.firstErrorFor('bio')),
                ),
                Gap.xl,
                FilledButton(
                  onPressed: busy ? null : _save,
                  child: busy ? const ButtonSpinner() : Text(l10n.actionSave),
                ),
                Gap.lg,
                TextButton.icon(
                  onPressed: () => showChangePasswordSheet(context),
                  icon: const Icon(Icons.lock_reset_rounded),
                  label: Text(l10n.changePasswordTitle),
                ),
                Gap.sm,
                TextButton.icon(
                  style: TextButton.styleFrom(foregroundColor: AppColors.danger),
                  onPressed: () => showDeleteAccountDialog(context),
                  icon: const Icon(Icons.delete_forever_rounded),
                  label: Text(l10n.deleteAccountTitle),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _EnumDropdown extends StatelessWidget {
  final String label;
  final String group;
  final String? value;
  final ValueChanged<String?> onChanged;

  const _EnumDropdown({required this.label, required this.group, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final options = context.enums.options(group);
    final items = options.isNotEmpty ? options : [if (value != null) EnumOption(value!, EnumsService.humanize(value!))];
    return DropdownButtonFormField<String>(
      initialValue: items.any((o) => o.value == value) ? value : null,
      decoration: InputDecoration(labelText: label),
      items: [for (final o in items) DropdownMenuItem(value: o.value, child: Text(o.label))],
      onChanged: onChanged,
    );
  }
}

Future<void> showChangePasswordSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => BlocProvider(create: (_) => sl<EditProfileCubit>(), child: const _ChangePasswordSheet()),
  );
}

class _ChangePasswordSheet extends StatefulWidget {
  const _ChangePasswordSheet();

  @override
  State<_ChangePasswordSheet> createState() => _ChangePasswordSheetState();
}

class _ChangePasswordSheetState extends State<_ChangePasswordSheet> {
  final _formKey = GlobalKey<FormState>();
  final _current = TextEditingController();
  final _new = TextEditingController();
  final _confirm = TextEditingController();

  @override
  void dispose() {
    _current.dispose();
    _new.dispose();
    _confirm.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final l10n = AppLocalizations.of(context);
    final ok = await context.read<EditProfileCubit>().updatePassword(
      currentPassword: _current.text,
      password: _new.text,
      passwordConfirmation: _confirm.text,
    );
    if (!mounted || !ok) return;
    Navigator.of(context).pop();
    showAppSnack(context, l10n.passwordChanged, icon: Icons.lock_rounded);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocConsumer<EditProfileCubit, ActionState>(
      listener: (context, state) {
        if (state is ActionFailure && state.failure is! ValidationFailure) showFailure(context, state.failure);
      },
      builder: (context, state) {
        final busy = state is ActionInProgress;
        final validation = state is ActionFailure && state.failure is ValidationFailure
            ? state.failure as ValidationFailure
            : null;
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            AppSpacing.xl,
            0,
            AppSpacing.xl,
            MediaQuery.viewInsetsOf(context).bottom + AppSpacing.xl,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(l10n.changePasswordTitle, style: context.text.titleLarge),
                Gap.lg,
                AuthTextField(
                  controller: _current,
                  label: l10n.fieldCurrentPassword,
                  obscureText: true,
                  errorText: validation?.firstErrorFor('current_password'),
                  validator: (v) => (v == null || v.isEmpty) ? l10n.errorPasswordRequired : null,
                ),
                Gap.md,
                AuthTextField(
                  controller: _new,
                  label: l10n.fieldNewPassword,
                  obscureText: true,
                  errorText: validation?.firstErrorFor('password'),
                  validator: (v) => (v == null || v.length < 8) ? l10n.errorPasswordLength : null,
                ),
                Gap.md,
                AuthTextField(
                  controller: _confirm,
                  label: l10n.fieldConfirmPassword,
                  obscureText: true,
                  validator: (v) => v != _new.text ? l10n.errorPasswordsMismatch : null,
                ),
                Gap.xl,
                FilledButton(
                  onPressed: busy ? null : _submit,
                  child: busy ? const ButtonSpinner() : Text(l10n.actionSave),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
