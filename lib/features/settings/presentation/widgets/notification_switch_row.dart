import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';
import '../providers/notifications_enabled_provider.dart';
import 'setting_row_item.dart'; // الـ Widget اللي عملناه سابقاً

class NotificationSwitchRow extends ConsumerWidget {
  const NotificationSwitchRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // نراقب الحالة هنا فقط
    final isEnabled = ref.watch(notificationsEnabledProvider);

    return SettingRowItem(
      icon: Icons.notifications_none,
      title: LocaleKeys.navbar_notifications.tr(),
      trailing: Switch.adaptive(
        value: isEnabled,
        onChanged: (value) {
          ref
              .read(notificationsEnabledProvider.notifier)
              .toggleNotifications(value);
        },
      ),
    );
  }
}
