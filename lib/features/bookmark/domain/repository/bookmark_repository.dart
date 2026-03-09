import 'package:alikhbariah/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entity/locale_post.dart';

abstract class BookmarkRepository {
  Future<Either<Failure, List<LocalCollection>>> getAllCollections();
  Future<Either<Failure, int>> saveCollection(LocalCollection collection);
  Future<Either<Failure, bool>> deleteCollection(int id);

  Future<Either<Failure, void>> addPostToCollection(
    LocalPost post,
    int collectionId,
  );
  Future<Either<Failure, void>> removePostFromCollection(
    int postId,
    int collectionId,
  );
  Future<Either<Failure, List<LocalPost>>> getPostsByCollection(
    int collectionId,
  );
  Future<Either<Failure, bool>> isPostSaved(String remoteId);
  Future<Either<Failure, LocalPost?>> getPostById(String remoteId);
}
