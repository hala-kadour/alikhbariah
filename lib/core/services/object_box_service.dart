import 'package:alikhbariah/features/bookmark/domain/entity/locale_post.dart';
import 'package:alikhbariah/objectbox.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:alikhbariah/generated/locale_keys.g.dart';

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
        LocalCollection(name: LocaleKeys.read_later.tr()),
        LocalCollection(name: LocaleKeys.favorite.tr()),
      ]);
    }
  }
}
