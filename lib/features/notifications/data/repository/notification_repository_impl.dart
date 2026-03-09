import 'package:alikhbariah/core/error/error_handling_manager.dart';
import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/features/notifications/data/datasource/notification_supabase_data_source.dart';
import 'package:alikhbariah/features/notifications/data/models/app_notification_model.dart';
import 'package:alikhbariah/features/notifications/domain/repository/notification_repository.dart';
import 'package:dartz/dartz.dart';

class NotificationRepositoryImpl
    with ErrorHandlingManager
    implements NotificationRepository {
  final NotificationSupabaseDataSource _notificationSupabaseDataSource;

  NotificationRepositoryImpl(this._notificationSupabaseDataSource);
  @override
  Future<Either<Failure, List<AppNotificationModel>>> getNotification() {
    return safeCall(() => _notificationSupabaseDataSource.getNotification());
  }
}
