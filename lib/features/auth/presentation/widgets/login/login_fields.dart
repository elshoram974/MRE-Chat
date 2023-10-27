import 'package:chat/core/utils/constants/app_constants.dart';
import 'package:chat/core/utils/widgets/custom_field_form.dart';
import 'package:flutter/material.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Form(
        child: Column(
          children: [
            AppConst.paddingWidget,
            CustomFieldForm(),
            CustomFieldForm(),
          ],
        ),
      ),
    );
  }
}
