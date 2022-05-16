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
}

class ResponseCode {
  // global Status Codes
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int internalServerError = 500;

  //local Status codes
  static const int connectTimeOut = -1;
  static const int cancel = -2;
  static const int recieveTimeOut = -3;
  static const int sendTimeOut = -4;
  static const int cachError = -5;
  static const int noInternetConnection = -6;
  static const int unknown = -7;
}

class ResponseMessage {
  // global Status Codes
  static const String success = 'success';
  static const String noContent = 'success';
  static const String badRequest = 'bad request';
  static const String unauthorized ='unauthroized';
  static const String forbidden = 'forbidden';
  static const String internalServerError = 'serverError';

  //local Status codes
  static const String connectTimeOut = 'connectTimeOut';
  static const String cancel = 'cancel';
  static const String recieveTimeOut = 'recievetimeOut';
  static const String sendTimeOut = 'sendTimeOut';
  static const String cachError = 'cachError';
  static const String noInternetConnection ='noInternetConnection';;
  static const String unknown ="unknown";
}
