import 'package:chat/core/utils/constants/string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/user_auth_entity.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<User> loginWithEmail(UserAuthEntity user);
  Future<User> loginWithGoogle();
  Future<User> signUp(UserAuthEntity user);
  Future<void> signOut();
  String getUserUid();
  bool isLoggedIn();
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  final FirebaseAuth auth;

  const AuthRemoteDataSourceImp(this.auth);

  @override
  Future<void> signOut() async {
    await auth.signOut();
    await _clearUserIfExist();
  }

  @override
  String getUserUid() => auth.currentUser!.uid;

  @override
  bool isLoggedIn() => auth.currentUser != null;

  @override
  Future<User> loginWithEmail(UserAuthEntity user) async {
    final UserCredential credential = await auth.signInWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
    final User userCredential = credential.user!;
    _saveUser(UserModel.fromUserCredential(userCredential));
    return userCredential;
  }

  @override
  Future<User> loginWithGoogle() async {
    final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

    final UserCredential credential =
        await auth.signInWithProvider(googleAuthProvider);
    final User userCredential = credential.user!;
    _saveUser(UserModel.fromUserCredential(userCredential));
    return userCredential;
  }

  @override
  Future<User> signUp(UserAuthEntity user) async {
    final UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: user.email!,
      password: user.password!,
    );
    final User userCredential = credential.user!;
    _saveUser(UserModel.fromUserCredential(userCredential));
    return userCredential;
  }

  Future<Box<UserModel>> _clearUserIfExist() async {
    Box<UserModel> box = Hive.box<UserModel>(AppString.userHive);
    if (box.isNotEmpty) await box.clear();
    return box;
  }

  Future<bool> _saveUser(UserModel user) async {
    Box<UserModel> box = await _clearUserIfExist();
    final int i = await box.add(user);
    return i != 0;
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
