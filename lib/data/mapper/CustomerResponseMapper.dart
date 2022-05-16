import 'package:afalmi/data/responses/login_response.dart';
import 'package:afalmi/domain/models.dart';
import 'package:afalmi/app/extension.dart';
import 'package:afalmi/presentation/app_resources/constants_manager.dart';

extension CustomerResponseMapper on CustomerResponse {
  Customer toDomain() => Customer(
      id ?? AppConstants.empty,
      name ?? AppConstants.empty,
      numOfNotifications?.orZero() ?? AppConstants.zero);
}

extension CustomerAuthenticationMapper on AuthResponse {
  Authentication toDomain() =>
      Authentication(customerResponse?.toDomain() ?? Customer('', '', 0));
}
