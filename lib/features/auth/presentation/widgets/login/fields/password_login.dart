import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/widgets/custom_field_form.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFieldForm(
      autofillHints: const [AutofillHints.password],
      label: S.of(context).password,
      hintText: S.of(context).enterYourPassword,
      textInputAction: TextInputAction.done,
      prefixIcon: Icons.lock_outline,
      obscureText: false,
      suffixIcon: Icons.visibility_outlined,
      onPressSuffixIcon: () {},
    );
  }
}