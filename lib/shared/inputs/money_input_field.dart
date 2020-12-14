import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class MoneyInputField extends StatefulWidget {
  final void  Function(String) onSaved;
  final String Function(String) validator;
  final String label;
  final bool isReadOnly;

  const MoneyInputField({
    Key key,
    this.onSaved,
    this.validator,
    this.label,
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  _MoneyInputFieldState createState() => _MoneyInputFieldState();
}

class _MoneyInputFieldState extends State<MoneyInputField> {
  final _controller = MoneyMaskedTextController(initialValue: 1.0);
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
      onSaved: widget.onSaved,
      validator: widget.validator,
      readOnly: widget.isReadOnly,
      decoration: InputDecoration(
        labelText: widget.label,
        filled: true,
        border: InputBorder.none,
      ),
    );
  }
}
