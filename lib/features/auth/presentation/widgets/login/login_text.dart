import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/constants/app_constants.dart';
import 'package:chat/core/utils/constants/styles.dart';
import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 3 * AppConst.defaultPadding,
          vertical: AppConst.defaultPadding,
        ),
        child: Text(S.of(context).login, style: AppTextStyle.styleTitle32),
      ),
    );
  }
}
