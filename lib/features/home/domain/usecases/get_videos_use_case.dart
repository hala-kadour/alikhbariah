// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/use_case.dart';
import '../../data/models/video/video_model.dart';
import '../repository/home_repository.dart';

class GetVideosUseCase
    extends
        UseCase<Future<Either<Failure, List<VideoModel>>>, VideoSearchParam> {
  final HomeRepository _homeRepository;

  GetVideosUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<VideoModel>>> call(VideoSearchParam param) {
    return _homeRepository.getVideos(param.categoryId, param.searchQuery);
  }
}

class VideoSearchParam {
  String categoryId;
  String? searchQuery;
  VideoSearchParam({required this.categoryId, this.searchQuery});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VideoSearchParam &&
          runtimeType == other.runtimeType &&
          categoryId == other.categoryId &&
          searchQuery == other.searchQuery;

  @override
  int get hashCode => categoryId.hashCode ^ searchQuery.hashCode;
}
