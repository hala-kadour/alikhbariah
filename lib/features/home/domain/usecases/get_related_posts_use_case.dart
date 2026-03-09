import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/core/usecases/use_case.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetRelatedPostsUseCase
    extends UseCase<Future<Either<Failure, List<PostModel>>>, String?> {
  final HomeRepository _homeRepository;

  GetRelatedPostsUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<PostModel>>> call(String? param) {
    return _homeRepository.getRelatedPostsByPostId(param);
  }
}
