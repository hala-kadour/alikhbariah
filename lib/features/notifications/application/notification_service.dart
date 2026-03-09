import 'dart:developer';
import 'package:alikhbariah/firebase_options.dart';
import 'package:alikhbariah/injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/services/navigation_service.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    try {
      /// 1️⃣ Initialize Awesome
      await AwesomeNotifications().initialize(null, [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic Notifications',
          channelDescription: 'News notifications',
          importance: NotificationImportance.High,
          channelShowBadge: true,
          playSound: true,
        ),
      ], debug: kDebugMode);

      /// طلب السماحيات
      if (!await AwesomeNotifications().isNotificationAllowed()) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }

      await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      /// حفظ التوكن
      _registerDeviceToken();

      _firebaseMessaging.onTokenRefresh.listen(
        (token) => _saveTokenToSupabse(token),
      );

      /// Background handler
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );

      /// Foreground
      FirebaseMessaging.onMessage.listen(_showNotification);

      /// عند الضغط والتطبيق بالخلفية
      FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationClick);

      /// إذا كان التطبيق مسكر
      RemoteMessage? initialMessage = await FirebaseMessaging.instance
          .getInitialMessage();

      if (initialMessage != null) {
        _handleNotificationClick(initialMessage);
      }

      /// الضغط عبر Awesome
      //     AwesomeNotifications().actionStream.listen((event) {
      //       final postId = event.payload?['postId'];

      //       Future.microtask(() {
      //         if (postId != null) {
      //           rootNavigatorKey.currentContext?.go('/post/$postId');
      //         } else {
      //           rootNavigatorKey.currentContext?.go('/notifications');
      //         }
      //       });
      //     });
    } catch (e) {
      log('Notification Init Error: $e');
    }
  }

  /// عرض الإشعار
  void _showNotification(RemoteMessage message) {
    final imageUrl =
        message.notification?.android?.imageUrl ?? message.data['imageUrl'];

    final postId = message.data['postId'];

    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
        channelKey: 'basic_channel',
        title: message.notification?.title,
        body: message.notification?.body,
        notificationLayout: imageUrl != null
            ? NotificationLayout.BigPicture
            : NotificationLayout.Default,
        bigPicture: imageUrl,
        wakeUpScreen: true,
        payload: {'postId': ?postId},
      ),
    );
  }

  /// عند الضغط
  void _handleNotificationClick(RemoteMessage message) {
    final postId = message.data['postId'];

    Future.microtask(() {
      if (postId != null) {
        rootNavigatorKey.currentContext?.go('/post/$postId');
      } else {
        rootNavigatorKey.currentContext?.go('/notifications');
      }
    });
  }

  /// حفظ التوكن
  Future<void> _registerDeviceToken() async {
    final token = await _firebaseMessaging.getToken();
    if (token == null) return;
    await _saveTokenToSupabse(token);
  }

  Future<void> _saveTokenToSupabse(String token) async {
    final client = sl<SupabaseClient>();

    await client.from('devices').upsert({
      'fcm_token': token,
      'platform': 'android',
    }, onConflict: 'fcm_token');
  }
}

/// Background Handler لازم يكون static أو top-level
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final imageUrl =
      message.notification?.android?.imageUrl ?? message.data['imageUrl'];

  final postId = message.data['postId'];

  AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
      channelKey: 'basic_channel',
      title: message.notification?.title,
      body: message.notification?.body,
      notificationLayout: imageUrl != null
          ? NotificationLayout.BigPicture
          : NotificationLayout.Default,
      bigPicture: imageUrl,
      wakeUpScreen: true,
      payload: {'postId': ?postId},
    ),
  );
}
