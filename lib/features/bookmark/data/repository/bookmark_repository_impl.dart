import 'package:alikhbariah/core/error/error_handling_manager.dart';
import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/features/bookmark/data/datasource/bookmark_locale_data_source.dart';
import 'package:alikhbariah/features/bookmark/domain/entity/locale_post.dart';
import 'package:alikhbariah/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:dartz/dartz.dart';

class BookmarkRepositoryImpl
    with ErrorHandlingManager
    implements BookmarkRepository {
  final BookmarkLocaleDataSource _bookmarkLocaleDataSource;

  BookmarkRepositoryImpl(this._bookmarkLocaleDataSource);

  @override
  Future<Either<Failure, void>> addPostToCollection(
    LocalPost post,
    int collectionId,
  ) {
    return safeCall(
      () => _bookmarkLocaleDataSource.addPostToCollection(post, collectionId),
    );
  }

  @override
  Future<Either<Failure, bool>> deleteCollection(int id) {
    return safeCall(() => _bookmarkLocaleDataSource.deleteCollection(id));
  }

  @override
  Future<Either<Failure, List<LocalCollection>>> getAllCollections() {
    return safeCall(() => _bookmarkLocaleDataSource.getAllCollections());
  }

  @override
  Future<Either<Failure, LocalPost?>> getPostById(String remoteId) {
    return safeCall(() => _bookmarkLocaleDataSource.getPostById(remoteId));
  }

  @override
  Future<Either<Failure, List<LocalPost>>> getPostsByCollection(
    int collectionId,
  ) {
    return safeCall(
      () => _bookmarkLocaleDataSource.getPostsByCollection(collectionId),
    );
  }

  @override
  Future<Either<Failure, bool>> isPostSaved(String remoteId) {
    return safeCall(() => _bookmarkLocaleDataSource.isPostSaved(remoteId));
  }

  @override
  Future<Either<Failure, void>> removePostFromCollection(
    int postId,
    int collectionId,
  ) {
    return safeCall(
      () => _bookmarkLocaleDataSource.removePostFromCollection(
        postId,
        collectionId,
      ),
    );
  }

  @override
  Future<Either<Failure, int>> saveCollection(LocalCollection collection) {
    return safeCall(() => _bookmarkLocaleDataSource.saveCollection(collection));
  }
}
