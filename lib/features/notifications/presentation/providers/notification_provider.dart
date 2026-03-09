import 'package:alikhbariah/features/notifications/data/models/app_notification_model.dart';
import 'package:alikhbariah/features/notifications/domain/usecases/get_notification_use_case.dart';
import 'package:alikhbariah/injection_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getNotificationsUC = Provider((ref) => sl<GetNotificationUseCase>());

final allNotificationProvider = FutureProvider<List<AppNotificationModel>>((
  ref,
) async {
  final useCase = ref.watch(getNotificationsUC);
  final result = await useCase.call();

  return result.fold(
    (failure) => throw failure.message,
    (categoris) => categoris,
  );
});
