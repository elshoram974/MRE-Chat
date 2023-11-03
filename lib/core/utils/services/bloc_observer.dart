import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('error  $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log(bloc.toString());
    log(change.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    log("onClose: $bloc");
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    log("onCreate: $bloc");
    super.onCreate(bloc);
  }
}
