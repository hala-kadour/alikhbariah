import 'package:alikhbariah/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entity/locale_post.dart';

abstract class BookmarkRepository {
  Either<Failure, List<LocalCollection>> getAllCollections();
  Either<Failure, int> saveCollection(LocalCollection collection);
  Either<Failure, bool> deleteCollection(int id);

  Future<Either<Failure, void>> addPostToCollection(
    LocalPost post,
    int collectionId,
  );
  Either<Failure, void> removePostFromCollection(int postId, int collectionId);
  Either<Failure, List<LocalPost>> getPostsByCollection(int collectionId);
  Either<Failure, bool> isPostSaved(String remoteId);
  Either<Failure, LocalPost?> getPostById(String remoteId);
}
