import 'package:flutter/material.dart';

import 'package:simple_form/pages/form/widgets/transfer-money-form/custom_text_form_field.dart';

class EmailFormField extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  const EmailFormField({super.key, required this.onSaved});

  String? _validateEmail(String? value) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    return RegExp(pattern).hasMatch(value)
        ? null
        : 'Please enter a valid email';
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: 'Email',
      hintText: 'Enter your email',
      validator: _validateEmail,
      keyboardType: TextInputType.emailAddress,
      onSaved: onSaved,
    );
  }
}
