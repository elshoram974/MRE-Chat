import 'package:chat/core/class/scaffold_key.dart';
import 'package:chat/core/status/errors.dart';
import 'package:chat/core/status/status.dart';
import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/config/router.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../auth/domain/usecases/get_current_user_usecase.dart';
import '../../../auth/domain/usecases/sign_out_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final SignOutUseCase signOutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  HomeCubit({
    required this.getCurrentUserUseCase,
    required this.signOutUseCase,
  }) : super(const HomeInitial());

  Future<void> signOut() async {
    EasyLoading.show(status: S.current.loading);
    emit(const LoadingState());
    final ({void data, Status status}) signOut = await signOutUseCase();
    await EasyLoading.dismiss();
    final result = signOut.status;
    if (result is Failure) {
      emit(FailureState(result.message));
      ScaffoldKey.showTesterSnakeBar(result.message);
    } else {
      emit(const SuccessState());
      await AppRouter.router.pushReplacement(AppRouter.login);
    }
  }

  User? getUser() {
    final ({User? data, Status status}) user = getCurrentUserUseCase();
    final Status result = user.status;
    if (result is Failure) {
      emit(FailureState(result.message));
      ScaffoldKey.showTesterSnakeBar(result.message);
      return null;
    }
    return user.data;
  }
}
