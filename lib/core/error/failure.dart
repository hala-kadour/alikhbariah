import 'package:alikhbariah/translation/translation.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('Checkout your internet connection'.i18n);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class UnknownFailure extends Failure {
  UnknownFailure() : super('Something went wrong'.i18n);
}
