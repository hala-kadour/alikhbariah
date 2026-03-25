import 'package:alikhbariah/config/theme/app_colors.dart';
import 'package:alikhbariah/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/router/app_route_config.dart';
import '../../../../config/theme/app_icons.dart';
import '../../../../features/notifications/presentation/providers/notification_provider.dart';

class NotificationButton extends ConsumerWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(allNotificationProvider);
    final notificationCount = notificationsAsync.maybeWhen(
      data: (notifications) => notifications.length,
      orElse: () => 0,
    );

    return Stack(
      children: [
        IconButton(
          onPressed: () => context.pushNamed(AppRouteConfig.notifications),
          icon: Icon(AppIcons.notificationLight, size: 20.0),
        ),
        if (notificationCount > 0)
          Positioned.directional(
            start: 8,
            top: 0,
            textDirection: TextDirection.rtl,
            child: Container(
              alignment: .center,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: AppColors.red600,
                shape: .circle,
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                notificationCount > 9 ? '+9' : notificationCount.toString(),
                style: AppTextStyles.labelSmall(color: AppColors.white),
              ),
            ),
          ),
      ],
    );
  }
}
