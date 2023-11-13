import 'package:chat/core/status/status.dart';
import 'package:chat/core/usecase/usecase_no_parameter.dart';
import 'package:chat/features/auth/domain/repositories/auth_repositories.dart';

class IsLoggedInUseCase extends UseCase<bool> {
  final AuthRepositories repo;

  const IsLoggedInUseCase(this.repo);

  @override
  ({Status status, bool data}) call() {
    return repo.isLoggedIn();
  }
}
