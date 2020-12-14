import 'package:auto_size_text/auto_size_text.dart';
import 'package:currency_app/pages/homepage/widgets/convertion_card/currency_list_tile.dart';
import 'package:flutter/material.dart';

class ToSection extends StatelessWidget {
  final String label;
  final String imagePath;
  final String result;
  final void Function() onTap;

  const ToSection({
    Key key,
    this.label,
    this.onTap,
    this.result,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.only(top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel(),
            SizedBox(height: 5),
            _buildCurrencyListTile(),
            SizedBox(height: 10),
            _buildResultListTile(context),
          ],
        ),
      ),
    );
  }

  Text _buildLabel() {
    return Text(
      'To',
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

  ListTile _buildResultListTile(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      title: Text('Result'),
      subtitle: AutoSizeText(
        result ?? '',
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
