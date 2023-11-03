import 'package:chat/core/status/status.dart';
import 'package:chat/core/usecase/usecase_with_parameter.dart';
import 'package:chat/features/auth/domain/repositories/auth_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/user_auth_entity.dart';

class LoginWithEmailUseCase extends UseCase<User, UserAuthEntity> {
  final AuthRepositories repo;

  const LoginWithEmailUseCase(this.repo);

  @override
  Future<({Status status, User data})> call(UserAuthEntity parameter) async {
    return await repo.loginWithEmail(parameter);
  }
}
