import 'package:chat/core/status/status.dart';
import 'package:chat/core/usecase/usecase_no_parameter.dart';
import 'package:chat/features/auth/domain/repositories/auth_repositories.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GetCurrentUserUseCase extends UseCase<User?> {
  final AuthRepositories repo;

  const GetCurrentUserUseCase(this.repo);

  @override
  Future<({Status status, User? data})> call() async {
    return repo.getCurrentUser();
  }
}
