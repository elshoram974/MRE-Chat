import 'package:flutter/material.dart';

import '../widgets/login/login_logo.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            LoginLogo(),
            LoginFields(),
          ],
        ),
      ),
    );
  }
}

class LoginFields extends SliverToBoxAdapter {
  const LoginFields({super.key});

  @override
  Widget? get child => const Column(
        children: [
          TextField(),
          TextField(),
        ],
      );
}
