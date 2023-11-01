import 'package:chat/core/utils/extensions/padding_extension.dart';
import 'package:chat/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'email_sign_up.dart';
import 'name_sign_up.dart';
import 'password_sign_up.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
        child: AutofillGroup(
          child: Column(
            children: [
              AppConst.defaultPadding.hightPadding,
              const NameField(),
              const EmailField(),
              const PasswordField(),
            ],
          ),
        ),
      ),
    );
  }
}
