import 'package:chat/core/class/scaffold_key.dart';
import 'package:chat/core/status/errors.dart';
import 'package:chat/core/status/status.dart';
import 'package:chat/core/status/success.dart';
import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/config/router.dart';
import 'package:chat/features/auth/domain/entities/user_auth_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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

enum PassType {
  loginPass,
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
    // if (isLoggedInUseCase().data) closeAuth();
  }
  final FocusNode focusNode = FocusNode();
  final FirebaseAuth auth = FirebaseAuth.instance;

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  bool isLoginValid = false;
  bool isSignUpValid = false;

  String emailLogin = '';
  String passwordLogin = '';

  String nameSignUp = '';
  String emailSignUp = '';
  String passwordSignUp = '';
  String rePasswordSignUp = '';

  final List<bool> obscurePass = [true, true, true];
  void changeObscureLogin(PassType type) {
    obscurePass[type.index] = !obscurePass[type.index];
    emit(
      ChangeObscureState(
        isObscured: obscurePass[type.index],
        passType: type,
      ),
    );
  }

  void onChangeField(FieldType field, String val) {
    switch (field) {
      case FieldType.loginEmail:
        emailLogin = val;
      case FieldType.loginPass:
        passwordLogin = val;
      case FieldType.signUpName:
        nameSignUp = val;
      case FieldType.signUpEmail:
        emailSignUp = val;
      case FieldType.signUpPass:
        passwordSignUp = val;
      case FieldType.signUpRePass:
        rePasswordSignUp = val;
    }
    if (field == FieldType.loginEmail || field == FieldType.loginPass) {
      if (loginKey.currentState!.validate()) {
        isLoginValid = true;
        emit(const SuccessValidateState());
      } else {
        isLoginValid = false;
        emit(const FailedValidateState());
      }
    } else {
      if (signUpKey.currentState!.validate() &&
          passwordSignUp == rePasswordSignUp) {
        isSignUpValid = true;
        emit(const SuccessValidateState());
      } else {
        isSignUpValid = false;
        emit(const FailedValidateState());
      }
    }
  }

  void signUp() async {
    if (signUpKey.currentState!.validate()) {
      EasyLoading.show(status: S.current.loading);
      emit(const LoadingState());
      ({User? data, Status status}) signUp = await signUpUseCase.call(
        UserAuthEntity(
          name: nameSignUp,
          email: emailSignUp,
          password: passwordSignUp,
        ),
      );
      await EasyLoading.dismiss();
      final Status result = signUp.status;
      if (result is Success) {
        emit(SuccessState(signUp.data!));
        await closeAuth();
        ScaffoldKey.showTesterSnakeBar(S.current.signUp);
      } else if (result is Failure) {
        emit(FailureState(result.message));
        ScaffoldKey.showTesterSnakeBar(result.message);
      }
    }
  }

  void login() async {
    if (loginKey.currentState!.validate()) {
      EasyLoading.show(status: S.current.loading);
      emit(const LoadingState());
      ({User? data, Status status}) login = await loginWithEmailUseCase.call(
        UserAuthEntity(
          name: '',
          email: emailLogin,
          password: passwordLogin,
        ),
      );
      await EasyLoading.dismiss();
      final Status result = login.status;
      if (result is Success) {
        emit(SuccessState(login.data!));
        ScaffoldKey.showTesterSnakeBar(S.current.login);
        await closeAuth();
      } else if (result is Failure) {
        emit(FailureState(result.message));
        ScaffoldKey.showTesterSnakeBar(result.message);
      }
    }
  }

  Future<void> closeAuth() async {
    await AppRouter.router.pushReplacement(AppRouter.home);
  }
}
