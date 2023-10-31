import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:simple_form/pages/form/widgets/transfer-money-form/custom_text_form_field.dart';

class ExchangeRate {
  final stream =
      Stream.periodic(const Duration(seconds: 1), (_) => Random().nextDouble());
}

class AmountFormFields extends StatefulWidget {
  final FormFieldSetter<String> onSaved;
  const AmountFormFields({super.key, required this.onSaved});

  @override
  State<AmountFormFields> createState() => _AmountFormFieldsState();
}

class _AmountFormFieldsState extends State<AmountFormFields> {
  double? exchangeRate = 0;
  StreamSubscription<double>? _exchangeRateSubscription;
  final _amountController = TextEditingController();
  final _convertedAmountController = TextEditingController();

  String? _validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter amount';
    }
    final amount = double.tryParse(value);
    if (amount == null) {
      return 'Please enter a valid amount';
    }
    if (amount <= 0) {
      return 'Amount must be positive';
    }
    return null;
  }

  void _updateConvertedAmount() {
    final amountValue = double.tryParse(_amountController.text) ?? 0.0;
    if (exchangeRate != 0) {
      _convertedAmountController.text =
          (amountValue.toDouble() * exchangeRate!).toStringAsFixed(2);
    }
  }

  void _handleAmountChange() {
    _updateConvertedAmount();
  }

  void _handleExchangeRateChange(value) {
    setState(() {
      exchangeRate = value;
    });
    _updateConvertedAmount();
  }

  @override
  void initState() {
    _amountController.addListener(_handleAmountChange);
    _exchangeRateSubscription =
        ExchangeRate().stream.listen(_handleExchangeRateChange);
    super.initState();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _convertedAmountController.dispose();
    _exchangeRateSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const placeholder = '0.00';

    return Column(
      children: [
        CustomTextFormField(
          controller: _amountController,
          labelText: 'Amount',
          hintText: placeholder,
          validator: _validateAmount,
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: widget.onSaved,
        ),
        Icon(
          Icons.arrow_downward_outlined,
          color: Theme.of(context).colorScheme.primary,
        ),
        CustomTextFormField(
          controller: _convertedAmountController,
          labelText: 'Converted amount',
          hintText: placeholder,
          readOnly: true,
        ),
      ],
    );
  }
}
