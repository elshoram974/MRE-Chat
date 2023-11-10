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
    return Column(
      children: [
        NewPass(cubit: cubit),
        RePass(cubit: cubit),
      ],
    );
  }
}

class NewPass extends StatelessWidget {
  const NewPass({super.key, required this.cubit});
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (p, c) => c is ChangeObscureState && c.passType == PassType.signUpPass,
      builder: (context, state) {
        final bool obscurePass = cubit.obscurePass[PassType.signUpPass.index];
        return CustomFieldForm(
          autofillHints: const [AutofillHints.newPassword],
          label: S.of(context).password,
          hintText: S.of(context).enterNewPassword,
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: Icons.lock_outline,
          obscureText: obscurePass,
          suffixIcon: obscurePass ? Icons.visibility : Icons.visibility_off,
          onEditingComplete: cubit.focusNode.requestFocus,
          onPressSuffixIcon: () => cubit.changeObscureLogin(PassType.signUpPass),
          onChanged: (val) => cubit.onChangeField(FieldType.signUpPass, val),
          validator: (val) => AppValidator.auth(val, 8, 100, FieldType.signUpPass, context),
        );
      },
    );
  }
}

class RePass extends StatelessWidget {
  const RePass({super.key, required this.cubit});
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (p, c) => c is ChangeObscureState && c.passType == PassType.signUpRePass,
      builder: (context, state) {
        final bool obscureRePass = cubit.obscurePass[PassType.signUpRePass.index];
        return CustomFieldForm(
          focusNode: cubit.focusNode,
          autofillHints: const [AutofillHints.newPassword],
          label: S.of(context).rePassword,
          hintText: S.of(context).retypePassword,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
          prefixIcon: Icons.lock_outline,
          obscureText: obscureRePass,
          suffixIcon: obscureRePass ? Icons.visibility : Icons.visibility_off,
          onPressSuffixIcon: () =>cubit.changeObscureLogin(PassType.signUpRePass),
          onChanged: (val) => cubit.onChangeField(FieldType.signUpRePass, val),
          onFieldSubmitted: (val) => cubit.signUp(),
          validator: (val) {
            String? validate = AppValidator.auth(val, 8, 100, FieldType.signUpRePass, context);
            if (validate != null) return validate;
            if (cubit.passwordSignUp != val) {
              return S.of(context).notSamePass;
            }
            return null;
          },
        );
      },
    );
  }
}
