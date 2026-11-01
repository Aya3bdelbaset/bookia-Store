import 'package:bookia/core/networking/api_endpoint.dart';
import 'package:bookia/core/services/locale/local_helper.dart';
import 'package:bookia/core/utils/const_app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {
          "accept": "application/json",
          "content-Type": "application/json",
        },
      ),
    );

    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = LocalHelper.prefs?.get(AppConst.userToken);

          if (token != null && token.toString().isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          } else {
            options.headers.remove('Authorization');
            debugPrint('AUTH WARNING: Token is missing');
          }

          handler.next(options);
        },
      ),
    );

    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );
  }
}
