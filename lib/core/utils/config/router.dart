import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:chat/features/auth/presentation/screen/login_screen.dart';
import 'package:chat/features/auth/presentation/screen/sign_up_screen.dart';
import 'package:chat/features/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String login = '/';
  static const String signUp = '/sign-up';
  static const String home = '/home';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        redirect: (context, state) {
          final AuthCubit login = BlocProvider.of<AuthCubit>(context);
          if (login.isLoggedInUseCase().data) return home;
          return null;
        },
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: signUp,
        builder: (BuildContext context, GoRouterState state) {
          return const SignUpScreen();
        },
      ),
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) {
          final AuthCubit login = BlocProvider.of<AuthCubit>(context);
          if (!login.isClosed) login.close();
          return const HomeScreen();
        },
      ),
    ],
  );
}
