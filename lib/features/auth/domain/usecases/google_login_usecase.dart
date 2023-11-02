import 'package:chat/core/usecase/usecase_no_parameter.dart';
import 'package:chat/features/auth/domain/repositories/auth_repositories.dart';

class LoginWithGoogleUseCase extends UseCase<void> {
  final AuthRepositories auth;

  const LoginWithGoogleUseCase(this.auth);

  @override
  Future<void> call()async{
    return await auth.loginWithGoogle();
  }
}
