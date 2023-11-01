import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/sign_up/fields/sign_up_fields.dart';
import '../widgets/sign_up/go_login_button.dart';
import '../widgets/sign_up/sign_up_button.dart';
import '../widgets/sign_up/sign_up_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SignUpText(),
              SignUpFields(),
              SignUpButton(),
              GoLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}
