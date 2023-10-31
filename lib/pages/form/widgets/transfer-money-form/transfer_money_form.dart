import 'package:flutter/material.dart';

import 'package:simple_form/pages/form/widgets/transfer-money-form/amount_form_fields.dart';
import 'package:simple_form/pages/form/widgets/transfer-money-form/email_form_field.dart';

class TransferMoneyForm extends StatefulWidget {
  const TransferMoneyForm({super.key});

  @override
  State<TransferMoneyForm> createState() => _TransferMoneyFormState();
}

class _TransferMoneyFormState extends State<TransferMoneyForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? amount;

  void _handleSubmit() {
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      formState.save();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Tranfered $amount from $email')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const fieldsGap = 20.0;
    final theme = Theme.of(context);

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        color: theme.colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Transfer money',
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: fieldsGap),
            EmailFormField(onSaved: (value) {
              setState(() {
                email = value;
              });
            }),
            const SizedBox(height: fieldsGap),
            AmountFormFields(onSaved: (value) {
              setState(() {
                amount = value;
              });
            }),
            const SizedBox(height: fieldsGap),
            OutlinedButton(
              onPressed: _handleSubmit,
              child: Text(
                'Transfer',
                style: theme.textTheme.titleMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
