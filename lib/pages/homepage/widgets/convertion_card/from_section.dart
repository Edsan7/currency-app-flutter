import 'package:flutter/material.dart';

import 'package:currency_app/pages/homepage/widgets/convertion_card/currency_list_tile.dart';
import 'package:currency_app/shared/inputs/money_input_field.dart';

class FromSection extends StatelessWidget {
  final String label;
  final String imagePath;
  final void Function() onTap;
  final void Function(String) onSaved;

  const FromSection({
    Key key,
    this.label,
    this.onTap,
    this.onSaved,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLabel(),
          SizedBox(height: 5),
          _buildCurrencyListTile(),
          SizedBox(height: 20),
          _buildMoneyInputField(),
        ],
      ),
    );
  }

  Text _buildLabel() {
    return Text(
      'From',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  CurrencyListTile _buildCurrencyListTile() {
    return CurrencyListTile(
      label: label ?? 'Choose a currency',
      imagePath: imagePath ?? 'assets/country-icon.png',
      onTap: onTap,
    );
  }

  MoneyInputField _buildMoneyInputField() {
    return MoneyInputField(
      label: 'Insert a value',
      onSaved: onSaved,
    );
  }
}
