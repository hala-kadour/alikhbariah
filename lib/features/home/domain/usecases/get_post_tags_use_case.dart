import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/core/usecases/use_case.dart';
import 'package:alikhbariah/features/home/data/models/tag/tag_model.dart';
import 'package:alikhbariah/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetPostTagsUseCase
    extends UseCase<Future<Either<Failure, List<TagModel>>>, String?> {
  final HomeRepository _homeRepository;

  GetPostTagsUseCase(this._homeRepository);

  @override
  Future<Either<Failure, List<TagModel>>> call(String? param) {
    return _homeRepository.getTagsByPostId(param);
  }
}
