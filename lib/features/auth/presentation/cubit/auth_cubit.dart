import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  bool obscureLogin = true;
  void changeObscureLogin() {
    emit(const AuthInitial());
    obscureLogin = !obscureLogin;
    emit(const ChangeObscure());
  }
}
