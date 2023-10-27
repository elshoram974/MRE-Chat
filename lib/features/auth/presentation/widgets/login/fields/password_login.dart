import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/widgets/custom_field_form.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit controller = BlocProvider.of<AuthCubit>(context, listen: false);
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (p, c) => c is ChangeObscure,
      builder: (context, state) {
        return CustomFieldForm(
          autofillHints: const [AutofillHints.password],
          label: S.of(context).password,
          hintText: S.of(context).enterYourPassword,
          textInputAction: TextInputAction.done,
          prefixIcon: Icons.lock_outline,
          obscureText: controller.obscureLogin,
          suffixIcon: controller.obscureLogin ? Icons.visibility : Icons.visibility_off,
          onPressSuffixIcon: controller.changeObscureLogin,
        );
      },
    );
  }
}
