import 'package:chat/core/status/status.dart';
import 'package:chat/core/usecase/usecase_no_parameter.dart';
import 'package:chat/features/auth/domain/repositories/auth_repositories.dart';

class GetUserUidUseCase extends UseCase<String> {
  final AuthRepositories repo;

  const GetUserUidUseCase(this.repo);

  @override
  Future<({Status status, String data})> call() async {
    return repo.getUserUid();
  }
}
