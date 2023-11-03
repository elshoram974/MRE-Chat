import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/usecases/email_login_usecase.dart';
import '../../domain/usecases/get_current_user_usecase.dart';
import '../../domain/usecases/google_login_usecase.dart';
import '../../domain/usecases/is_logged_in_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';

part 'auth_state.dart';

enum ShowPass { login, createPass, rePass }

class AuthCubit extends Cubit<AuthState> {
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final LoginWithEmailUseCase loginWithEmailUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;
  final IsLoggedInUseCase isLoggedInUseCase;
  final SignUpUseCase signUpUseCase;
  // final GetUserUidUseCase getUserUidUseCase;
  // final SignOutUseCase signOutUseCase;
  AuthCubit({
    required this.loginWithGoogleUseCase,
    required this.loginWithEmailUseCase,
    required this.getCurrentUserUseCase,
    required this.isLoggedInUseCase,
    required this.signUpUseCase,
  }) : super(const AuthInitial()) {
    getUser();
  }
  final FocusNode focusNode = FocusNode();
  final FirebaseAuth auth = FirebaseAuth.instance;

  List<bool> obscurePass = [true, true, true];
  void changeObscureLogin(ShowPass showPass) {
    emit(const AuthInitial());
    obscurePass[showPass.index] = !obscurePass[showPass.index];
    emit(const ChangeObscureState());
  }

  void signUp() async {}

  void getUser() {
    auth.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Future<void> close() {
    focusNode.dispose();
    return super.close();
  }
}
