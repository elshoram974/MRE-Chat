import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/constants/app_constants.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

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
          onPressed: cubit.isSignUpValid ? cubit.signUp : null,
          child: Text(S.of(context).signUp),
        ),
      ),
    );
  }
}
