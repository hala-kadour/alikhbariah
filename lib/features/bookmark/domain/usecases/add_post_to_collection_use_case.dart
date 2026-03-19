import 'package:alikhbariah/core/usecases/use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/locale_post.dart';

class AddPostToCollectionUseCase
    extends UseCase<Future<Either<Failure, void>>, AddPostToCollectionParam> {
  final BookmarkRepository _bookmarkRepository;

  AddPostToCollectionUseCase(this._bookmarkRepository);

  @override
  Future<Either<Failure, void>> call(AddPostToCollectionParam param) {
    return _bookmarkRepository.addPostToCollection(
      param.post,
      param.collectionId,
    );
  }
}

class AddPostToCollectionParam {
  AddPostToCollectionParam({required this.post, required this.collectionId});
  LocalPost post;
  int collectionId;
}
