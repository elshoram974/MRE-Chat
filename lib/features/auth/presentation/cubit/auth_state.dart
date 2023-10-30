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

class LoginState extends AuthState {
  const LoginState();
}

class SignUpState extends AuthState {
  const SignUpState();
}

class LoadingState extends AuthState {
  const LoadingState();
}

class ErrorState extends AuthState {
  final String message;
  const ErrorState(this.message);
}
