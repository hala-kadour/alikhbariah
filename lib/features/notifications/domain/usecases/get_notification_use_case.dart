import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/core/usecases/no_param_use_case.dart';
import 'package:alikhbariah/features/notifications/data/models/app_notification_model.dart';
import 'package:alikhbariah/features/notifications/domain/repository/notification_repository.dart';
import 'package:dartz/dartz.dart';

class GetNotificationUseCase
    extends
        NoParamUseCase<Future<Either<Failure, List<AppNotificationModel>>>> {
  final NotificationRepository _notificationRepository;

  GetNotificationUseCase(this._notificationRepository);

  @override
  Future<Either<Failure, List<AppNotificationModel>>> call() {
    return _notificationRepository.getNotification();
  }
}
