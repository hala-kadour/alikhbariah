import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'exception.dart';
import 'failure.dart';

mixin ErrorHandlingManager {
  Future<Either<Failure, T>> safeCall<T>(Future<T> Function() action) async {
    try {
      // يمكنك إضافة فحص الاتصال بالإنترنت هنا (InternetConnectionChecker)
      final result = await action();
      return Right(result);
    } on PostgrestException catch (e) {
      return Left(ServerFailure(e.message));
    } on AuthException catch (e) {
      return Left(ServerFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure("Something went wrong : ${e.toString()}"));
    }
  }

  Stream<Either<Failure, T>> safeStream<T>(Stream<T> stream) {
    return stream.transform(
      StreamTransformer<T, Either<Failure, T>>.fromHandlers(
        handleData: (data, sink) {
          sink.add(Right(data));
        },
        handleError: (error, stackTrace, sink) {
          final failure = _handleException(error);
          sink.add(Left(failure));
        },
      ),
    );
  }

  Failure _handleException(dynamic e) {
    if (e is PostgrestException) {
      return ServerFailure(e.message);
    } else if (e is AuthException) {
      return ServerFailure(e.message);
    } else {
      return ServerFailure("Something went wrong : ${e.toString()}");
    }
  }
}
