import 'package:dio/dio.dart';

import '../error/failure.dart';
import 'pagination_meta.dart';

/// Reads the success envelope `{status, message, data, pagination?, meta?}`
/// so data sources don't each re-implement the unwrapping.
class ApiEnvelope {
  const ApiEnvelope._();

  static Map<String, dynamic> _root(Response response) => (response.data as Map).cast<String, dynamic>();

  static dynamic data(Response response) => _root(response)['data'];

  static Map<String, dynamic> map(Response response) => (data(response) as Map).cast<String, dynamic>();

  static List<Map<String, dynamic>> list(Response response) =>
      ((data(response) as List?) ?? const []).map((e) => (e as Map).cast<String, dynamic>()).toList();

  static List<T> listOf<T>(Response response, T Function(Map<String, dynamic>) parse) =>
      list(response).map(parse).toList();

  static Map<String, dynamic>? meta(Response response) => (_root(response)['meta'] as Map?)?.cast<String, dynamic>();

  /// `code` on a successful response (e.g. `INSUFFICIENT_DATA`).
  static String? code(Response response) => _root(response)['code'] as String?;

  static bool isInsufficientData(Response response) => code(response) == ApiErrorCodes.insufficientData;

  static Paginated<T> paginated<T>(Response response, T Function(Map<String, dynamic>) parse) {
    final items = listOf(response, parse);
    final rawMeta = _root(response)['pagination'];
    final meta = rawMeta is Map
        ? PaginationMeta.fromJson(rawMeta.cast<String, dynamic>())
        : PaginationMeta(currentPage: 1, lastPage: 1, perPage: items.length, total: items.length);
    return Paginated(items: items, meta: meta, extra: ApiEnvelope.meta(response));
  }
}
