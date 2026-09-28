import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../coaches/domain/entities/booking.dart';
import '../../../coaches/domain/entities/coach.dart';
import '../../../coaches/presentation/pages/my_training_pages.dart';
import '../bloc/coach_portal_cubits.dart';

/// `POST coach/profile` (multipart when a new photo is picked).
class CoachProfileEditPage extends StatelessWidget {
  const CoachProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<CoachProfileCubit>()..load()),
        BlocProvider(create: (_) => sl<CoachPortalActionCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.coachPortalProfile)),
        body: BlocBuilder<CoachProfileCubit, ViewState<Coach>>(
          builder: (context, state) => ViewStateView<Coach>(
            state: state,
            onRetry: () => context.read<CoachProfileCubit>().load(),
            builder: (context, coach) => _Form(coach: coach),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  final Coach coach;

  const _Form({required this.coach});

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  late final _name = TextEditingController(text: widget.coach.name);
  late final _phone = TextEditingController(text: widget.coach.phone ?? '');
  late final _bio = TextEditingController(text: widget.coach.bio ?? '');
  late final _city = TextEditingController(text: widget.coach.city ?? '');
  late final _price = TextEditingController(text: '${widget.coach.pricePerHour}');
  late final _years = TextEditingController(text: widget.coach.yearsExperience?.toString() ?? '');
  late final _languages = TextEditingController(text: widget.coach.languages.join(', '));
  late final Set<String> _specialties = {...widget.coach.specialties};
  late final Set<String> _types = {...widget.coach.trainingTypes};
  String? _photoPath;

  @override
  void dispose() {
    for (final c in [_name, _phone, _bio, _city, _price, _years, _languages]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context);
    final ok = await context.read<CoachPortalActionCubit>().saveProfile({
      'name': _name.text.trim(),
      if (_phone.text.trim().isNotEmpty) 'phone': _phone.text.trim(),
      'bio': _bio.text.trim(),
      'city': _city.text.trim(),
      if (num.tryParse(_price.text.trim()) != null) 'price_per_hour': num.parse(_price.text.trim()),
      if (int.tryParse(_years.text.trim()) != null) 'years_experience': int.parse(_years.text.trim()),
      'specialties': _specialties.toList(),
      'training_types': _types.toList(),
      'languages': _languages.text.split(',').map((s) => s.trim()).where((s) => s.isNotEmpty).toList(),
    }, photoPath: _photoPath);
    if (!mounted) return;
    final state = context.read<CoachPortalActionCubit>().state;
    if (ok) {
      showAppSnack(context, l10n.coachProfileSaved, icon: Icons.check_circle_rounded);
      Navigator.of(context).maybePop();
    } else if (state is ActionFailure) {
      showFailure(context, state.failure);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    Widget chips(String group, Set<String> selected) => Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (final o in context.enums.options(group))
              FilterChip(
                label: Text(o.label),
                selected: selected.contains(o.value),
                selectedColor: AppColors.info,
                onSelected: (on) => setState(() => on ? selected.add(o.value) : selected.remove(o.value)),
              ),
          ],
        );
    return ListView(
      padding: AppSpacing.page,
      children: [
        Center(
          child: Column(
            children: [
              PlayerAvatar(name: widget.coach.name, photoUrl: _photoPath == null ? widget.coach.photoUrl : null, size: AppSizes.avatarXl, showRing: false),
              TextButton.icon(
                onPressed: () async {
                  final f = await ImagePicker().pickImage(source: ImageSource.gallery, maxWidth: 1080, imageQuality: 85);
                  if (f != null) setState(() => _photoPath = f.path);
                },
                icon: const Icon(Icons.photo_library_rounded),
                label: Text(l10n.editProfilePhoto),
              ),
            ],
          ),
        ),
        Gap.lg,
        TextField(controller: _name, decoration: InputDecoration(labelText: l10n.fieldFullName)),
        Gap.md,
        TextField(controller: _phone, keyboardType: TextInputType.phone, decoration: InputDecoration(labelText: l10n.fieldPhoneOptional)),
        Gap.md,
        TextField(controller: _city, decoration: InputDecoration(labelText: l10n.coachFieldCity)),
        Gap.md,
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _price,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: l10n.coachFieldPrice),
              ),
            ),
            Gap.md,
            Expanded(
              child: TextField(
                controller: _years,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: l10n.coachFieldYears),
              ),
            ),
          ],
        ),
        Gap.md,
        TextField(controller: _bio, maxLines: 4, decoration: InputDecoration(labelText: l10n.fieldBio)),
        Gap.md,
        TextField(controller: _languages, decoration: InputDecoration(labelText: l10n.coachFieldLanguages)),
        Gap.lg,
        Text(l10n.coachFieldSpecialties, style: context.text.titleSmall),
        Gap.sm,
        chips(EnumGroup.trainingSkills, _specialties),
        Gap.lg,
        Text(l10n.coachTrainingTypes, style: context.text.titleSmall),
        Gap.sm,
        chips(EnumGroup.trainingTypes, _types),
        Gap.xxl,
        BlocBuilder<CoachPortalActionCubit, ActionState>(
          builder: (context, state) => FilledButton(
            onPressed: state is ActionInProgress ? null : _save,
            child: state is ActionInProgress ? const ButtonSpinner() : Text(l10n.actionSave),
          ),
        ),
      ],
    );
  }
}

/// A player's training progress as seen by their coach.
class CoachPlayerProgressPage extends StatelessWidget {
  final String playerId;

  const CoachPlayerProgressPage({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => PlayerProgressCubit(sl(), playerId)..load(),
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.trainingProgressTitle)),
        body: BlocBuilder<PlayerProgressCubit, ViewState<TrainingProgressReport>>(
          builder: (context, state) => ViewStateView<TrainingProgressReport>(
            state: state,
            onRetry: () => context.read<PlayerProgressCubit>().load(),
            empty: Center(child: Text(l10n.trainingProgressEmpty, style: context.text.bodySmall)),
            builder: (context, report) => TrainingProgressView(report: report),
          ),
        ),
      ),
    );
  }
}
