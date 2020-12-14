import 'package:currency_app/models/app_error.dart';
import 'package:currency_app/models/symbol_result_model.dart';
import 'package:currency_app/repository/currency_repository.dart';

class CurrenciesController {
  final _repository = CurrencyRepository();

  bool isLoading;

  SymbolResultModel symbolsModel;
  List<SymbolModel> symbolsList = List<SymbolModel>();
  List<SymbolModel> filteredSymbolsList = List<SymbolModel>();

  AppError appError;

  String get errorMessage => appError?.message;
  int get itemCount => filteredSymbolsList?.length ?? 0;
  List<SymbolModel> get symbols => filteredSymbolsList ?? <SymbolModel>[];

  Future fetchAllSymbols() async {
    final result = await _repository.fetchAllCurrencies();
    result.fold(
      (l) => appError = l,
      (r) => symbolsModel = r,
    );

    symbolsModel.symbols.entries.forEach(
      (element) => symbolsList.add(element.value),
    );

    filteredSymbolsList = symbolsList;
  }

  void searchSymmbol(String filter) {
    filteredSymbolsList = symbolsList
        .where((symbol) =>
            symbol.description.toLowerCase().contains(filter.toLowerCase()) ||
            symbol.code.toLowerCase().contains(filter.toLowerCase()))
        .toList();
  }
}
