import 'package:alikhbariah/core/usecases/use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/locale_post.dart';

class GetCollectionPostsUseCase
    extends UseCase<Either<Failure, List<LocalPost>>, int> {
  final BookmarkRepository _bookmarkRepository;

  GetCollectionPostsUseCase(this._bookmarkRepository);

  @override
  Either<Failure, List<LocalPost>> call(int param) {
    return _bookmarkRepository.getPostsByCollection(param);
  }
}
