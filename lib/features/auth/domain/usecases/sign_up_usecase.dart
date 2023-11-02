import 'package:chat/core/usecase/usecase_no_parameter.dart';
import 'package:chat/features/auth/domain/repositories/auth_repositories.dart';

class SignUpUseCase extends UseCase<void> {
  final AuthRepositories auth;

  const SignUpUseCase(this.auth);

  @override
  Future<void> call() async {
    return await auth.signUp();
  }
}
