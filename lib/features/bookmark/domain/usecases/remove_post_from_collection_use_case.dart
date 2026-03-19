import 'package:alikhbariah/core/usecases/use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class RemovePostFromCollectionUseCase
    extends UseCase<Either<Failure, void>, RemovePostFormCollectioParam> {
  final BookmarkRepository _bookmarkRepository;

  RemovePostFromCollectionUseCase(this._bookmarkRepository);

  @override
  Either<Failure, void> call(RemovePostFormCollectioParam param) {
    return _bookmarkRepository.removePostFromCollection(
      param.postId,
      param.collectionId,
    );
  }
}

class RemovePostFormCollectioParam {
  RemovePostFormCollectioParam({
    required this.postId,
    required this.collectionId,
  });
  int postId;
  int collectionId;
}
