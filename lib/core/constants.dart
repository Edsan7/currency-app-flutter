import 'package:dio/dio.dart';

final kBaseOptions = BaseOptions(
  baseUrl: 'https://api.exchangerate.host/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
  contentType: 'application/json; charset=utf-8'
);