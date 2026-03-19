import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../repository/bookmark_repository.dart';

class DeleteCollectionUseCase extends UseCase<Either<Failure, bool>, int> {
  final BookmarkRepository _bookmarkRepository;

  DeleteCollectionUseCase(this._bookmarkRepository);

  @override
  Either<Failure, bool> call(int params) {
    return _bookmarkRepository.deleteCollection(params);
  }
}
