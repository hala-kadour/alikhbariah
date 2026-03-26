import 'package:alikhbariah/core/widgets/animation/empty_status_animation.dart';
import 'package:alikhbariah/features/notifications/data/models/app_notification_model.dart';
import 'package:alikhbariah/features/notifications/presentation/providers/notification_provider.dart';
import 'package:alikhbariah/features/notifications/presentation/widgets/notification_card.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/layout/navbar/main_back_app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBackAppBar(title: LocaleKeys.navbar_notifications.tr()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer(
          builder: (context, ref, child) {
            var notificationList = ref.watch(allNotificationProvider);
            return notificationList.when(
              data: (data) {
                if (data.isEmpty) {
                  return EmptyStatusAnimation(
                    title: LocaleKeys.empty_no_notifications.tr(),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.only(bottom: 16, top: 12),
                  itemCount: data.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 4),
                  itemBuilder: (context, index) {
                    final AppNotificationModel notification = data[index];
                    return NotificationCard(notification: notification);
                  },
                );
              },
              error: (error, stackTrace) =>
                  Center(child: Text("Error: $error")),
              loading: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}
