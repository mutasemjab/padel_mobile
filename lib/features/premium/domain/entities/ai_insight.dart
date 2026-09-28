import 'package:equatable/equatable.dart';

enum AiInsightType {
  playerInsights('player_insights'),
  performanceSummary('performance_summary'),
  partnerRecommendation('partner_recommendation'),
  tournamentRecommendation('tournament_recommendation'),
  coachRecommendation('coach_recommendation'),
  developmentRecommendation('development_recommendation'),
  dailyBrief('daily_brief');

  final String apiValue;

  const AiInsightType(this.apiValue);

  static AiInsightType? fromApi(String? raw) {
    for (final t in values) {
      if (t.apiValue == raw) return t;
    }
    return null;
  }
}

enum AiInsightStatus {
  pending,
  processing,
  completed,
  insufficientData,
  failed;

  static AiInsightStatus fromApi(String? raw) => switch (raw) {
        'processing' => processing,
        'completed' => completed,
        'insufficient_data' => insufficientData,
        'failed' => failed,
        _ => pending,
      };

  bool get isWorking => this == pending || this == processing;
}

enum DataCoverage {
  none,
  low,
  medium,
  high;

  static DataCoverage fromApi(String? raw) =>
      DataCoverage.values.firstWhere((c) => c.name == raw, orElse: () => DataCoverage.none);
}

class AiNarrative extends Equatable {
  final String? headline;
  final String? summary;
  final List<String> highlights;
  final List<String> recommendations;

  const AiNarrative({this.headline, this.summary, this.highlights = const [], this.recommendations = const []});

  @override
  List<Object?> get props => [headline, summary, highlights, recommendations];
}

class InsufficientData extends Equatable {
  final String? reason;
  final Map<String, dynamic>? details;

  const InsufficientData({this.reason, this.details});

  /// Best-effort "have/need" pair from `details` (e.g. `{current: 1, required: 3}`)
  /// so the UI can say "1/3"; null when the backend didn't send numbers.
  (int, int)? get progress {
    final d = details;
    if (d == null) return null;
    int? pick(List<String> keys) {
      for (final k in keys) {
        final v = d[k];
        if (v is num) return v.toInt();
      }
      return null;
    }

    final have = pick(['current', 'have', 'verified_matches', 'matches', 'count']);
    final need = pick(['required', 'target', 'needed', 'min_matches', 'minimum', 'min_required']);
    if (have == null || need == null) return null;
    return (have, need);
  }

  @override
  List<Object?> get props => [reason, details];
}

/// AI output generated only from real data. When [narrative] is null (no AI
/// provider, or the narrative was rejected) the UI renders [facts] as a
/// structured card. [dataCoverage] and [disclaimer] are always shown.
class AiInsight extends Equatable {
  final int id;
  final AiInsightType? type;
  final String rawType;
  final AiInsightStatus status;
  final String? provider;
  final String? model;
  final String? language;
  final AiNarrative? narrative;
  final Map<String, dynamic> facts;
  final InsufficientData? insufficientData;
  final DataCoverage dataCoverage;
  final int? matchesUsed;
  final DateTime? generatedAt;
  final DateTime? expiresAt;
  final String? error;
  final String? disclaimer;

  const AiInsight({
    required this.id,
    this.type,
    required this.rawType,
    required this.status,
    this.provider,
    this.model,
    this.language,
    this.narrative,
    this.facts = const {},
    this.insufficientData,
    this.dataCoverage = DataCoverage.none,
    this.matchesUsed,
    this.generatedAt,
    this.expiresAt,
    this.error,
    this.disclaimer,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        rawType,
        status,
        provider,
        model,
        language,
        narrative,
        facts,
        insufficientData,
        dataCoverage,
        matchesUsed,
        generatedAt,
        expiresAt,
        error,
        disclaimer,
      ];
}

class AiInsightsOverview extends Equatable {
  final List<AiInsightType> types;
  final Map<AiInsightType, AiInsight?> insights;

  const AiInsightsOverview({required this.types, required this.insights});

  @override
  List<Object?> get props => [types, insights];
}

enum ThreeDStatus {
  pending,
  processing,
  completed,
  failed;

  static ThreeDStatus fromApi(String? raw) =>
      ThreeDStatus.values.firstWhere((s) => s.name == raw, orElse: () => ThreeDStatus.pending);

  bool get isWorking => this == pending || this == processing;
}

class ThreeDAsset extends Equatable {
  final int id;
  final ThreeDStatus status;
  final String? provider;
  final String? providerJobId;

  /// `.glb` model URL once completed.
  final String? assetUrl;
  final String? error;
  final DateTime? requestedAt;
  final DateTime? completedAt;

  const ThreeDAsset({
    required this.id,
    required this.status,
    this.provider,
    this.providerJobId,
    this.assetUrl,
    this.error,
    this.requestedAt,
    this.completedAt,
  });

  @override
  List<Object?> get props => [id, status, provider, providerJobId, assetUrl, error, requestedAt, completedAt];
}

class ThreeDProfileState extends Equatable {
  final bool providerConfigured;
  final bool requiresPhoto;
  final ThreeDAsset? current;
  final ThreeDAsset? latestCompleted;

  const ThreeDProfileState({
    required this.providerConfigured,
    required this.requiresPhoto,
    this.current,
    this.latestCompleted,
  });

  @override
  List<Object?> get props => [providerConfigured, requiresPhoto, current, latestCompleted];
}
