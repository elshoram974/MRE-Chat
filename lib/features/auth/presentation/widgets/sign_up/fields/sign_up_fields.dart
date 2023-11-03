import 'package:chat/core/utils/extensions/padding_extension.dart';
import 'package:chat/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/auth_cubit.dart';
import 'email_sign_up.dart';
import 'name_sign_up.dart';
import 'password_sign_up.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of<AuthCubit>(context, listen: false);

    return SliverToBoxAdapter(
      child: Form(
        key: cubit.signUpKey,
        child: AutofillGroup(
          child: Column(
            children: [
              AppConst.defaultPadding.hightPadding,
              NameField(cubit: cubit),
              EmailField(cubit: cubit),
              PasswordField(cubit: cubit),
            ],
          ),
        ),
      ),
    );
  }
}
