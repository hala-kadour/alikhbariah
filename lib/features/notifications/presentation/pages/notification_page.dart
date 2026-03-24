import 'package:alikhbariah/features/notifications/presentation/providers/notification_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/layout/navbar/main_back_app_bar.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainBackAppBar(title: LocaleKeys.notifications.tr()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Consumer(
          builder: (context, ref, child) {
            var notificationList = ref.watch(allNotificationProvider);
            return notificationList.when(
              data: (data) => Text("Data"),
              error: (error, stackTrace) => Text("Error : $error"),
              loading: () => Text("Loading"),
            );
          },
        ),
      ),
    );
  }
}
