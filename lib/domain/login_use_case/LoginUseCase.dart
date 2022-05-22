import 'package:afalmi/data/network/failure.dart';
import 'package:afalmi/data/network/requests.dart';
import 'package:afalmi/domain/models.dart';
import 'package:afalmi/domain/repository/repository.dart';
import 'package:afalmi/domain/use_case/BaseUseCase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(input) async =>
      _repository.login(LoginRequest(input.email, input.password));
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
