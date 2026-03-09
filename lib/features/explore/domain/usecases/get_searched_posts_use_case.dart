import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/core/usecases/use_case.dart';
import 'package:alikhbariah/features/explore/domain/repository/explore_repository.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:dartz/dartz.dart';

class GetSearchedPostsUseCase
    extends UseCase<Future<Either<Failure, List<PostModel>>>, String?> {
  final ExploreRepository _exploreRepositry;

  GetSearchedPostsUseCase(this._exploreRepositry);

  @override
  Future<Either<Failure, List<PostModel>>> call(String? param) {
    return _exploreRepositry.getSearchedPosts(param);
  }
}
