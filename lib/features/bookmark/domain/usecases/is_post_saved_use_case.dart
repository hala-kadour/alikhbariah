import 'package:alikhbariah/core/usecases/use_case.dart';
import 'package:alikhbariah/features/bookmark/domain/repository/bookmark_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

class IsPostSavedUseCase extends UseCase<Either<Failure, bool>, String> {
  final BookmarkRepository _bookmarkRepository;

  IsPostSavedUseCase(this._bookmarkRepository);

  @override
  Either<Failure, bool> call(String param) {
    return _bookmarkRepository.isPostSaved(param);
  }
}
