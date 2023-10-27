import 'package:chat/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CustomFieldForm extends StatelessWidget {
  const CustomFieldForm({
    super.key,
    this.enabled = true,
    this.hintText,
    this.label,
    this.suffixIcon,
    this.onPressSuffixIcon,
    this.prefixIcon,
    this.onPressPrefixIcon,
    this.autofillHints = const <String>[],
    this.keyboardType,
    this.obscureText = false,
    this.readOnly = false,
    this.onChanged,
    this.onEditingComplete,
    this.textCapitalization = TextCapitalization.none,
    this.onSaved,
    this.textInputAction,
    this.validator,
  });
  final bool enabled;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final List<String>? autofillHints;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? hintText;
  final String? label;
  final IconData? suffixIcon;
  final void Function()? onPressSuffixIcon;
  final IconData? prefixIcon;
  final void Function()? onPressPrefixIcon;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConst.defaultPadding),
      child: TextFormField(
        autocorrect: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autofillHints: autofillHints,
        enableSuggestions: true,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSaved: onSaved,
        validator: validator,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        readOnly: readOnly,
        decoration: InputDecoration(
          enabled: enabled,
          hintText: hintText,
          label: label == null ? null : Text(label!),
          suffixIcon: suffixIcon == null
              ? null
              : IconButton(
                  onPressed: onPressSuffixIcon, icon: Icon(suffixIcon)),
          prefixIcon: prefixIcon == null
              ? null
              : IconButton(
                  onPressed: onPressPrefixIcon, icon: Icon(prefixIcon)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConst.defaultRadius),
          ),
        ),
      ),
    );
  }
}
