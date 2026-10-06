import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../constants/api_endpoints.dart';
import '../localization/locale_controller.dart';
import '../network/api_envelope.dart';

class EnumOption {
  final String value;
  final String label;

  const EnumOption(this.value, this.label);
}

/// What a point ending type demands, from `meta/enums.point_ending_types[]`:
/// the fields that must be sent, whose player it names (`winning`, `losing`
/// or null for a team-level ending) and the allowed values per field.
class PointEndingRule {
  final List<String> requires;
  final String? playerTeam;
  final Map<String, List<String>> options;

  const PointEndingRule({this.requires = const [], this.playerTeam, this.options = const {}});

  bool requiresField(String field) => requires.contains(field);

  /// Allowed values for [field]; empty = no restriction known.
  List<String> allowed(String field) => options[field] ?? const [];
}

/// Enum groups exposed by `GET meta/enums`.
class EnumGroup {
  const EnumGroup._();

  static const playerLevels = 'player_levels';
  static const playerSides = 'player_sides';
  static const genders = 'genders';
  static const tournamentStatuses = 'tournament_statuses';
  static const tournamentFormats = 'tournament_formats';
  static const certificationStatuses = 'certification_statuses';
  static const categoryGenders = 'category_genders';
  static const matchRounds = 'match_rounds';
  static const matchStatuses = 'match_statuses';
  static const resultTypes = 'result_types';
  static const verificationStatuses = 'verification_statuses';
  static const registrationStatuses = 'registration_statuses';
  static const paymentStatuses = 'payment_statuses';
  static const pointEndingTypes = 'point_ending_types';
  static const shotTypes = 'shot_types';
  static const errorTypes = 'error_types';
  static const serveOutcomes = 'serve_outcomes';
  static const casualMatchTypes = 'casual_match_types';
  static const casualMatchStatuses = 'casual_match_statuses';
  static const achievementCategories = 'achievement_categories';
  static const achievementRarities = 'achievement_rarities';
  static const bookingStatuses = 'booking_statuses';
  static const trainingSkills = 'training_skills';
  static const trainingTypes = 'training_types';
  static const aiInsightTypes = 'ai_insight_types';
  static const paymentTransactionStatuses = 'payment_transaction_statuses';
  static const seasons = 'seasons';
}

/// Single source of truth for every enum label and picker in the app, loaded
/// from `GET meta/enums` in the request language and reloaded when the
/// language changes. Screens never hardcode enum strings — when a value is
/// missing (offline first launch) it falls back to a humanized form of the
/// raw value.
class EnumsService extends ChangeNotifier {
  final Dio dio;

  EnumsService(this.dio) {
    LocaleController.instance.languageCode.addListener(load);
  }

  Map<String, List<EnumOption>> _groups = const {};
  Map<String, PointEndingRule> _endingRules = const {};
  bool _loading = false;

  bool get isLoaded => _groups.isNotEmpty;

  Future<void> load() async {
    if (_loading) return;
    _loading = true;
    try {
      final response = await dio.get(ApiEndpoints.metaEnums);
      final data = ApiEnvelope.map(response);
      final parsed = <String, List<EnumOption>>{};
      final rules = <String, PointEndingRule>{};
      final endings = data[EnumGroup.pointEndingTypes];
      if (endings is List) {
        for (final item in endings) {
          if (item is! Map || item['value'] == null) continue;
          final options = <String, List<String>>{};
          final rawOptions = item['options'];
          if (rawOptions is Map) {
            rawOptions.forEach((k, v) {
              if (v is List) options[k.toString()] = [for (final o in v) o.toString()];
            });
          }
          rules[item['value'].toString()] = PointEndingRule(
            requires: [for (final r in (item['requires'] as List? ?? const [])) r.toString()],
            playerTeam: item['player_team']?.toString(),
            options: options,
          );
        }
      }
      data.forEach((group, raw) {
        if (raw is List) {
          parsed[group] = [
            for (final item in raw)
              if (item is Map && item['value'] != null)
                EnumOption(item['value'].toString(), (item['label'] ?? item['value']).toString()),
          ];
        }
      });
      _groups = parsed;
      _endingRules = rules;
      notifyListeners();
    } catch (e) {
      // Labels degrade to humanized raw values; nothing else depends on this.
      if (kDebugMode) debugPrint('EnumsService.load failed: $e');
    } finally {
      _loading = false;
    }
  }

  List<EnumOption> options(String group) => _groups[group] ?? const [];

  /// Rule for a point ending type, or null when `meta/enums` has not loaded.
  PointEndingRule? endingRule(String endingType) => _endingRules[endingType];

  String label(String group, String? value) {
    if (value == null || value.isEmpty) return '';
    for (final option in options(group)) {
      if (option.value == value) return option.label;
    }
    return humanize(value);
  }

  static String humanize(String raw) {
    final words = raw.replaceAll(RegExp(r'[_\-]+'), ' ').trim();
    if (words.isEmpty) return raw;
    return words[0].toUpperCase() + words.substring(1);
  }

  @override
  void dispose() {
    LocaleController.instance.languageCode.removeListener(load);
    super.dispose();
  }
}
