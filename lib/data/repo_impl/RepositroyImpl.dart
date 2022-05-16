import 'package:afalmi/data/data_source/remote_data_source/RemoteDataSource.dart';
import 'package:afalmi/data/mapper/CustomerResponseMapper.dart';
import 'package:afalmi/data/network/error_handler.dart';
import 'package:afalmi/data/network/failure.dart';
import 'package:afalmi/data/network/network_info.dart';
import 'package:afalmi/data/network/requests.dart';
import 'package:afalmi/data/responses/login_response.dart';
import 'package:afalmi/domain/models.dart';
import 'package:afalmi/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepoImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepoImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalCodes.success) {
          return Right(response.toDomain());
        } else {
          return Left(
              Failure(ApiInternalCodes.failure, response.message.toString()));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handle(error)
            .failure);
      }
    }

    else {
      return Left(DataSourceError.noInternetConnection.getFailure());
    }
  }
}}
