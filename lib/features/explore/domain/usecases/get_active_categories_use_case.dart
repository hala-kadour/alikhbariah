import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/core/usecases/no_param_use_case.dart';
import 'package:alikhbariah/features/explore/data/models/category/category_model.dart';
import 'package:alikhbariah/features/explore/domain/repository/explore_repository.dart';
import 'package:dartz/dartz.dart';

class GetActiveCategoriesUseCase
    extends NoParamUseCase<Future<Either<Failure, List<CategoryModel>>>> {
  final ExploreRepository _exploreRepositry;

  GetActiveCategoriesUseCase(this._exploreRepositry);

  @override
  Future<Either<Failure, List<CategoryModel>>> call() {
    return _exploreRepositry.getActiveCategories();
  }
}
