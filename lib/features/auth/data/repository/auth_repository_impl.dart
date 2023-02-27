import 'package:balinasoft_test/core/exception/exception.dart';
import 'package:balinasoft_test/features/auth/data/datasource/auth_local_datasource.dart';
import 'package:balinasoft_test/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:balinasoft_test/features/auth/data/model/auth_data_model.dart';
import 'package:balinasoft_test/features/auth/data/model/user_model.dart';
import 'package:balinasoft_test/features/auth/domain/repository/auth_repository.dart';
import 'package:balinasoft_test/features/auth/utils/auth_type.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<Either<ServerException, UserModel>> auth(AuthDataModel authData, AuthType authType) async {
    try {
      final user = await _remoteDataSource.auth(authData, authType);
      _localDataSource.saveSignedInUser(user);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerException(message: e.message));
    }
  }

  @override
  Future<Either<CacheException, bool>> isUserSignedIn() async {
    try {
      final isUserSignedIn = await _localDataSource.isUserSignedIn();
      return Right(isUserSignedIn);
    } on ServerException catch (e) {
      return Left(CacheException(message: e.message));
    }
  }

  @override
  Future<Either<CacheException, UserModel>> restoreUser() async {
    try {
      final user = await _localDataSource.restoreUser();
      return Right(user);
    } on ServerException catch (e) {
      return Left(CacheException(message: e.message));
    }
  }
}
