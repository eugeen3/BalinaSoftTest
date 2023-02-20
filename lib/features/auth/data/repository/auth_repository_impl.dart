import 'package:balinasoft_test/core/exception/exception.dart';
import 'package:balinasoft_test/features/auth/data/datasource/auth_local_datasource.dart';
import 'package:balinasoft_test/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:balinasoft_test/features/auth/data/models/auth_data_model.dart';
import 'package:balinasoft_test/features/auth/data/models/user_model.dart';
import 'package:balinasoft_test/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  Future<Either<ServerException, UserModel>> signUp(AuthDataModel authData) async {
    try {
      final user = await _remoteDataSource.signUp(authData);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerException(message: e.message));
    }
  }

  @override
  Future<Either<ServerException, UserModel>> signIn(AuthDataModel authData) async {
    try {
      final user = await _remoteDataSource.signIn(authData);
      return Right(user);
    } on ServerException catch (e) {
      return Left(ServerException(message: e.message));
    }
  }

  @override
  Future<Either<CacheException, bool>> isUserSignedIn() {
    throw UnimplementedError();
  }

  @override
  Future<Either<CacheException, UserModel>> restoreUser() {
    throw UnimplementedError();
  }
}
