import 'package:balinasoft_test/core/constants.dart';
import 'package:balinasoft_test/core/exception/exception.dart';
import 'package:balinasoft_test/features/auth/data/models/auth_data_model.dart';
import 'package:balinasoft_test/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

const String _signUpEndpoint = '/api/account/signup';
const String _signInEndpoint = '/api/account/signin';

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp(AuthDataModel authDataModel);
  Future<UserModel> signIn(AuthDataModel authDataModel);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._httpClient);

  final http.Client _httpClient;

  @override
  Future<UserModel> signUp(AuthDataModel authDataModel) async {
    try {
      final uri = Uri.http(AppConstants.baseURL, _signUpEndpoint);
      final response = await _httpClient.get(uri);
      return UserModel.fromJson(response.body);
    } catch (e) {
      throw ServerException(message: 'AuthRemoteDataSource signUp() exception: ${e.runtimeType}');
    }
  }

  @override
  Future<UserModel> signIn(AuthDataModel authDataModel) async {
    try {
      final uri = Uri.http(AppConstants.baseURL, _signInEndpoint);
      final response = await _httpClient.get(uri);
      return UserModel.fromJson(response.body);
    } catch (e) {
      throw ServerException(message: 'AuthRemoteDataSource signIn() exception: ${e.runtimeType}');
    }
  }
}
