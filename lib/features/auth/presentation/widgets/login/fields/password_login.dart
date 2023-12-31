import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/functions/app_validate.dart';
import 'package:chat/core/utils/widgets/custom_field_form.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, required this.cubit});
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (p, c)=> c is ChangeObscureState && c.passType == PassType.loginPass,
      builder: (context, state) {
        final bool obscurePass = cubit.obscurePass[PassType.loginPass.index];
        return CustomFieldForm(
          autofillHints: const [AutofillHints.password],
          label: S.of(context).password,
          hintText: S.of(context).enterYourPassword,
          textInputAction: TextInputAction.done,
          prefixIcon: Icons.lock_outline,
          obscureText: obscurePass,
          suffixIcon: obscurePass ? Icons.visibility : Icons.visibility_off,
          onPressSuffixIcon: () => cubit.changeObscureLogin(PassType.loginPass),
          onChanged: (val) => cubit.onChangeField(FieldType.loginPass, val),
          validator: (val) => AppValidator.auth(val, 8, 100, FieldType.loginPass, context),
          onFieldSubmitted: (val) => cubit.login(),
        );
      },
    );
  }
}
