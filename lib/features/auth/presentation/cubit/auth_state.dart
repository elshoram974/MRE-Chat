part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class Login extends AuthState {
  const Login();
}

class SignUp extends AuthState {
  const SignUp();
}

class Loading extends AuthState {
  const Loading();
}

class Error extends AuthState {
  final String message;
  const Error(this.message);
}
