import '../services/object_box_service.dart';

Future<ObjectBoxService> initDb() async {
  return await ObjectBoxService.init();
}
