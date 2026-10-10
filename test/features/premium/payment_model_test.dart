import 'package:flutter_test/flutter_test.dart';
import 'package:padel/features/premium/data/models/premium_models.dart';

void main() {
  test('a payment parses whether client_data is null, an object or an empty list', () {
    Map<String, dynamic> json(Object? clientData) => {
          'reference': 'PAY-1',
          'type': 'premium_subscription',
          'amount': 10.0,
          'currency': 'JOD',
          'status': 'requires_action',
          'checkout_url': 'https://secure-jordan.paytabs.com/payment/page/X',
          'client_data': clientData,
          'created_at': '2026-10-10T15:19:08+03:00',
        };

    expect(paymentFromJson(json(null)).checkoutUrl, 'https://secure-jordan.paytabs.com/payment/page/X');
    expect(paymentFromJson(json(<dynamic>[])).clientData, isNull);
    expect(paymentFromJson(json({'session': 'abc'})).clientData, {'session': 'abc'});
  });
}
