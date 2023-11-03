import 'dart:developer';
import 'dart:io';

import 'package:chat/core/status/errors.dart';
import 'package:chat/core/status/status.dart';
import 'package:chat/core/status/success.dart';
import 'package:chat/core/utils/config/locale/generated/l10n.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_auth_entity.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../datasources/auth_local_datasources.dart';
import '../datasources/auth_remote_datasources.dart';
import '../models/user_model.dart';

class AuthRepositoriesImp extends AuthRepositories {
  const AuthRepositoriesImp({
    required this.authLocalDataSource,
    required this.authRemoteDataSource,
  });

  final AuthLocalDataSource authLocalDataSource;
  final AuthRemoteDataSource authRemoteDataSource;

  @override
  ({String data, Status status}) getUserUid() {
    if (isLoggedIn().data) {
      try {
        final String uid = authRemoteDataSource.getUserUid();
        return (data: uid, status: Success<String>(data: uid));
      } catch (e) {
        final String uid = authLocalDataSource.getUserUid();
        return (data: uid, status: Success<String>(data: uid));
      }
    }

    return (data: '', status: ServerFailure(S.current.noUserLoggedToGetUid));
  }

  @override
  ({bool data, Status status}) isLoggedIn() {
    late bool isLoggedIn;
    try {
      isLoggedIn = authRemoteDataSource.isLoggedIn();
    } catch (e) {
      isLoggedIn = authLocalDataSource.isLoggedIn();
    }
    return (data: isLoggedIn, status: Success<bool>(data: isLoggedIn));
  }

  @override
  Future<({User? data, Status status})> loginWithEmail(
      UserAuthEntity user) async {
    try {
      final User u = await authRemoteDataSource.loginWithEmail(user);
      return (data: u, status: Success<User>(data: u));
    } on FirebaseAuthException catch (e) {
      final ServerFailure fail = ServerFailure.fromFirebaseAuthException(e);
      log(fail.message);
    } on SocketException catch (e) {
      log('SocketException: ${e.message}');
      return (data: null, status: UnknownFailure(e.message));
    } catch (e) {
      print(e);
    }
    return (data: null, status: UnknownFailure(S.current.unknownError));
  }

  @override
  Future<({User? data, Status status})> loginWithGoogle() async {
    try {
      final User u = await authRemoteDataSource.loginWithGoogle();
      return (data: u, status: Success<User>(data: u));
    } on FirebaseAuthException catch (e) {
      final ServerFailure fail = ServerFailure.fromFirebaseAuthException(e);
      log(fail.message);
    } on SocketException catch (e) {
      log('SocketException: ${e.message}');
      return (data: null, status: UnknownFailure(e.message));
    } catch (e) {
      print(e);
    }
    return (data: null, status: UnknownFailure(S.current.unknownError));
  }

  @override
  Future<({void data, Status status})> signOut() async {
    try {
      return (
        data: await authRemoteDataSource.signOut(),
        status: const Success()
      );
    } on FirebaseAuthException catch (e) {
      final ServerFailure fail = ServerFailure.fromFirebaseAuthException(e);
      log(fail.message);
    } on SocketException catch (e) {
      log('SocketException: ${e.message}');
      return (data: null, status: UnknownFailure(e.message));
    } catch (e) {
      print(e);
    }
    return (data: null, status: UnknownFailure(S.current.unknownError));
  }

  @override
  Future<({User? data, Status status})> signUp(UserAuthEntity user) async {
    try {
      final User u = await authRemoteDataSource.signUp(user);
      return (data: u, status: Success<User>(data: u));
    } on FirebaseAuthException catch (e) {
      final ServerFailure fail = ServerFailure.fromFirebaseAuthException(e);
      log(fail.message);
    } on SocketException catch (e) {
      log('SocketException: ${e.message}');
      return (data: null, status: UnknownFailure(e.message));
    } catch (e) {
      print(e);
    }
    return (data: null, status: UnknownFailure(S.current.unknownError));
  }

  @override
  ({UserModel? data, Status status}) getCurrentUser() {
    try {
      final User u = authRemoteDataSource.getCurrentUser();
      final user = UserModel.fromUserCredential(u);
      return (data: user, status: Success<UserModel>(data: user));
    } on FirebaseAuthException catch (e) {
      final ServerFailure fail = ServerFailure.fromFirebaseAuthException(e);
      log(fail.message);

      try {
        final UserModel cacheU = authLocalDataSource.getUser()!;
        return (data: cacheU, status: Success<UserModel>(data: cacheU));
      } catch (e) {
        log(e.toString());
        return (data: null, status: CacheFailure(e.toString()));
      }
    } on SocketException catch (e) {
      log('SocketException: ${e.message}');
      return (data: null, status: UnknownFailure(e.message));
    } catch (e) {
      print(e);
    }
    return (data: null, status: UnknownFailure(S.current.unknownError));
  }
}
