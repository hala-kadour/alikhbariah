import 'package:alikhbariah/core/usecases/use_case.dart';
import 'package:alikhbariah/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/video/video_category_model.dart';

class GetVideosCategoriesUseCase
    extends UseCase<Future<Either<Failure, List<VideoCategoryModel>>>, String> {
  final HomeRepository _homeRepository;

  GetVideosCategoriesUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<VideoCategoryModel>>> call(String param) {
    return _homeRepository.getVideosCategories(param);
  }
}
