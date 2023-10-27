import 'package:chat/core/extensions/padding_extension.dart';
import 'package:chat/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'email_login.dart';
import 'password_login.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Form(
        child: Column(
          children: [
            AppConst.defaultPadding.hightPadding,
            const EmailField(),
            const PasswordField(),
          ],
        ),
      ),
    );
  }
}