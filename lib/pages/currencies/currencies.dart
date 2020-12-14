import 'package:currency_app/controllers/currencies_controller.dart';
import 'package:currency_app/models/symbol_result_model.dart';
import 'package:currency_app/shared/centered_message.dart';
import 'package:currency_app/shared/circular_loading.dart';
import 'package:currency_app/shared/inputs/search_input_field.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class Currencies extends StatefulWidget {
  @override
  _CurrenciesState createState() => _CurrenciesState();
}

class _CurrenciesState extends State<Currencies> {
  final _controller = CurrenciesController();

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    setState(() => _controller.isLoading = true);
    await _controller.fetchAllSymbols();
    setState(() => _controller.isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Currencies'),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }

  _buildBody() {
    if (_controller.isLoading == true) {
      return CircularLoading();
    }
    if (_controller.appError != null) {
      return CenteredMessage(message: _controller.errorMessage);
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchInputField(onChanged: _onSearch),
          ListView.builder(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            itemCount: _controller.itemCount,
            itemBuilder: _buildSymbolCard,
          ),
        ],
      ),
    );
  }

  _onSearch(String text) => setState(() => _controller.searchSymmbol(text));

  Widget _buildSymbolCard(BuildContext context, int index) {
    final symbol = _controller.symbols[index];
    return ListTile(
      leading: OctoImage(
        image: AssetImage('assets/flags/${symbol.code}.png'),
        errorBuilder: OctoError.icon(),
      ),
      title: Text(symbol?.description ?? ''),
      subtitle: Text(symbol?.code ?? ''),
      onTap: () => _onTap(symbol),
    );
  }

  _onTap(SymbolModel symbol) {
    Navigator.pop(context, symbol);
  }
}
