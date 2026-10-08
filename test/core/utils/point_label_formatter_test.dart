import 'package:flutter_test/flutter_test.dart';
import 'package:padel/core/utils/point_label_formatter.dart';

void main() {
  group('PointLabelFormatter', () {
    test('maps 0-3 to tennis-style labels when not a tiebreak', () {
      expect(PointLabelFormatter.format(0, isTiebreak: false), '0');
      expect(PointLabelFormatter.format(1, isTiebreak: false), '15');
      expect(PointLabelFormatter.format(2, isTiebreak: false), '30');
      expect(PointLabelFormatter.format(3, isTiebreak: false), '40');
    });

    test('clamps points beyond 3 to "40" (golden point, no advantage)', () {
      expect(PointLabelFormatter.format(4, isTiebreak: false), '40');
      expect(PointLabelFormatter.format(10, isTiebreak: false), '40');
    });

    test('shows the raw point count during a tiebreak instead of mapping it', () {
      expect(PointLabelFormatter.format(0, isTiebreak: true), '0');
      expect(PointLabelFormatter.format(7, isTiebreak: true), '7');
      expect(PointLabelFormatter.format(12, isTiebreak: true), '12');
    });

    test('never crashes on a negative value', () {
      expect(PointLabelFormatter.format(-1, isTiebreak: false), '0');
    });
  });

  group('PointLabelFormatter.label', () {
    String label(int a, int b, {bool deuce = true}) =>
        PointLabelFormatter.label(a, b, isTiebreak: false, deuce: deuce, deuceText: 'Deuce', advantageText: 'Advantage');

    test('40-40 is Deuce, one point ahead is Advantage', () {
      expect(label(3, 3), 'Deuce');
      expect(label(4, 3), 'Advantage');
      expect(label(3, 4), '40');
      expect(label(5, 5), 'Deuce');
      expect(label(2, 3), '30');
    });

    test('golden point never goes past 40', () {
      expect(label(3, 3, deuce: false), '40');
      expect(PointLabelFormatter.situation(3, 3,
          isTiebreak: false, deuce: false, deuceText: 'D', advantageText: 'A', goldenPointText: 'G'), 'G');
    });

    test('tiebreak shows raw numbers', () {
      expect(PointLabelFormatter.label(5, 4, isTiebreak: true, deuceText: 'D', advantageText: 'A'), '5');
    });
  });
}
