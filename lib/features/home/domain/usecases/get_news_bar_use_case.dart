import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/core/usecases/no_param_use_case.dart';
import 'package:alikhbariah/features/home/data/models/breaking-news/breaking_news_model.dart';
import 'package:alikhbariah/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetNewsBarUseCase
    extends NoParamUseCase<Stream<Either<Failure, List<BreakingNewsModel>>>> {
  final HomeRepository _homeRepository;

  GetNewsBarUseCase(this._homeRepository);

  @override
  Stream<Either<Failure, List<BreakingNewsModel>>> call() {
    return _homeRepository.getNewsBar();
  }
}
