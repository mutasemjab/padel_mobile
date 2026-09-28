/// Converts the raw point-count integers the backend sends in `current_game`
/// into tennis-style labels (0/15/30/40). Tiebreaks are scored as raw point
/// counts on the backend, so callers must pass [isTiebreak] to skip mapping.
class PointLabelFormatter {
  const PointLabelFormatter._();

  static const List<String> _labels = ['0', '15', '30', '40'];

  static String format(int rawPoints, {required bool isTiebreak}) {
    if (isTiebreak) return rawPoints.toString();
    if (rawPoints < 0) return _labels.first;
    // Padel is scored with golden point (no advantage), so anything at or
    // beyond index 3 is still just "40" until the game ends.
    if (rawPoints >= _labels.length) return _labels.last;
    return _labels[rawPoints];
  }
}
