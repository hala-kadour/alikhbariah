import 'dart:developer';
import 'package:alikhbariah/core/services/supabase_service.dart';
import 'package:alikhbariah/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    try {
      // 1. Initialize Awesome Notifications
      await AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelKey: 'basic_channel',
            channelName: 'Basic Notifications',
            channelDescription: 'Notification channel for basic tests',
            importance: NotificationImportance.High,
            channelShowBadge: true,
            playSound: true,
          ),
        ],
        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group',
          ),
        ],
        debug: kDebugMode,
      );
      bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        _requestPermission();
      }

      // 2. Request Permission for Firebase Notifications
      // NotificationSettings settings = await _firebaseMessaging
      //     .requestPermission(
      //       alert: true,
      //       announcement: false,
      //       badge: true,
      //       carPlay: false,
      //       criticalAlert: false,
      //       provisional: false,
      //       sound: true,
      //     );

      await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      log('User granted permission');
      // Subscribe to 'all' topic
      await _firebaseMessaging.subscribeToTopic('all');
      // Save Token
      _registerDeviceToken();
      // Listen to token refresh
      _firebaseMessaging.onTokenRefresh.listen(
        (newToken) => _saveTokenToSupabse(newToken),
      );
      // Background Message Handler
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );
      // Foreground Message Handler
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        log('Got a message whilst in the foreground!');
        log('Message data : ${message.data}');

        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;

        if (notification != null && android != null) {
          AwesomeNotifications().createNotification(
            content: NotificationContent(
              id: notification.hashCode,
              channelKey: 'basic_channel',
              title: notification.title,
              body: notification.body,
              notificationLayout: NotificationLayout.Default,
            ),
          );
        } else {
          log('User declined or has not accepted premission');
        }
      });
    } catch (e) {
      log('Error initialzing NotificationService : $e');
    }
  }

  Future<void> _requestPermission() async {
    await _firebaseMessaging.requestPermission();
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  Future<void> _registerDeviceToken() async {
    final token = await _firebaseMessaging.getToken();
    if (token == null) return;

    await _saveTokenToSupabse(token);
  }

  Future<void> _saveTokenToSupabse(String token) async {
    final client = SupabaseService.client;
    try {
      await client.from('devices').upsert({
        'fcm_token': token,
        'platform': 'android',
      }, onConflict: 'fcm_token');
      log('تم حفظ التوكن بنجاح بدون تكرار');
    } catch (e) {
      log('خطأ في الحفظ: $e');
    }
  }

  Future<void> sendNotification({
    required String title,
    required String body,
  }) async {
    final client = SupabaseService.client;
    try {
      final response = await client.functions.invoke(
        'send-push',
        body: {'title': title, 'body': body},
      );
      if (response.status == 200) {
      } else {
        throw Exception(response.data);
      }
    } catch (e) {
      throw Exception('Failed to send notification : $e');
    }
  }

  // @pragma('vm:entry-point')
  // Future<void> _firebaseMessagingBackgroundHandler(
  //   RemoteMessage message,
  // ) async {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  //   log('Handling a background message : ${message.messageId}');
  // }

  @pragma('vm:entry-point')
  Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    if (message.notification != null) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: message.notification.hashCode,
          channelKey: 'basic_channel',
          title: message.notification?.title,
          body: message.notification?.body,
          notificationLayout: NotificationLayout.Default,
          wakeUpScreen: true,
        ),
      );
    }
  }
}
