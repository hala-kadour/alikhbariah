import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/no_param_use_case.dart';
import '../entity/locale_post.dart';
import '../repository/bookmark_repository.dart';

class GetAllCollectionsUseCase
    extends NoParamUseCase<Either<Failure, List<LocalCollection>>> {
  final BookmarkRepository _bookmarkRepository;

  GetAllCollectionsUseCase(this._bookmarkRepository);
  @override
  Either<Failure, List<LocalCollection>> call() {
    return _bookmarkRepository.getAllCollections();
  }
}
