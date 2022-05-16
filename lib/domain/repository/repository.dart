import 'package:afalmi/data/network/failure.dart';
import 'package:afalmi/data/network/requests.dart';
import 'package:afalmi/data/responses/login_response.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, AuthResponse>> login(LoginRequest loginRequest);
}
