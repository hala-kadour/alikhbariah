import 'package:alikhbariah/features/bookmark/domain/entity/locale_post.dart';
import 'package:alikhbariah/objectbox.g.dart';
import 'package:alikhbariah/translation/translation.dart';

class ObjectBoxService {
  late final Store store;
  late final Box<LocalCollection> collectionBox;
  late final Box<LocalPost> postBox;

  ObjectBoxService._(this.store) {
    collectionBox = store.box<LocalCollection>();
    postBox = store.box<LocalPost>();
    _prepareDefaultCollections();
  }

  // تابع الـ init القياسي
  static Future<ObjectBoxService> init() async {
    final store = await openStore();
    return ObjectBoxService._(store);
  }

  void _prepareDefaultCollections() {
    if (collectionBox.isEmpty()) {
      collectionBox.putMany([
        LocalCollection(name: 'Read Later'.i18n),
        LocalCollection(name: 'Favorite'.i18n),
      ]);
    }
  }
}
