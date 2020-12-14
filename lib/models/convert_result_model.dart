import 'dart:convert';

class ConvertResultModel {
  final Motd motd;
  final bool success;
  final Query query;
  final Info info;
  final bool historical;
  final DateTime date;
  final String result;

  ConvertResultModel({
    this.motd,
    this.success,
    this.query,
    this.info,
    this.historical,
    this.date,
    this.result,
  });

  factory ConvertResultModel.fromJson(String str) =>
      ConvertResultModel.fromMap(json.decode(str));

  factory ConvertResultModel.fromMap(Map<String, dynamic> json) =>
      ConvertResultModel(
        motd: Motd.fromMap(json["motd"]),
        success: json["success"],
        query: Query.fromMap(json["query"]),
        info: Info.fromMap(json["info"]),
        historical: json["historical"],
        date: DateTime.parse(json["date"]),
        result: json["result"],
      );
}

class Info {
  final String rate;

  Info({
    this.rate,
  });

  factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

  factory Info.fromMap(Map<String, dynamic> json) => Info(
        rate: json["rate"],
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

class Query {
  final String from;
  final String to;
  final double amount;

  Query({
    this.from,
    this.to,
    this.amount,
  });

  factory Query.fromJson(String str) => Query.fromMap(json.decode(str));

  factory Query.fromMap(Map<String, dynamic> json) => Query(
        from: json["from"],
        to: json["to"],
        amount: json["amount"].toDouble(),
      );
}
