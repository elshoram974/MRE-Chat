import 'package:chat/core/status/status.dart';
import 'package:chat/features/auth/domain/entities/user_auth_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepositories {
  Future<({Status status, User data})> loginWithEmail(UserAuthEntity user);
  Future<({Status status, User data})> loginWithGoogle();
  Future<({Status status, User data})> signUp(UserAuthEntity user);
  Future<({Status status, void data})> signOut();
  ({Status status, String data}) getUserUid();
  ({Status status, bool data}) isLoggedIn();
}
