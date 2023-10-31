import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool readOnly;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.readOnly = false,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.keyboardType,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      canRequestFocus: !readOnly,
      onChanged: onChanged,
      onSaved: onSaved,
      keyboardType: keyboardType,
      autovalidateMode: autovalidateMode,
      mouseCursor:
          readOnly ? SystemMouseCursors.basic : SystemMouseCursors.text,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
