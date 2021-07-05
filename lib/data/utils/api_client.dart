import 'dart:io';

import "package:dio/dio.dart";
import 'package:places/data/utils/api_interceptors.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class ApiClient {
  late Dio dio;
  late Client httpClient;

  static final _client = ApiClient._internal();

  ApiClient._internal();

  factory ApiClient({required Dio dioClient}) {
    _client.dio = dioClient;
    _client.dio.options.baseUrl = dotenv.env['BASE_URL']!;
    _client.dio.options.connectTimeout = 5000;
    _client.dio.options.sendTimeout = 5000;
    _client.dio.options.receiveTimeout = 5000;
    _client.dio.options.responseType = ResponseType.json;
    _client.dio.interceptors.add(ApiInterceptors());
    return _client;
  }
}


