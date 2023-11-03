import 'package:chat/features/auth/domain/entities/user_auth_entity.dart';
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

enum FieldType {
  loginEmail,
  loginPass,
  signUpName,
  signUpEmail,
  signUpPass,
  signUpRePass,
}

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

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  bool isLoginValid = false;
  String emailLogin = '';
  String passwordLogin = '';

  List<bool> obscurePass = [true, true, true];
  void changeObscureLogin(FieldType field) {
    emit(const AuthInitial());
    obscurePass[field.index] = !obscurePass[field.index];
    emit(const ChangeObscureState());
  }

  void onChangeField(FieldType field, String val) {
    switch (field) {
      case FieldType.loginEmail:
        emailLogin = val;
      case FieldType.loginPass:
        passwordLogin = val;
      case FieldType.signUpName:
      case FieldType.signUpEmail:
      case FieldType.signUpPass:
      case FieldType.signUpRePass:
    }
    if (loginKey.currentState!.validate()) {
      isLoginValid = true;
      emit(const SuccessValidateState());
    } else {
      isLoginValid = false;
      emit(const FailedValidateState());
    }
  }

  void signUp() {}

  void login() {
    if (loginKey.currentState!.validate()) {
      loginWithEmailUseCase.call(
        UserAuthEntity(
          name: '',
          email: emailLogin,
          password: passwordLogin,
        ),
      );
    }
  }

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
