import 'package:chat/core/utils/extensions/padding_extension.dart';
import 'package:chat/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/auth_cubit.dart';
import 'email_login.dart';
import 'password_login.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of<AuthCubit>(context, listen: false);
    return SliverToBoxAdapter(
      child: Form(
        key: cubit.loginKey,
        child: AutofillGroup(
          child: Column(
            children: [
              AppConst.defaultPadding.hightPadding,
              EmailField(cubit: cubit),
              PasswordField(cubit: cubit),
            ],
          ),
        ),
      ),
    );
  }
}
