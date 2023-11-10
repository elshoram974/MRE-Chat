import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/functions/app_validate.dart';
import 'package:chat/core/utils/widgets/custom_field_form.dart';
import 'package:flutter/material.dart';

import '../../../cubit/auth_cubit.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.cubit});
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomFieldForm(
      autofillHints: const [AutofillHints.email],
      label: S.of(context).email,
      hintText: S.of(context).emailUsernamePhone,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: Icons.person_2_outlined,
      onChanged: (val) => cubit.onChangeField(FieldType.signUpEmail, val),
      validator: (val) => AppValidator.auth(val, 3, 50, FieldType.signUpEmail, context),
    );
  }
}
