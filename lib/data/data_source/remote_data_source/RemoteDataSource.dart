import 'package:afalmi/data/network/app_api/AppApi.dart';
import 'package:afalmi/data/network/requests.dart';
import 'package:afalmi/data/responses/login_response.dart';

abstract class RemoteDataSource {
  Future<AuthResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppServiceClient appServiceClient;

  RemoteDataSourceImpl(this.appServiceClient);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) =>
      appServiceClient.login(loginRequest.email, loginRequest.password);
}
