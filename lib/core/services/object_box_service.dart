import 'package:alikhbariah/features/bookmark/domain/entity/locale_post.dart';
import 'package:alikhbariah/generated/objectbox.g.dart';
import 'package:alikhbariah/translations/locale_keys.g.dart';

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
        LocalCollection(name: LocaleKeys.news_read_later),
        LocalCollection(name: LocaleKeys.news_favorite),
      ]);
    }
  }
}
