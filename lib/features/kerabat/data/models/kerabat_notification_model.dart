/// Single notification from GET /kerabat/notifications
class KerabatNotificationModel {
  final int id;
  final int? userId;
  final String title;
  final String message;
  final String? notificationType;
  final String? priority;
  final bool isRead;
  final DateTime? readAt;
  final String? sentVia;
  final DateTime createdAt;

  const KerabatNotificationModel({
    required this.id,
    this.userId,
    required this.title,
    required this.message,
    this.notificationType,
    this.priority,
    this.isRead = false,
    this.readAt,
    this.sentVia,
    required this.createdAt,
  });

  factory KerabatNotificationModel.fromJson(Map<String, dynamic> json) {
    return KerabatNotificationModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      userId: (json['user_id'] as num?)?.toInt(),
      title: json['title'] as String? ?? '',
      message: json['message'] as String? ?? '',
      notificationType: json['notification_type'] as String?,
      priority: json['priority'] as String?,
      isRead: json['is_read'] as bool? ?? false,
      readAt: json['read_at'] != null
          ? DateTime.tryParse(json['read_at'] as String)
          : null,
      sentVia: json['sent_via'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String) ?? DateTime.now()
          : DateTime.now(),
    );
  }
}

/// Response from GET /kerabat/notifications
class KerabatNotificationsResponseModel {
  final List<KerabatNotificationModel> notifications;
  final int total;
  final int unreadCount;

  const KerabatNotificationsResponseModel({
    required this.notifications,
    required this.total,
    required this.unreadCount,
  });

  factory KerabatNotificationsResponseModel.fromJson(Map<String, dynamic> json) {
    final list = json['notifications'];
    return KerabatNotificationsResponseModel(
      notifications: list is List
          ? list
              .map((e) => KerabatNotificationModel.fromJson(
                    Map<String, dynamic>.from(e as Map),
                  ))
              .toList()
          : [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      unreadCount: (json['unread_count'] as num?)?.toInt() ?? 0,
    );
  }
}
