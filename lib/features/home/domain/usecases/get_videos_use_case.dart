import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../../data/models/video/video_model.dart';
import '../repository/home_repository.dart';

class GetVideosUseCase
    extends UseCase<Future<Either<Failure, List<VideoModel>>>, String> {
  final HomeRepository _homeRepository;

  GetVideosUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<VideoModel>>> call(String param) {
    return _homeRepository.getVideos(param);
  }
}
