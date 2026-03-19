import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../entity/locale_post.dart';
import '../repository/bookmark_repository.dart';

class SaveCollectionUseCase
    extends UseCase<Either<Failure, int>, LocalCollection> {
  final BookmarkRepository _bookmarkRepository;

  SaveCollectionUseCase(this._bookmarkRepository);

  @override
  Either<Failure, int> call(LocalCollection params) {
    return _bookmarkRepository.saveCollection(params);
  }
}
