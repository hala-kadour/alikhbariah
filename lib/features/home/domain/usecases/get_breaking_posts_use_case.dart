import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/use_case.dart';

class GetBreakingPostsUseCase
    extends UseCase<Stream<Either<Failure, List<PostModel>>>, String?> {
  final HomeRepository _homeRepository;

  GetBreakingPostsUseCase(this._homeRepository);

  @override
  Stream<Either<Failure, List<PostModel>>> call(String? param) {
    return _homeRepository.getBreakingPosts(categoryId: param);
  }
}
