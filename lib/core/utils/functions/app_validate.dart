import 'package:chat/core/utils/config/locale/generated/l10n.dart';
import 'package:chat/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';

class AppValidator {
  static String? auth(
    String? value,
    int min,
    int max,
    FieldType field,
    BuildContext context,
  ) {
    assert(min <= max);
    if (value == null || value.trim() == "") return S.of(context).fillField;

    switch (field) {
      case FieldType.loginEmail || FieldType.signUpEmail:
        if (!isEmail(value)) return S.of(context).enterValidEmail;

      default:
    }

    if (value.length < min) {
      return S.of(context).cantBeLessThan(min);
    } else if (value.length > max) {
      return S.of(context).cantBeMoreThan(max);
    }

    return null;
  }
}

bool isEmail(email) {
  const String emailRegExp =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  return RegExp(emailRegExp).hasMatch(email.trim());
}
