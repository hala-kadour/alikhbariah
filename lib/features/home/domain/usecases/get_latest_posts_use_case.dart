import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/core/usecases/no_param_use_case.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetLatestPostsUseCase
    extends NoParamUseCase<Future<Either<Failure, List<PostModel>>>> {
  final HomeRepository _homeRepository;

  GetLatestPostsUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<PostModel>>> call() {
    return _homeRepository.getLatestPosts();
  }
}
