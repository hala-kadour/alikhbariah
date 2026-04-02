import 'package:dartz/dartz.dart';

import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/features/home/data/models/post/post_model.dart';
import 'package:alikhbariah/features/home/domain/repository/home_repository.dart';

import '../../../../core/usecases/use_case.dart';

class GetFeaturedPostsUseCase
    extends UseCase<Stream<Either<Failure, List<PostModel>>>, String?> {
  final HomeRepository _homeRepository;

  GetFeaturedPostsUseCase(this._homeRepository);

  @override
  Stream<Either<Failure, List<PostModel>>> call(String? param) {
    return _homeRepository.getFeaturedPosts(categoryId: param);
  }
}

