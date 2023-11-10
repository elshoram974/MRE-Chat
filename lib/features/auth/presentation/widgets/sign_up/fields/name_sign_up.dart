import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/functions/app_validate.dart';
import 'package:chat/core/utils/widgets/custom_field_form.dart';
import 'package:flutter/material.dart';

import '../../../cubit/auth_cubit.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, required this.cubit});
  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CustomFieldForm(
      autofillHints: const [AutofillHints.name],
      label: S.of(context).name,
      hintText: S.of(context).nameUsername,
      keyboardType: TextInputType.name,
      prefixIcon: Icons.person_2_outlined,
      onChanged: (val) => cubit.onChangeField(FieldType.signUpName, val),
      validator: (val) => AppValidator.auth(val, 3, 50, FieldType.signUpName, context),
    );
  }
}
