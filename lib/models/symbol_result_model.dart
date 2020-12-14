import 'dart:convert';

class SymbolResultModel {
  final MotdModel motd;
  final bool success;
  final Map<String, SymbolModel> symbols;

  SymbolResultModel({
    this.motd,
    this.success,
    this.symbols,
  });

  factory SymbolResultModel.fromJson(String str) =>
      SymbolResultModel.fromMap(json.decode(str));

  factory SymbolResultModel.fromMap(Map<String, dynamic> json) =>
      SymbolResultModel(
        motd: MotdModel.fromMap(json["motd"]),
        success: json["success"],
        symbols: Map.from(json["symbols"]).map(
            (k, v) => MapEntry<String, SymbolModel>(k, SymbolModel.fromMap(v))),
      );

}

class MotdModel {
  final String msg;
  final String url;

  MotdModel({
    this.msg,
    this.url,
  });

  factory MotdModel.fromJson(String str) => MotdModel.fromMap(json.decode(str));

  factory MotdModel.fromMap(Map<String, dynamic> json) => MotdModel(
        msg: json["msg"],
        url: json["url"],
      );
}

class SymbolModel {
  final String description;
  final String code;

  SymbolModel({
    this.description,
    this.code,
  });

  factory SymbolModel.fromJson(String str) =>
      SymbolModel.fromMap(json.decode(str));


  factory SymbolModel.fromMap(Map<String, dynamic> json) => SymbolModel(
        description: json["description"],
        code: json["code"],
      );
}
