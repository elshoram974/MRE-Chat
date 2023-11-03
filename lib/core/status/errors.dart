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
      default:
    }
    return ServerFailure(
        'Authentication error: \ncode:$code\nmessage:${e.message}');
  }
}
