import 'package:currency_app/models/symbol_result_model.dart';
import 'package:currency_app/pages/homepage/widgets/convertion_card/from_section.dart';
import 'package:currency_app/pages/homepage/widgets/convertion_card/to_section.dart';
import 'package:currency_app/shared/buttons/primary_button.dart';
import 'package:flutter/material.dart';

class ConvertionCard extends StatefulWidget {
  final String convertedValue;
  final Function onConvertPressed;
  final Function setFromCurrency;
  final Function setToCurrency;
  final Function onSetAmount;

  const ConvertionCard({
    Key key,
    this.onConvertPressed,
    this.onSetAmount,
    this.setFromCurrency,
    this.setToCurrency,
    this.convertedValue,
  }) : super(key: key);
  @override
  _ConvertionCardState createState() => _ConvertionCardState();
}

class _ConvertionCardState extends State<ConvertionCard> {
  SymbolModel fromCurrency;
  SymbolModel toCurrency;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          color: Colors.black.withOpacity(0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildRow(),
              _buildConvertButton(),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildRow() {
    return Row(
      children: [
        _buildFromSection(),
        SizedBox(width: 5),
        _buildArrow(),
        SizedBox(width: 10),
        _buildToSection()
      ],
    );
  }

  _buildFromSection() {
    final imagePath = fromCurrency != null ? 'assets/flags/${fromCurrency.code}.png' : null;
    return FromSection(
      label: fromCurrency?.code ?? 'Choose a currency',
      onSaved: widget.onSetAmount,
      imagePath: imagePath,
      onTap: _fromOnTap,
    );
  }

  _fromOnTap() async {
    final dynamic result =
        await Navigator.pushNamed(context, '/homepage/currencies');
    if (result != null) {
      setState(() => fromCurrency = result);
      widget.setFromCurrency(fromCurrency.code);
    }
  }

  Center _buildArrow() {
    return Center(
      child: Icon(
        Icons.arrow_right,
        size: 30,
      ),
    );
  }

  _buildToSection() {
    final imagePath = toCurrency != null ? 'assets/flags/${toCurrency.code}.png' : null;
    return ToSection(
      label: toCurrency?.code ?? 'Choose a currency',
      onTap: _toOnTap,
      imagePath: imagePath,
      result: widget.convertedValue,
    );
  }

  _toOnTap() async {
    final dynamic result =
        await Navigator.pushNamed(context, '/homepage/currencies');
    if (result != null) {
      setState(() => toCurrency = result);
      widget.setToCurrency(toCurrency.code);
    }
  }

  _buildConvertButton() {
    return PrimaryButton(
      label: 'Convert',
      onPressed: widget.onConvertPressed,
    );
  }
}
