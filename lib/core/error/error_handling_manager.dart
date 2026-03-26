import 'dart:async';
import 'dart:io';

import 'package:alikhbariah/translations/locale_keys.g.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'exception.dart';
import 'failure.dart';

mixin ErrorHandlingManager {
  Future<Either<Failure, T>> safeCall<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Right(result);
    } catch (e) {
      return Left(_handleException(e));
    }
  }

  Either<Failure, T> safeCallLocal<T>(T Function() action) {
    try {
      final result = action();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.toString()));
    } catch (e) {
      return Left(ServerFailure("Local Error: ${e.toString()}"));
    }
  }

  Stream<Either<Failure, T>> safeStream<T>(Stream<T> stream) {
    return stream.transform(
      StreamTransformer<T, Either<Failure, T>>.fromHandlers(
        handleData: (data, sink) => sink.add(Right(data)),
        handleError: (error, stack, sink) =>
            sink.add(Left(_handleException(error))),
      ),
    );
  }

  Failure _handleException(dynamic e) {
    if (e is PostgrestException) {
      return ServerFailure(_mapPostgrestError(e.code));
    } else if (e is AuthException) {
      return ServerFailure(_mapAuthError(e.message));
    } else if (e is SocketException) {
      return ServerFailure(LocaleKeys.errors_network_error.tr());
    } else if (e is TimeoutException) {
      return ServerFailure(LocaleKeys.errors_timeout_error.tr());
    } else if (e is FormatException) {
      return ServerFailure(LocaleKeys.errors_format_error.tr());
    } else if (e is CacheException) {
      return CacheFailure(LocaleKeys.errors_cache_error.tr());
    } else {
      return ServerFailure(LocaleKeys.errors_unknown_error.tr());
    }
  }

  // معالجة أخطاء قاعدة البيانات (Supabase)
  String _mapPostgrestError(String? code) {
    switch (code) {
      case '23505':
        return LocaleKeys.errors_conflict_error.tr(); // بيانات مكررة
      case '42P01':
        return LocaleKeys.errors_database_error.tr(); // الجدول غير موجود
      default:
        return LocaleKeys.errors_server_error.tr();
    }
  }

  // معالجة أخطاء المصادقة (Auth)
  String _mapAuthError(String message) {
    if (message.contains("Invalid login credentials")) {
      return LocaleKeys.errors_invalid_credentials.tr();
    } else if (message.contains("User already registered")) {
      return LocaleKeys.errors_user_exists.tr();
    } else if (message.contains("Email not confirmed")) {
      return LocaleKeys.errors_email_not_confirmed.tr();
    }
    return LocaleKeys.errors_auth_error.tr();
  }
}
