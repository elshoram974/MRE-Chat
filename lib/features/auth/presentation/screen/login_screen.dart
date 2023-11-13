import 'package:chat/features/auth/presentation/widgets/login/login_text.dart';
import 'package:flutter/material.dart';

import '../widgets/login/create_account_button.dart';
import '../widgets/login/fields/login_fields.dart';
import '../widgets/login/login_button.dart';
import '../widgets/login/login_logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   final String code = LocaleHandler().deviceLocale.languageCode;
    //   print("code:$code");
    //   ScaffoldKey.showTesterSnakeBar(code);
    // });

    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          LoginLogo(),
          LoginText(),
          LoginFields(),
          LoginButton(),
          CreateNewAccount(),
        ],
      ),
    );
  }
}
