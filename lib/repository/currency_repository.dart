import 'package:currency_app/core/constants.dart';
import 'package:currency_app/models/app_error.dart';
import 'package:currency_app/models/convert_result_model.dart';
import 'package:currency_app/models/symbol_result_model.dart';
import 'package:currency_app/models/time_series_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CurrencyRepository {
  final _dio = Dio(kBaseOptions);

  Future<Either<AppError, ConvertResultModel>> convert(
      String from, String to, String amount) async {
    try {
      final response =
          await _dio.get('convert?from=$from&to=$to&amount=$amount&places=2');
      final model = ConvertResultModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error != null) {
        return Left(AppRepositoryError(error.message));
      } else {
        return Left(AppRepositoryError('Connection Failed'));
      }
    }
  }

  Future<Either<AppError, SymbolResultModel>> fetchAllCurrencies() async {
    try {
      final response = await _dio.get('symbols');
      final model = SymbolResultModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error != null) {
        return Left(AppRepositoryError(error.message));
      } else {
        return Left(AppRepositoryError('Connection Failed'));
      }
    }
  }

  Future<Either<AppError, TimeSeriesModel>> fetchTimeSeries(
    String base,
    String symbol,
    String startDate,
    String endDate,
  ) async {
    try {
      final response = await _dio.get(
          'timeseries?start_date=$startDate&end_date=$endDate&base=$base&symbols=$symbol');
      final model = TimeSeriesModel.fromMap(response.data);
      return Right(model);
    } on DioError catch (error) {
      if (error != null) {
        return Left(AppRepositoryError(error.message));
      } else {
        return Left(AppRepositoryError('Connection Failed'));
      }
    }
  }
}
