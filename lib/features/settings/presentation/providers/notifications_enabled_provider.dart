import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final notificationsEnabledProvider =
    StateNotifierProvider<NotificationsNotifier, bool>((ref) {
      return NotificationsNotifier();
    });

class NotificationsNotifier extends StateNotifier<bool> {
  NotificationsNotifier() : super(true) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();

    bool isEnabledInApp = prefs.getBool('notifications_enabled') ?? true;

    state = isAllowed && isEnabledInApp;
  }

  Future<void> toggleNotifications(bool value) async {
    if (value) {
      // إذا أراد التفعيل، نتحقق أولاً من إذن النظام
      bool isAllowed = await AwesomeNotifications().isNotificationAllowed();

      if (!isAllowed) {
        // 🚨 نفتح له إعدادات إشعارات التطبيق في الهاتف مباشرة
        await AwesomeNotifications().requestPermissionToSendNotifications();

        // نتحقق مرة أخرى بعد الطلب
        isAllowed = await AwesomeNotifications().isNotificationAllowed();
        if (!isAllowed) {
          state = false; // إذا رفض مرة أخرى، نرجع السويتش للـ off
          return;
        }
      }
    }

    // إذا وصلنا هنا، يعني إما أنه يريد الإغلاق (false) أو أنه سمح بالتفعيل (true)
    state = value;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notifications_enabled', value);
  }
}
