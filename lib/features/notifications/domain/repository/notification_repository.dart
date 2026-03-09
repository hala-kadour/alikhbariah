import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/features/notifications/data/models/app_notification_model.dart';
import 'package:dartz/dartz.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<AppNotificationModel>>> getNotification();
}
