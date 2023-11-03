import 'package:flutter/material.dart';

import '../widgets/sign_up/fields/sign_up_fields.dart';
import '../widgets/sign_up/go_login_button.dart';
import '../widgets/sign_up/sign_up_button.dart';
import '../widgets/sign_up/sign_up_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
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
    );
  }
}
