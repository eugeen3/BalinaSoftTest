import 'package:balinasoft_test/core/exception/exception.dart';
import 'package:balinasoft_test/features/auth/data/model/auth_data_model.dart';
import 'package:balinasoft_test/features/auth/data/model/user_model.dart';
import 'package:balinasoft_test/features/auth/utils/auth_type.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<ServerException, UserModel>> auth(AuthDataModel authData, AuthType authType);
  Future<Either<CacheException, bool>> isUserSignedIn();
  Future<Either<CacheException, UserModel>> restoreUser();
}
