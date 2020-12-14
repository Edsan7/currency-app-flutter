import 'package:currency_app/helpers/date_helper.dart';
import 'package:currency_app/models/app_error.dart';
import 'package:currency_app/models/convert_result_model.dart';
import 'package:currency_app/models/time_series_model.dart';
import 'package:currency_app/models/chart_coordinator_model.dart';
import 'package:currency_app/repository/currency_repository.dart';

class HomepageController {
  final _repository = CurrencyRepository();

  String endDate = DateHelper.formatDate(DateTime.now(), format: 'yyyy-MM-dd');
  String startDate = DateHelper.formatDate(
    DateTime.now().subtract(
      Duration(days: 30),
    ),
    format: 'yyyy-MM-dd',
  );

  ConvertResultModel convertResult;
  TimeSeriesModel timeSeries;

  List<CoordinatorModel> chartCoordinators = List<CoordinatorModel>();
  double minY;
  double maxY;

  AppError appError;
  bool isLoading;

  String get amountResult => convertResult?.result ?? '-';

  static String from;
  void setFrom(String value) => from = value;

  String to;
  void setTo(String value) => to = value;

  String amount;
  void setAmount(String value) =>
      amount = value.replaceAll('.', '').replaceAll(',', '.');

  Future convert() async {
    final result = await _repository.convert(from, to, amount);
    result.fold((l) => appError = l, (r) => convertResult = r);

    await fetchTimeSeries();
  }

  Future fetchTimeSeries() async {
    chartCoordinators = [];
    final result =
        await _repository.fetchTimeSeries(to, from, startDate, endDate);
    result.fold((l) => appError = l, (r) => timeSeries = r);

    int cont = 1;
    timeSeries.rates.entries.forEach((element) {
      chartCoordinators.add(CoordinatorModel(
        x: cont.toDouble(),
        y: element.value.currency,
      ));
      cont++;
    });

    minY = chartCoordinators[0].y;
    maxY = chartCoordinators[0].y;

    chartCoordinators.forEach((element) {
      if (element.y < minY) minY = element.y;
      if (element.y > maxY) maxY = element.y;
    });
  }
}
