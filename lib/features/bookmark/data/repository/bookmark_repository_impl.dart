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
  Either<Failure, bool> deleteCollection(int id) {
    return safeCallLocal(() => _bookmarkLocaleDataSource.deleteCollection(id));
  }

  @override
  Either<Failure, List<LocalCollection>> getAllCollections() {
    return safeCallLocal(() => _bookmarkLocaleDataSource.getAllCollections());
  }

  @override
  Either<Failure, LocalPost?> getPostById(String remoteId) {
    return safeCallLocal(() => _bookmarkLocaleDataSource.getPostById(remoteId));
  }

  @override
  Either<Failure, List<LocalPost>> getPostsByCollection(int collectionId) {
    return safeCallLocal(
      () => _bookmarkLocaleDataSource.getPostsByCollection(collectionId),
    );
  }

  @override
  Either<Failure, bool> isPostSaved(String remoteId) {
    return safeCallLocal(() => _bookmarkLocaleDataSource.isPostSaved(remoteId));
  }

  @override
  Either<Failure, void> removePostFromCollection(int postId, int collectionId) {
    return safeCallLocal(
      () => _bookmarkLocaleDataSource.removePostFromCollection(
        postId,
        collectionId,
      ),
    );
  }

  @override
  Either<Failure, int> saveCollection(LocalCollection collection) {
    return safeCallLocal(
      () => _bookmarkLocaleDataSource.saveCollection(collection),
    );
  }
}
