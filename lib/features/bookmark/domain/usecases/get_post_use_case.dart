import 'package:alikhbariah/core/usecases/use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/locale_post.dart';

class GetPostUseCase extends UseCase<Either<Failure, LocalPost?>, String> {
  final BookmarkRepository _bookmarkRepository;

  GetPostUseCase(this._bookmarkRepository);

  @override
  Either<Failure, LocalPost?> call(String param) {
    return _bookmarkRepository.getPostById(param);
  }
}
