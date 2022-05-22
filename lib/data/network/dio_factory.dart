import 'package:afalmi/app/app_prefrences.dart';
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
  final AppPrefrences _appSharedPrefrences;

  DioFactory(this._appSharedPrefrences);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      applicationJson: applicationJson,
      authroization: "token",
      accept: accept,
      defaultLanguage: await _appSharedPrefrences.getAppLanguage()
    };
    dio.options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        headers: headers,
        receiveTimeout: AppConstants.apiTimeOut,
        sendTimeout: AppConstants.apiTimeOut);

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseHeader: true));
    }
    return dio;
  }
}
