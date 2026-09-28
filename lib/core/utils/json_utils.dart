/// Lenient readers for hand-parsed payloads (open-shaped maps such as
/// `facts`, `breakdown`, home-feed sections). Freezed models use
/// json_serializable; these cover the dynamic parts it can't type.
class Json {
  const Json._();

  static Map<String, dynamic>? map(dynamic value) => value is Map ? value.cast<String, dynamic>() : null;

  static List<Map<String, dynamic>> listOfMaps(dynamic value) =>
      value is List ? value.whereType<Map>().map((e) => e.cast<String, dynamic>()).toList() : const [];

  static List<String> strings(dynamic value) => value is List ? value.map((e) => e.toString()).toList() : const [];

  static int? integer(dynamic value) => switch (value) {
    int v => v,
    num v => v.toInt(),
    String v => int.tryParse(v) ?? double.tryParse(v)?.toInt(),
    _ => null,
  };

  static num? number(dynamic value) => switch (value) {
    num v => v,
    String v => num.tryParse(v),
    _ => null,
  };

  static double? decimal(dynamic value) => number(value)?.toDouble();

  static String? string(dynamic value) => value?.toString();

  static bool boolean(dynamic value, {bool fallback = false}) => switch (value) {
    bool v => v,
    num v => v != 0,
    String v => v == '1' || v.toLowerCase() == 'true',
    _ => fallback,
  };

  static DateTime? date(dynamic value) => value is String && value.isNotEmpty ? DateTime.tryParse(value) : null;

  static Map<String, int> intMap(dynamic value) {
    final m = map(value);
    if (m == null) return const {};
    return {
      for (final e in m.entries)
        if (integer(e.value) != null) e.key: integer(e.value)!,
    };
  }
}
