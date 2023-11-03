part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class ChangeObscureState extends AuthState {
  const ChangeObscureState();
}
class SuccessValidateState extends AuthState {
  const SuccessValidateState();
}
class FailedValidateState extends AuthState {
  const FailedValidateState();
}

class LoginState extends AuthState {
  const LoginState();
}

class SignUpState extends AuthState {
  const SignUpState();
}

class LoadingState extends AuthState {
  const LoadingState();
}

class SuccessState extends AuthState {
  final User user;
  const SuccessState(this.user);
}
class FailureState extends AuthState {
  final String message;
  const FailureState(this.message);
}
