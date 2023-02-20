import 'package:balinasoft_test/features/auth/data/models/auth_data_model.dart';
import 'package:balinasoft_test/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp(AuthDataModel authDataModel);
  Future<UserModel> signIn(AuthDataModel authDataModel);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  @override
  Future<UserModel> signIn(AuthDataModel authDataModel) {}

  @override
  Future<UserModel> signUp(AuthDataModel authDataModel) {}
}
