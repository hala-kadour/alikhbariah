import 'package:alikhbariah/core/error/failure.dart';
import 'package:alikhbariah/core/usecases/no_param_use_case.dart';
import 'package:alikhbariah/features/home/domain/repository/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetLiveStreamUrlUseCase
    extends NoParamUseCase<Future<Either<Failure, String?>>> {
  final HomeRepository _homeRepository;

  GetLiveStreamUrlUseCase(this._homeRepository);

  @override
  Future<Either<Failure, String?>> call() {
    return _homeRepository.getLiveStreamUrl();
  }
}
