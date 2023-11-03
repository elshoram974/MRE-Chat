import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_auth_entity.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<User?> loginWithEmail(UserAuthEntity user);
  Future<User?> loginWithGoogle();
  Future<User?> signUp(UserAuthEntity user);
  Future<void> signOut();
  String getUserUid();
  bool isLoggedIn();
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  final FirebaseAuth auth;

  const AuthRemoteDataSourceImp(this.auth);

  @override
  Future<void> signOut() => auth.signOut();

  @override
  String getUserUid() => auth.currentUser!.uid;

  @override
  bool isLoggedIn() => auth.currentUser != null;

  @override
  Future<User?> loginWithEmail(UserAuthEntity user) async {
    final UserCredential credential = await auth.signInWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
    return credential.user;
  }

  @override
  Future<User?> loginWithGoogle() async {
    final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

    final UserCredential credential =
        await auth.signInWithProvider(googleAuthProvider);
    return credential.user;
  }

  @override
  Future<User?> signUp(UserAuthEntity user) async {
    final UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
    return credential.user;
  }

  // @override
  // Future<User?> signUp(UserAuthEntity user) async {
  //   User? newUser;
  //   try {
  //     final UserCredential credential =
  //         await auth.createUserWithEmailAndPassword(
  //       email: user.email!,
  //       password: user.password!,
  //     );
  //     newUser = credential.user;
  //   } on FirebaseAuthException catch (e) {
  //     final ServerFailure fail = ServerFailure.fromFirebaseAuthException(e);
  //     log(fail.message);
  //   } on SocketException catch (e) {
  //     log('SocketException: ${e.message}');
  //   } catch (e) {
  //     print(e);
  //   }
  //   return newUser;
  // }
}
