import 'package:alikhbariah/features/notifications/data/models/app_notification_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class NotificationSupabaseDataSource {
  Future<List<AppNotificationModel>> getNotification();
}

class NotificationSupabaseDataSourceImpl
    implements NotificationSupabaseDataSource {
  final SupabaseClient _client;
  NotificationSupabaseDataSourceImpl(this._client);
  final _table = 'notifications';

  @override
  Future<List<AppNotificationModel>> getNotification() async {
    try {
      final now = DateTime.now();
      final startOfDay = DateTime(
        now.year,
        now.month,
        now.day,
      ).toIso8601String();

      final response = await _client
          .from(_table)
          .select()
          .gte('created_at', startOfDay)
          .order('created_at', ascending: false);

      return response
          .map<AppNotificationModel>((e) => AppNotificationModel.fromJson(e))
          .toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
