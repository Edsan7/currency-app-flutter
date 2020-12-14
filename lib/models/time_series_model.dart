import 'dart:convert';
import 'package:currency_app/controllers/homepage_controller.dart';

class TimeSeriesModel {
  final Motd motd;
  final bool success;
  final bool timeseries;
  final String base;
  final DateTime startDate;
  final DateTime endDate;
  final Map<String, Rate> rates;

  TimeSeriesModel({
    this.motd,
    this.success,
    this.timeseries,
    this.base,
    this.startDate,
    this.endDate,
    this.rates,
  });

  factory TimeSeriesModel.fromJson(String str) =>
      TimeSeriesModel.fromMap(json.decode(str));

  factory TimeSeriesModel.fromMap(Map<String, dynamic> json) => TimeSeriesModel(
        motd: Motd.fromMap(json["motd"]),
        success: json["success"],
        timeseries: json["timeseries"],
        base: json["base"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, Rate>(k, Rate.fromMap(v))),
      );
}

class Motd {
  final String msg;
  final String url;

  Motd({
    this.msg,
    this.url,
  });

  factory Motd.fromJson(String str) => Motd.fromMap(json.decode(str));

  factory Motd.fromMap(Map<String, dynamic> json) => Motd(
        msg: json["msg"],
        url: json["url"],
      );
}

class Rate {
  final double currency;

  Rate({
    this.currency,
  });

  factory Rate.fromJson(String str) => Rate.fromMap(json.decode(str));
  
  factory Rate.fromMap(Map<String, dynamic> json) => Rate(
        currency: json[HomepageController.from].toDouble(),
      );
}
