import 'package:flutter/services.dart';

/// Jordanian mobile formatting from `login.html`: digits only, one leading
/// `0` dropped, max 9 digits, grouped `7X XXX XXXX`.
class JoPhoneFormatter extends TextInputFormatter {
  static final _valid = RegExp(r'^7[789]\d{7}$');

  /// The 9 national digits of a (possibly formatted) value.
  static String digits(String text) {
    var d = text.replaceAll(RegExp(r'\D'), '');
    // Autofill / paste of an international number (+962 7X…).
    if (d.length > 9 && d.startsWith('962')) d = d.substring(3);
    d = d.replaceFirst(RegExp(r'^0'), '');
    return d.length > 9 ? d.substring(0, 9) : d;
  }

  static bool isValid(String digits) => _valid.hasMatch(digits);

  static String format(String digits) => [
    if (digits.isNotEmpty) digits.substring(0, digits.length.clamp(0, 2)),
    if (digits.length > 2) digits.substring(2, digits.length.clamp(2, 5)),
    if (digits.length > 5) digits.substring(5),
  ].join(' ');

  /// E.164 for the API: `+9627XXXXXXXX`.
  static String e164(String digits) => '+962$digits';

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = format(digits(newValue.text));
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
