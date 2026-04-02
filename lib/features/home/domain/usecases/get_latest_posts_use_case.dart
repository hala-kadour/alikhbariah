import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecases/use_case.dart';

class GetLatestPostsUseCase
    extends UseCase<Future<Either<Failure, List<PostModel>>>, HomeFilters> {
  final HomeRepository _homeRepository;

  GetLatestPostsUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<PostModel>>> call(HomeFilters param) {
    return _homeRepository.getLatestPosts(
      categoryId: param.categoryId,
      timeRange: param.timeRange,
    );
  }
}

class HomeFilters {
  String? categoryId;
  String? timeRange;
  HomeFilters({this.categoryId, this.timeRange});
}
