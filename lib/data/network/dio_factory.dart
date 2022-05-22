import 'package:afalmi/presentation/app_resources/constants_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authroization = "authorization";
const String defaultLanguage = "language";

class DioFactory {
  Future<Dio> getDio() async {
    Dio dio = Dio();

    int _timeeout = 60 * 1000;

    Map<String, String> headers = {
      applicationJson: applicationJson,
      authroization: "token",
      accept: accept,
      defaultLanguage: 'en'
    };
    dio.options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        headers: headers,
        receiveTimeout: _timeeout,
        sendTimeout: _timeeout);

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }
    return dio;
  }
}
