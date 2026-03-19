import '../../../../core/services/object_box_service.dart';
import '../../../../objectbox.g.dart';
import '../../domain/entity/locale_post.dart';

abstract class BookmarkLocaleDataSource {
  List<LocalCollection> getAllCollections();
  int saveCollection(LocalCollection collection);
  bool deleteCollection(int id);

  Future<void> addPostToCollection(LocalPost post, int collectionId);
  void removePostFromCollection(int postId, int collectionId);
  List<LocalPost> getPostsByCollection(int collectionId);
  bool isPostSaved(String remoteId);
  LocalPost? getPostById(String remoteId);
}

class BookmarkLocaleDataSourceImpl implements BookmarkLocaleDataSource {
  final ObjectBoxService _service;

  BookmarkLocaleDataSourceImpl(this._service);

  @override
  List<LocalCollection> getAllCollections() {
    return _service.collectionBox.getAll();
  }

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
      final query = _service.postBox
          .query(LocalPost_.remoteId.equals(post.remoteId))
          .build();
      final existingPost = query.findFirst();
      query.close();

      final postToSave = existingPost ?? post;

      collection.posts.add(postToSave);
      _service.collectionBox.put(collection);
    }
  }

  @override
  void removePostFromCollection(int postId, int collectionId) {
    final collection = _service.collectionBox.get(collectionId);
    if (collection != null) {
      collection.posts.removeWhere((p) => p.id == postId);
      _service.collectionBox.put(collection);
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
