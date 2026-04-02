import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/core/usecases/use_case.dart';
import 'package:alikhbariah/features/explore/domain/repository/explore_repository.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:dartz/dartz.dart';

class GetSearchedPostsUseCase
    extends UseCase<Future<Either<Failure, List<PostModel>>>, SearchFilters> {
  final ExploreRepository _exploreRepositry;

  GetSearchedPostsUseCase(this._exploreRepositry);

  @override
  Future<Either<Failure, List<PostModel>>> call(SearchFilters param) {
    return _exploreRepositry.getSearchedPosts(
      searchQuery: param.searchQuery,
      timeRange: param.timeRange,
      categoryId: param.categoryId,
      isUrgent: param.isUrgent,
      isFeatured: param.isFeatured,
    );
  }
}

class SearchFilters {
  final String? searchQuery;
  final String? timeRange;
  final String? categoryId;
  final bool? isUrgent;
  final bool? isFeatured;

  SearchFilters({
    this.searchQuery,
    this.timeRange,
    this.categoryId,
    this.isUrgent,
    this.isFeatured,
  });
}
