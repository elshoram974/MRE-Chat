import 'package:chat/features/auth/data/datasources/auth_local_datasources.dart';
import 'package:chat/features/auth/data/datasources/auth_remote_datasources.dart';
import 'package:chat/features/auth/data/repositories/auth_repositories.dart';
import 'package:chat/features/auth/domain/repositories/auth_repositories.dart';
import 'package:chat/features/auth/domain/usecases/email_login_usecase.dart';
import 'package:chat/features/auth/domain/usecases/get_current_user_usecase.dart';
import 'package:chat/features/auth/domain/usecases/google_login_usecase.dart';
import 'package:chat/features/auth/domain/usecases/is_logged_in_usecase.dart';
import 'package:chat/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void getItSingleton() {
  getIt.registerLazySingleton<AuthRepositories>(
    () => AuthRepositoriesImp(
      authLocalDataSource: const AuthLocalDataSourceImp(),
      authRemoteDataSource: AuthRemoteDataSourceImp(
        FirebaseAuth.instance,
      ),
    ),
  );
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      loginWithGoogleUseCase: LoginWithGoogleUseCase(getIt.get<AuthRepositories>()),
      loginWithEmailUseCase: LoginWithEmailUseCase(getIt.get<AuthRepositories>()),
      getCurrentUserUseCase: GetCurrentUserUseCase(getIt.get<AuthRepositories>()),
      isLoggedInUseCase: IsLoggedInUseCase(getIt.get<AuthRepositories>()),
      signUpUseCase: SignUpUseCase(getIt.get<AuthRepositories>()),
    ),
  );
}
