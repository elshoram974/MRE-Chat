import 'package:chat/core/status/status.dart';
import 'package:chat/core/usecase/usecase_with_parameter.dart';
import 'package:chat/features/auth/domain/entities/user_auth_entity.dart';
import 'package:chat/features/auth/domain/repositories/auth_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpUseCase extends UseCase<User?, UserAuthEntity> {
  final AuthRepositories repo;

  const SignUpUseCase(this.repo);

  @override
  Future<({Status status, User? data})> call(UserAuthEntity parameter) async {
    return await repo.signUp(parameter);
  }
}
