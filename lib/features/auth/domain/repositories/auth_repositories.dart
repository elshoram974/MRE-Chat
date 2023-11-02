import 'package:chat/core/status/status.dart';

abstract class AuthRepositories {
  Future<({Status status, void data})> loginWithEmail();
  Future<({Status status, void data})> loginWithGoogle();
  Future<({Status status, void data})> signUp();
  Future<({Status status, void data})> getUserUid();
}
