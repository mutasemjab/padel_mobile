import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/notification_item.dart';

part 'notification_item_model.freezed.dart';
part 'notification_item_model.g.dart';

@freezed
abstract class NotificationItemModel with _$NotificationItemModel {
  const factory NotificationItemModel({
    required String id,
    String? type,
    @Default(<String, dynamic>{}) Map<String, dynamic> data,
    @JsonKey(name: 'read_at') DateTime? readAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _NotificationItemModel;

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemModelFromJson(json);
}

extension NotificationItemModelX on NotificationItemModel {
  // `data.type` is the short type code; the top-level `type` is the Laravel
  // notification class, so the former wins.
  NotificationItem toEntity() => NotificationItem(
        id: id,
        type: NotificationTypeX.fromApi((data['type'] ?? type)?.toString()),
        data: data,
        readAt: readAt,
        createdAt: createdAt,
      );
}

NotificationItem notificationFromJson(Map<String, dynamic> json) =>
    NotificationItemModel.fromJson(json).toEntity();
