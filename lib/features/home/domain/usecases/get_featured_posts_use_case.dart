import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/core/usecases/no_param_use_case.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetFeaturedPostsUseCase
    extends NoParamUseCase<Stream<Either<Failure, List<PostModel>>>> {
  final HomeRepository _homeRepository;

  GetFeaturedPostsUseCase(this._homeRepository);

  @override
  Stream<Either<Failure, List<PostModel>>> call() {
    return _homeRepository.getFeaturedPosts();
  }
}
