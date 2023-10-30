import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

enum ShowPass { login, createPass, rePass }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  List<bool> obscurePass = [true, true, true];
  void changeObscureLogin(ShowPass showPass) {
    emit(const AuthInitial());
    obscurePass[showPass.index] = !obscurePass[showPass.index];
    emit(const ChangeObscureState());
  }
}
