import "package:dio/dio.dart";
import 'package:places/data/utils/api_interceptors.dart';

const String baseApiUrl = "https://test-backend-flutter.surfstudio.ru/";

abstract class ApiClient{
  Future<Dio> init();
}

class DioClient implements ApiClient {
  Future<Dio> init() async {
    Dio _dio = Dio();
    _dio.interceptors.add(ApiInterceptors());
    _dio.options.baseUrl = baseApiUrl;
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
    _dio.options.sendTimeout = 5000;
    _dio.options.responseType = ResponseType.json;
    return _dio;
  }
}
