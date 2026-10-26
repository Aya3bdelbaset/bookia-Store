
import 'package:bookia/core/networking/api_endpoint.dart';
import 'package:dio/dio.dart';

class DioFactory {
  static Dio? dio;
  static inti() {
    dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
  }
}