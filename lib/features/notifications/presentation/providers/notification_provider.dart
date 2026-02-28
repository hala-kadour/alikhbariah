import 'dart:async';
import 'dart:ui';

import 'package:alikhbariah/features/notifications/application/notification_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationServiceProvider = Provider<NotificationService>(
  (ref) => NotificationService(),
);

// final edgeFunctionProvider = FutureProvider.family<bool, Map<String, dynamic>>((
//   ref,
//   params,
// ) async {
//   await ref
//       .read(notificationServiceProvider)
//       .sendNotification(title: params['title'], body: params['body']);
//   return true;
// });

final notificationProvider = AsyncNotifierProvider<NotificationNotifier, bool?>(
  NotificationNotifier.new,
);

class NotificationNotifier extends AsyncNotifier<bool?> {
  late final NotificationService _notificationService;
  @override
  FutureOr<bool?> build() {
    _notificationService = ref.read(notificationServiceProvider);
    return null;
  }

  Future<void> sentNotification({
    required String title,
    required String body,
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    try {
      state = AsyncLoading();
      await _notificationService.sendNotification(title: title, body: body);
      onSuccess();
      state = const AsyncValue.data(true);
    } catch (e) {
      onError(e.toString());
    }
  }
}
