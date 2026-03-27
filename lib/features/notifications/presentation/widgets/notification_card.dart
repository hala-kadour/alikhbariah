import 'package:alikhbariah/config/scales/gap.dart';
import 'package:alikhbariah/core/helper/time_formatter.dart';
import 'package:alikhbariah/features/notifications/data/models/app_notification_model.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_colors.dart';
import '../../../../config/theme/app_text_styles.dart';

class NotificationCard extends StatelessWidget {
  final AppNotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  String get _formattedDate {
    if (notification.createdAt == null) return '';
    return TimeFormatter.timeAgo(notification.createdAt!);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: theme.inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).dividerColor,
            blurRadius: 0.5,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 62,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.colorScheme.primary.withValues(alpha: 0.12),
            ),
            child:
                notification.imageUrl != null &&
                    notification.imageUrl!.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadiusGeometry.directional(
                      topEnd: Radius.circular(16.0),
                      bottomStart: Radius.circular(16.0),
                    ),
                    child: Image.network(
                      notification.imageUrl!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.notifications),
                    ),
                  )
                : const Icon(Icons.notifications, size: 30),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      notification.title,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (_formattedDate.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        _formattedDate,
                        style: AppTextStyles.labelSmall(
                          color: AppColors.info400,
                        ),
                      ),
                    ],
                  ],
                ),
                Gap.h8,
                Text(notification.body, style: theme.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
