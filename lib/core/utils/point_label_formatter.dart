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

  /// One side's label from both raw counts. With deuce, 40-40 and every tie
  /// after it is [deuceText] and one point ahead is [advantageText] (the
  /// trailing side stays 40). Without deuce (golden point) it never goes past 40.
  static String label(
    int mine,
    int theirs, {
    required bool isTiebreak,
    bool deuce = true,
    required String deuceText,
    required String advantageText,
  }) {
    if (isTiebreak) return mine.toString();
    if (!deuce || mine < 3 || theirs < 3) return format(mine, isTiebreak: false);
    if (mine == theirs) return deuceText;
    return mine > theirs ? advantageText : _labels.last;
  }

  /// The game situation worth announcing, or null: Deuce, Advantage, or the
  /// golden point (40-40 without deuce).
  static String? situation(
    int teamOne,
    int teamTwo, {
    required bool isTiebreak,
    bool deuce = true,
    required String deuceText,
    required String advantageText,
    required String goldenPointText,
  }) {
    if (isTiebreak || teamOne < 3 || teamTwo < 3) return null;
    if (!deuce) return teamOne == 3 && teamTwo == 3 ? goldenPointText : null;
    return teamOne == teamTwo ? deuceText : advantageText;
  }
}
