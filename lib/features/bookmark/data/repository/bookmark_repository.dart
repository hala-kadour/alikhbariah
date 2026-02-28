import '../../domain/models/locale_post.dart';

abstract class BookmarkRepository {
  // عمليات الكولكشن
  List<LocalCollection> getAllCollections();
  int saveCollection(LocalCollection collection);
  bool deleteCollection(int id);

  // عمليات البوستات داخل الكولكشن
  Future<void> addPostToCollection(LocalPost post, int collectionId);
  void removePostFromCollection(int postId, int collectionId);
  List<LocalPost> getPostsByCollection(int collectionId);
  bool isPostSaved(String remoteId);
  LocalPost? getPostById(String remoteId);
}
