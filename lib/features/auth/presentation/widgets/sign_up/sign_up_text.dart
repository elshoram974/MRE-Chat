import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/constants/app_constants.dart';
import 'package:chat/core/utils/constants/styles.dart';
import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: const SizedBox(),
      leadingWidth: AppConst.defaultPadding,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(S.of(context).signUp, style: AppTextStyle.styleTitle32),
    );
  }
}
