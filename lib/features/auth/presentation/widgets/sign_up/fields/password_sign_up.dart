import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/widgets/custom_field_form.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    AuthCubit _ = BlocProvider.of<AuthCubit>(context, listen: false);
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (p, c) => c is ChangeObscureState,
      builder: (context, state) {
        final bool obscurePass = _.obscurePass[FieldType.signUpPass.index];
        final bool obscureRePass = _.obscurePass[FieldType.signUpRePass.index];
        return Column(
          children: [
            CustomFieldForm(
              autofillHints: const [AutofillHints.newPassword],
              label: S.of(context).password,
              hintText: S.of(context).enterNewPassword,
              // textInputAction: TextInputAction.done,
              prefixIcon: Icons.lock_outline,
              obscureText: obscurePass,
              suffixIcon: obscurePass ? Icons.visibility : Icons.visibility_off,
              onEditingComplete: _.focusNode.requestFocus,
              onPressSuffixIcon: () =>_.changeObscureLogin(FieldType.signUpPass),
            ),
            CustomFieldForm(
              focusNode: _.focusNode,
              autofillHints: const [AutofillHints.newPassword],
              label: S.of(context).rePassword,
              hintText: S.of(context).retypePassword,
              textInputAction: TextInputAction.done,
              prefixIcon: Icons.lock_outline,
              obscureText: obscureRePass,
              suffixIcon: obscureRePass ? Icons.visibility : Icons.visibility_off,
              onPressSuffixIcon: () => _.changeObscureLogin(FieldType.signUpRePass),
            )
          ],
        );
      },
    );
  }
}
