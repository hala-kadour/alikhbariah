import 'package:alikhbariah/features/bookmark/data/repository/bookmark_repository.dart';
import '../../../../core/services/object_box_service.dart';
import '../../../../objectbox.g.dart';
import '../../domain/models/locale_post.dart';

class BookmarkLocalDataSource implements BookmarkRepository {
  final ObjectBoxService _service;

  BookmarkLocalDataSource(this._service);

  // جلب كل المجموعات مع تحديث تلقائي للبيانات
  @override
  List<LocalCollection> getAllCollections() {
    return _service.collectionBox.getAll();
  }

  // إضافة أو تعديل اسم كولكشن (ObjectBox يستخدم نفس التابع للتعديل إذا مررتِ الـ ID)
  @override
  int saveCollection(LocalCollection collection) {
    return _service.collectionBox.put(collection);
  }

  @override
  bool deleteCollection(int id) {
    return _service.collectionBox.remove(id);
  }

  @override
  Future<void> addPostToCollection(LocalPost post, int collectionId) async {
    final collection = _service.collectionBox.get(collectionId);
    if (collection != null) {
      // التحقق إذا كان البوست موجود مسبقاً في قاعدة البيانات لتجنب التكرار
      final query = _service.postBox
          .query(LocalPost_.remoteId.equals(post.remoteId))
          .build();
      final existingPost = query.findFirst();
      query.close();

      final postToSave = existingPost ?? post;

      collection.posts.add(postToSave);
      _service.collectionBox.put(collection); // يحفظ العلاقة والبوست معاً
    }
  }

  @override
  void removePostFromCollection(int postId, int collectionId) {
    final collection = _service.collectionBox.get(collectionId);
    if (collection != null) {
      collection.posts.removeWhere((p) => p.id == postId);
      _service.collectionBox.put(collection);

      // اختياري: إذا أردتِ حذف البوست نهائياً من الجهاز إذا لم يعد ينتمي لأي كولكشن
      _cleanupOrphanedPost(postId);
    }
  }

  void _cleanupOrphanedPost(int postId) {
    final post = _service.postBox.get(postId);
    if (post != null && post.collections.isEmpty) {
      _service.postBox.remove(postId);
    }
  }

  @override
  List<LocalPost> getPostsByCollection(int collectionId) {
    final collection = _service.collectionBox.get(collectionId);
    return collection?.posts.toList() ?? [];
  }

  @override
  bool isPostSaved(String remoteId) {
    final query = _service.postBox
        .query(LocalPost_.remoteId.equals(remoteId))
        .build();
    final exists = query.count() > 0;
    query.close();
    return exists;
  }

  @override
  LocalPost? getPostById(String remoteId) {
    final query = _service.postBox
        .query(LocalPost_.remoteId.equals(remoteId))
        .build();
    final post = query.findFirst();
    query.close();
    return post;
  }
}
