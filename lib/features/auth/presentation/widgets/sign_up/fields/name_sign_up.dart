import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/core/utils/widgets/custom_field_form.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFieldForm(
      autofillHints: const [AutofillHints.name, AutofillHints.username],
      label: S.of(context).name,
      hintText: S.of(context).nameUsername,
      prefixIcon: Icons.person_2_outlined,
    );
  }
}
