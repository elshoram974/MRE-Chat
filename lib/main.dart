import 'package:chat/core/class/scaffold_key.dart';
import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/config/locale/locale_handler.dart';
import 'package:chat/core/utils/config/router.dart';
import 'package:chat/core/utils/constants/string.dart';
import 'package:chat/core/utils/services/bloc_observer.dart';
import 'package:chat/core/utils/services/get_it_singleton.dart';
import 'package:chat/features/auth/data/models/user_model.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/utils/config/themes/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait<dynamic>([
    S.load(LocaleHandler().deviceLocale),
    Firebase.initializeApp(options: DefaultFirebaseOptions.android),
    Hive.initFlutter(),
  ]);
  await Hive.openBox<UserModel>(AppString.userHive);
  getItSingleton();
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt.get<AuthCubit>()),
      ],
      child: const AppRoot(),
    );
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: S.current.AppName,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme.main,
      routerConfig: AppRouter.router,
      builder: EasyLoading.init(),
      scaffoldMessengerKey: ScaffoldKey.call,
    );
  }
}
