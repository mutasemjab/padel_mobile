/// Explicit state the backend attaches to optional blocks (home sections,
/// partner cards, recommendations). The UI renders a dedicated state for each
/// instead of inventing values.
enum SectionState {
  ok,
  empty,
  notSet,
  insufficientData,
  premiumRequired;

  static SectionState fromApi(String? raw) => switch (raw) {
    'ok' => SectionState.ok,
    'not_set' => SectionState.notSet,
    'insufficient_data' => SectionState.insufficientData,
    'premium_required' => SectionState.premiumRequired,
    _ => SectionState.empty,
  };

  bool get isOk => this == SectionState.ok;
}
