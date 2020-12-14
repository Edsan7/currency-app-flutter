import 'package:currency_app/controllers/homepage_controller.dart';
import 'package:currency_app/helpers/date_helper.dart';
import 'package:currency_app/pages/homepage/widgets/convertion_card/convertion_card.dart';
import 'package:currency_app/pages/homepage/widgets/line_chart/line_chart.dart';
import 'package:currency_app/shared/dialogs/loading_dialog.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _controller = HomepageController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Currency App'),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }

  _buildBody() {
    return Form(
      key: _key,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              _buildConvertionCard(),
              _buildCurrencyChart(),
            ],
          ),
        ),
      ),
    );
  }

  ConvertionCard _buildConvertionCard() {
    return ConvertionCard(
      setFromCurrency: _controller.setFrom,
      setToCurrency: _controller.setTo,
      convertedValue: _controller.amountResult,
      onSetAmount: _controller.setAmount,
      onConvertPressed: _send,
    );
  }

  _buildCurrencyChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        _buildCharHeader(),
        _buildChart(),
      ],
    );
  }

  _buildCharHeader() {
    final date = DateHelper.formatDate(DateTime.now());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          HomepageController.from != null
              ? HomepageController.from + ' Time Series'
              : '',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          date,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  CurrencyChart _buildChart() {
    return CurrencyChart(
      gradientColors: [
        Colors.blue[300],
        Colors.blue[900],
      ],
      maxY: _controller.maxY?.ceilToDouble(),
      minY: _controller.minY?.floorToDouble(),
      maxX: 31,
      spots: _controller.chartCoordinators,
    );
  }

  _send() async {
    if (_key.currentState.validate()) {
      _key.currentState.save();

      LoadingDialog.show(context, message: 'Loading...');
      await _controller.convert();
      LoadingDialog.hide();

      setState(() {});
    }
  }
}
