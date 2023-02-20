import 'package:balinasoft_test/core/exception/exception.dart';
import 'package:balinasoft_test/features/auth/data/models/auth_data_model.dart';
import 'package:balinasoft_test/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<ServerException, UserModel>> signUp(AuthDataModel authData);
  Future<Either<ServerException, UserModel>> signIn(AuthDataModel authData);
  Future<Either<CacheException, bool>> isUserSignedIn();
  Future<Either<CacheException, UserModel>> restoreUser();
}
