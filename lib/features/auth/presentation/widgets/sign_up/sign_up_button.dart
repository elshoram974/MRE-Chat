import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppConst.defaultPadding),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConst.defaultRadius),
            ),
          ),
          onPressed: () {
            print("SignUp");
          },
          child: Text(S.of(context).signUp),
        ),
      ),
    );
  }
}