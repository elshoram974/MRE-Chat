import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_auth_entity.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<User> loginWithEmail(UserAuthEntity user);
  Future<User> signUp(UserAuthEntity user);
  Future<User> loginWithGoogle();
  Future<void> signOut();
  User getCurrentUser();
  String getUserUid();
  bool isLoggedIn();
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  final FirebaseAuth auth;

  const AuthRemoteDataSourceImp(this.auth);

  @override
  Future<void> signOut() async=> await auth.signOut();
  

  @override
  String getUserUid() => auth.currentUser!.uid;

  @override
  User getCurrentUser() => auth.currentUser!;

  @override
  bool isLoggedIn() => auth.currentUser != null;

  @override
  Future<User> loginWithEmail(UserAuthEntity user) async {
    final UserCredential credential = await auth.signInWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
    return credential.user!;
  }

  @override
  Future<User> loginWithGoogle() async {
    final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

    final UserCredential credential = await auth.signInWithProvider(googleAuthProvider);
    return credential.user!;
  }

  @override
  Future<User> signUp(UserAuthEntity user) async {
    final UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
    return credential.user!;
  }
}
