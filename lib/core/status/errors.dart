import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromFirebaseException(FirebaseException exception) {
    if (exception is FirebaseAuthException) {
      return ServerFailure.fromFirebaseAuthException(exception);
    }

    return ServerFailure(S.current.unknownError);
  }
  factory ServerFailure.fromFirebaseAuthException(FirebaseAuthException e) {
    String code = e.code;
    switch (code) {
      case 'weak-password':
        return ServerFailure(S.current.weakPassword);
      case 'email-already-in-use':
        return ServerFailure(S.current.emailAlreadyInUse);
      case 'invalid-email':
        return ServerFailure(S.current.invalidEmail);
      case 'user-not-found':
        return ServerFailure(S.current.userNotFound);
      case 'wrong-password':
        return ServerFailure(S.current.wrongPassword);
      case 'user-disabled' || 'ERROR_USER_DISABLED':
        return ServerFailure(S.current.userDisabled);
      default:
    }
    return ServerFailure(
        'Authentication error: \ncode:$code\nmessage:${e.message}');
  }
}
