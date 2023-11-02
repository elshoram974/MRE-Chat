import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:dio/dio.dart';

import 'status.dart';

abstract class Failure extends Status {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.badResponse:
        return ServerFailure.fromBadResponse(error.response!);

      case DioExceptionType.cancel:
        return ServerFailure(S.current.cancel);

      case DioExceptionType.badCertificate:
        return ServerFailure(S.current.serverHasBadCertificate);

      case DioExceptionType.connectionTimeout:
        return ServerFailure(S.current.yourConnectionTimeout);

      case DioExceptionType.connectionError:
        return ServerFailure(S.current.yourConnectionError);

      case DioExceptionType.receiveTimeout:
        return ServerFailure(S.current.receiveTimeout);

      case DioExceptionType.sendTimeout:
        return ServerFailure(S.current.sendTimeout);

      default:
        return ServerFailure(S.current.unknownError);
    }
  }
  factory ServerFailure.fromBadResponse(Response response) {
    int? statusCode = response.statusCode;
    if (statusCode == 404) {
      return ServerFailure(S.current.requestWasNotFound);
    } else if (statusCode == 500) {
      return ServerFailure(S.current.problemWithServer);
    }
    return ServerFailure(S.current.unknownResponseError);
  }
}
