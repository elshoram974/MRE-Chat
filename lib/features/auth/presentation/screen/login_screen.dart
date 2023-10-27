import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/login/fields/login_fields.dart';
import '../widgets/login/login_button.dart';
import '../widgets/login/login_logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: const Scaffold(
        body: Center(
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: [
              LoginLogo(),
              LoginFields(),
              LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
