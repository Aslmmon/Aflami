import 'package:afalmi/data/responses/login_response.dart';
import 'package:afalmi/presentation/app_resources/constants_manager.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'AppApi.g.dart';

@RestApi(baseUrl: AppConstants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("customer/login")
  Future<AuthResponse> login(
      @Field("email") String email, @Field("password") String password);
}
