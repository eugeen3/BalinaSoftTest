import 'dart:convert';

import 'package:balinasoft_test/core/constants/app_constants.dart';
import 'package:balinasoft_test/core/constants/localization_constants.dart';
import 'package:balinasoft_test/core/exception/exception.dart';
import 'package:balinasoft_test/features/auth/data/models/auth_data_model.dart';
import 'package:balinasoft_test/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<UserModel> signUp(AuthDataModel authData);
  Future<UserModel> signIn(AuthDataModel authData);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._httpClient);

  final http.Client _httpClient;

  static const String _signUpEndpoint = '/api/account/signup';
  static const String _signInEndpoint = '/api/account/signin';

  @override
  Future<UserModel> signUp(AuthDataModel authData) async {
    try {
      final uri = Uri.http(AppConstants.baseURL, _signUpEndpoint);
      final response = await _httpClient.get(uri);
      if (response.statusCode == AppConstants.successHttpCode) {
        return UserModel.fromJson(response.body);
      } else {
        final error = jsonDecode(response.body)['error'];
        throw ServerException(message: '${LocalizationConstants.authError}: $error');
      }
    } catch (e) {
      throw ServerException(message: 'AuthRemoteDataSource signUp() exception: $e');
    }
  }

  @override
  Future<UserModel> signIn(AuthDataModel authData) async {
    try {
      final uri = Uri.http(AppConstants.baseURL, _signInEndpoint);
      final response = await _httpClient.get(uri);
      if (response.statusCode == AppConstants.successHttpCode) {
        return UserModel.fromJson(response.body);
      } else {
        final error = jsonDecode(response.body)['error'];
        throw ServerException(message: '${LocalizationConstants.authError}: $error');
      }
    } catch (e) {
      throw ServerException(message: 'AuthRemoteDataSource signIn() exception: $e');
    }
  }
}
