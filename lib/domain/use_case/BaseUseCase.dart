import 'package:afalmi/data/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUseCase<In, out> {
  Future<Either<Failure, out>> execute(In input);
}
