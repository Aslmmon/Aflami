import 'package:afalmi/data/network/failure.dart';
import 'package:dio/dio.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      failure = _handleError(error);
    } else {
      failure = DataSourceError.defaultError.getFailure();
    }
  }
}

Failure _handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectTimeout:
      return DataSourceError.connectionTimeOut.getFailure();
    case DioErrorType.sendTimeout:
      return DataSourceError.sendTimeOut.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSourceError.recieveTimeOut.getFailure();

    case DioErrorType.response:

      /// here i have a response with status code / status message from Api
      if (error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.statusMessage ?? '');
      } else {
        return DataSourceError.defaultError.getFailure();
      }
    case DioErrorType.cancel:
      return DataSourceError.cancel.getFailure();
    case DioErrorType.other:
      return DataSourceError.defaultError.getFailure();
  }
}

enum DataSourceError {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectionTimeOut,
  cancel,
  recieveTimeOut,
  sendTimeOut,
  cachError,
  noInternetConnection,
  defaultError,
}

extension DataSourceErrorExt on DataSourceError {
  Failure getFailure() {
    switch (this) {
      case DataSourceError.success:
        return Failure(ResponseCode.success, ResponseMessage.success);
      case DataSourceError.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);
      case DataSourceError.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case DataSourceError.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case DataSourceError.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case DataSourceError.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case DataSourceError.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
      case DataSourceError.connectionTimeOut:
        return Failure(
            ResponseCode.connectTimeOut, ResponseMessage.connectTimeOut);
      case DataSourceError.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case DataSourceError.recieveTimeOut:
        return Failure(
            ResponseCode.recieveTimeOut, ResponseMessage.recieveTimeOut);
      case DataSourceError.sendTimeOut:
        return Failure(ResponseCode.sendTimeOut, ResponseMessage.sendTimeOut);
      case DataSourceError.cachError:
        return Failure(ResponseCode.cachError, ResponseMessage.cachError);
      case DataSourceError.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
      case DataSourceError.defaultError:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.noInternetConnection);
    }
  }
}

class ResponseCode {
  // global Status Codes
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int internalServerError = 500;
  static const int notFound = 404;

  //local Status codes
  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int recieveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cachError = -5;
  static const int noInternetConnection = -6;
  static const int unknown = -7;
  static const int defaultError = -8;
}

class ResponseMessage {
  // global Status Codes
  static const String success = 'success';
  static const String noContent = 'success';
  static const String badRequest = 'bad request';
  static const String unauthorized = 'unauthroized';
  static const String forbidden = 'forbidden';
  static const String internalServerError = 'serverError';

  //local Status codes
  static const String connectTimeOut = 'connectTimeOut';
  static const String cancel = 'cancel';
  static const String recieveTimeOut = 'recievetimeOut';
  static const String sendTimeOut = 'sendTimeOut';
  static const String cachError = 'cachError';
  static const String noInternetConnection = 'noInternetConnection';
  static const String notFound = 'notFound';
  static const String defaultError = "defaultError";

  static const String unknown = "unknown";
}

class ApiInternalCodes {
  static const int success = 0;
  static const int failure = 1;
}
