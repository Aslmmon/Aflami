import 'package:afalmi/data/network/failure.dart';
import 'package:afalmi/data/network/requests.dart';
import 'package:afalmi/data/responses/login_response.dart';
import 'package:afalmi/domain/models.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
