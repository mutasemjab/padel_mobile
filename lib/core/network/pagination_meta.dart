import 'package:equatable/equatable.dart';

/// Mirrors the `pagination` key the backend attaches to paginated list envelopes.
class PaginationMeta extends Equatable {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;

  const PaginationMeta({required this.currentPage, required this.lastPage, required this.perPage, required this.total});

  bool get hasMore => currentPage < lastPage;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 15,
      total: (json['total'] as num?)?.toInt() ?? 0,
    );
  }

  @override
  List<Object?> get props => [currentPage, lastPage, perPage, total];
}

/// A single decoded page: the items plus the pagination cursor state, and the
/// envelope's optional `meta` (e.g. `unread_count`, the rankings `type`).
class Paginated<T> {
  final List<T> items;
  final PaginationMeta meta;
  final Map<String, dynamic>? extra;

  const Paginated({required this.items, required this.meta, this.extra});

  Paginated<R> map<R>(R Function(T) convert) => Paginated(items: items.map(convert).toList(), meta: meta, extra: extra);
}
