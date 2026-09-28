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
}
