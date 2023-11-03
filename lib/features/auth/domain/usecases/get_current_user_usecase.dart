import 'package:chat/core/status/status.dart';
import 'package:chat/core/usecase/usecase_no_parameter.dart';
import 'package:chat/features/auth/domain/repositories/auth_repositories.dart';

import '../../data/models/user_model.dart';

class GetCurrentUserUseCase extends UseCase<UserModel?> {
  final AuthRepositories repo;

  const GetCurrentUserUseCase(this.repo);

  @override
  Future<({Status status, UserModel? data})> call() async {
    return repo.getCurrentUser();
  }
}
