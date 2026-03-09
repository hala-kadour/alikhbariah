import '../../../../core/services/object_box_service.dart';
import '../../../../objectbox.g.dart';
import '../../domain/entity/locale_post.dart';

abstract class BookmarkLocaleDataSource {
  Future<List<LocalCollection>> getAllCollections();
  Future<int> saveCollection(LocalCollection collection);
  Future<bool> deleteCollection(int id);

  Future<void> addPostToCollection(LocalPost post, int collectionId);
  Future<void> removePostFromCollection(int postId, int collectionId);
  Future<List<LocalPost>> getPostsByCollection(int collectionId);
  Future<bool> isPostSaved(String remoteId);
  Future<LocalPost?> getPostById(String remoteId);
}

class BookmarkLocaleDataSourceImpl implements BookmarkLocaleDataSource {
  final ObjectBoxService _service;

  BookmarkLocaleDataSourceImpl(this._service);

  @override
  Future<List<LocalCollection>> getAllCollections() async {
    return _service.collectionBox.getAll();
  }

  @override
  Future<int> saveCollection(LocalCollection collection) async {
    return _service.collectionBox.put(collection);
  }

  @override
  Future<bool> deleteCollection(int id) async {
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
  Future<void> removePostFromCollection(int postId, int collectionId) async {
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
  Future<List<LocalPost>> getPostsByCollection(int collectionId) async {
    final collection = _service.collectionBox.get(collectionId);
    return collection?.posts.toList() ?? [];
  }

  @override
  Future<bool> isPostSaved(String remoteId) async {
    final query = _service.postBox
        .query(LocalPost_.remoteId.equals(remoteId))
        .build();
    final exists = query.count() > 0;
    query.close();
    return exists;
  }

  @override
  Future<LocalPost?> getPostById(String remoteId) async {
    final query = _service.postBox
        .query(LocalPost_.remoteId.equals(remoteId))
        .build();
    final post = query.findFirst();
    query.close();
    return post;
  }
}
