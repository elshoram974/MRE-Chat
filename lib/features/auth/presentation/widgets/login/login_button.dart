import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of<AuthCubit>(context, listen: true);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(AppConst.defaultPadding),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppConst.defaultRadius),
            ),
          ),
          onPressed: cubit.isLoginValid ? cubit.login : null,
          child: Text(S.of(context).login),
        ),
      ),
    );
  }
}
