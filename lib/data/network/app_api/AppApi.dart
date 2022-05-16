import 'package:afalmi/data/responses/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'AppApi.g.dart';

@RestApi(baseUrl: "https://z8rwq.mocklab.io/")
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("customer/login")
  Future<AuthResponse> login(
      @Field("email") String email, @Field("password") String password);
}
