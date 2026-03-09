import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/core/usecases/no_param_use_case.dart';
import 'package:alikhbariah/features/explore/domain/repository/explore_repository.dart';
import 'package:alikhbariah/features/home/data/models/tag/tag_model.dart';
import 'package:dartz/dartz.dart';

class GetPopularTagsUseCase
    extends NoParamUseCase<Future<Either<Failure, List<TagModel>>>> {
  final ExploreRepository _exploreRepositry;

  GetPopularTagsUseCase(this._exploreRepositry);

  @override
  Future<Either<Failure, List<TagModel>>> call() {
    return _exploreRepositry.getPopularTags();
  }
}
