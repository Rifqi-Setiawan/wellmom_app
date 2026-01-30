import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellmom_app/core/constants/app_colors.dart';
import 'package:wellmom_app/core/utils/date_formatter.dart';
import 'package:wellmom_app/core/widgets/error_snackbar.dart';
import 'package:wellmom_app/features/kerabat/data/models/kerabat_notification_model.dart';
import 'package:wellmom_app/features/kerabat/presentation/providers/kerabat_providers.dart';
import 'package:wellmom_app/features/kerabat/presentation/utils/kerabat_ui_utils.dart';

class KerabatNotificationsScreen extends ConsumerStatefulWidget {
  const KerabatNotificationsScreen({super.key});

  @override
  ConsumerState<KerabatNotificationsScreen> createState() =>
      _KerabatNotificationsScreenState();
}

class _KerabatNotificationsScreenState
    extends ConsumerState<KerabatNotificationsScreen> {
  bool _unreadOnly = false;

  IconData _iconForType(String? type) {
    switch (type) {
      case 'health_alert':
        return Icons.warning_amber_rounded;
      case 'checkup_reminder':
        return Icons.calendar_today_rounded;
      case 'system':
        return Icons.info_outline_rounded;
      default:
        return Icons.notifications_outlined;
    }
  }

  Future<void> _markRead(List<int>? ids) async {
    final repo = ref.read(kerabatRepositoryProvider);
    final result = await repo.markNotificationsRead(notificationIds: ids);
    result.fold(
      (failure) {
        if (mounted) ErrorSnackbar.show(context, failure.message);
      },
      (count) {
        if (mounted) {
          ref.invalidate(kerabatNotificationsProvider(_unreadOnly));
          ref.invalidate(kerabatNotificationsProvider(false));
          ref.invalidate(kerabatDashboardProvider);
          ErrorSnackbar.showSuccess(
            context,
            count > 0 ? '$count notifikasi ditandai dibaca' : 'Done',
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final notificationsAsync =
        ref.watch(kerabatNotificationsProvider(_unreadOnly));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              ChoiceChip(
                label: const Text('Semua'),
                selected: !_unreadOnly,
                onSelected: (v) =>
                    setState(() => _unreadOnly = false),
                selectedColor: AppColors.primaryBlue.withOpacity(0.3),
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text('Belum dibaca'),
                selected: _unreadOnly,
                onSelected: (v) => setState(() => _unreadOnly = true),
                selectedColor: AppColors.primaryBlue.withOpacity(0.3),
              ),
            ],
          ),
        ),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(kerabatNotificationsProvider(_unreadOnly));
              ref.invalidate(kerabatDashboardProvider);
            },
            child: notificationsAsync.when(
              data: (data) {
                if (data.notifications.isEmpty) {
                  return ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      const SizedBox(height: 48),
                      Center(
                        child: Column(
                          children: [
                            Icon(Icons.notifications_none,
                                size: 56, color: Colors.grey.shade400),
                            const SizedBox(height: 12),
                            Text(
                              _unreadOnly
                                  ? 'Tidak ada notifikasi belum dibaca'
                                  : 'Belum ada notifikasi',
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  itemCount: data.notifications.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton.icon(
                            onPressed: data.unreadCount > 0
                                ? () => _markRead(null)
                                : null,
                            icon: const Icon(Icons.done_all, size: 18),
                            label: const Text('Tandai Semua Dibaca'),
                          ),
                        ),
                      );
                    }
                    final notif = data.notifications[index - 1];
                    return _NotificationTile(
                      notification: notif,
                      onTap: () {
                        if (!notif.isRead) {
                          _markRead([notif.id]);
                        }
                      },
                      iconForType: _iconForType(notif.notificationType),
                      priorityColor: KerabatRiskColors.getNotificationPriorityColor(
                        notif.priority,
                      ),
                    );
                  },
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline,
                        size: 48, color: Colors.grey.shade600),
                    const SizedBox(height: 12),
                    Text(
                      'Gagal memuat notifikasi',
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () => ref
                          .invalidate(kerabatNotificationsProvider(_unreadOnly)),
                      child: const Text('Coba lagi'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.notification,
    required this.onTap,
    required this.iconForType,
    required this.priorityColor,
  });

  final KerabatNotificationModel notification;
  final VoidCallback onTap;
  final IconData iconForType;
  final Color priorityColor;

  @override
  Widget build(BuildContext context) {
    final isUrgent = notification.priority == 'urgent' ||
        notification.priority == 'high';

    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isUrgent
            ? BorderSide(color: priorityColor.withOpacity(0.5), width: 1)
            : BorderSide.none,
      ),
      color: notification.isRead
          ? Colors.white
          : priorityColor.withOpacity(0.06),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                iconForType,
                size: 24,
                color: priorityColor,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notification.title,
                      style: TextStyle(
                        fontWeight:
                            notification.isRead
                                ? FontWeight.w500
                                : FontWeight.w700,
                        color: AppColors.textDark,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.message,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      DateFormatter.formatRelativeTime(notification.createdAt),
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
