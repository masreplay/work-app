import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:flutter/foundation.dart';
import 'package:work_app/data/network/constants/endpoints.dart';
import 'package:work_app/data/sharedpref/shared_preference_helper.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  @factoryMethod
  Dio provideDio(SharedPreferenceHelper sharedPrefHelper) {
    final dio = Dio();

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            // getting token
            var token = await sharedPrefHelper.authToken;
            debugPrint('network token: $token');
            if (token != null) {
              options.headers["Authorization"] = "Bearer " + token;
            } else {
              options.headers["Authorization"] = "Bearer " + ".";
            }

            return handler.next(options);
          },
        ),
      )
    ;


    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };


    return dio;
  }
}
