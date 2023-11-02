import 'package:chat/core/status/status.dart';
import 'package:chat/core/usecase/usecase_no_parameter.dart';
import 'package:chat/features/auth/domain/repositories/auth_repositories.dart';

class LoginWithGoogleUseCase extends UseCase<void> {
  final AuthRepositories auth;

  const LoginWithGoogleUseCase(this.auth);

  @override
  Future<({Status status, void data})> call() async {
    return await auth.loginWithGoogle();
  }
}
