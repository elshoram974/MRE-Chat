import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/functions/app_validate.dart';
import 'package:chat/core/utils/widgets/custom_field_form.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.cubit});
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomFieldForm(
      autofillHints: const [
        AutofillHints.email,
        AutofillHints.username,
        AutofillHints.telephoneNumber,
      ],
      label: S.of(context).email,
      hintText: S.of(context).emailUsernamePhone,
      prefixIcon: Icons.person_2_outlined,
      onChanged: (val) => cubit.onChangeField(FieldType.loginEmail, val),
      validator: (val)=> AppValidator.auth(val, 5, 100, FieldType.loginEmail, context),
    );
  }
}
