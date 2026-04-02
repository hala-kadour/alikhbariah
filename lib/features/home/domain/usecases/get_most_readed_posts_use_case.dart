import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/use_case.dart';
import 'get_latest_posts_use_case.dart';

class GetMostReadedPostsUseCase
    extends UseCase<Future<Either<Failure, List<PostModel>>>, HomeFilters> {
  final HomeRepository _homeRepository;

  GetMostReadedPostsUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<PostModel>>> call(HomeFilters param) {
    return _homeRepository.getMostReadedPosts(
      categoryId: param.categoryId,
      timeRange: param.timeRange,
    );
  }
}
