import 'dart:convert';

import 'package:balinasoft_test/core/constants/app_constants.dart';
import 'package:balinasoft_test/core/constants/localization_constants.dart';
import 'package:balinasoft_test/core/exception/exception.dart';
import 'package:balinasoft_test/features/auth/data/models/auth_data_model.dart';
import 'package:balinasoft_test/features/auth/data/models/user_model.dart';
import 'package:balinasoft_test/features/auth/utils/auth_type.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<UserModel> auth(AuthDataModel authData, AuthType authType);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._httpClient);

  final http.Client _httpClient;

  static const String _signUpEndpoint = '/api/account/signup';
  static const String _signInEndpoint = '/api/account/signin';
  static const Map<String, String> headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json'
  };

  @override
  Future<UserModel> auth(AuthDataModel authData, AuthType authType) async {
    try {
      final uri = Uri.https(
        AppConstants.baseURL,
        authType == AuthType.register ? _signUpEndpoint : _signInEndpoint,
      );
      final body = jsonEncode({
        'login': authData.login,
        'password': authData.password,
      });
      final response = await _httpClient.post(
        uri,
        headers: headers,
        body: body,
      );

      if (response.statusCode == AppConstants.successHttpCode) {
        return UserModel.fromJson(response.body);
      } else {
        final error = jsonDecode(response.body)['error'];
        throw ServerException(message: '${LocalizationConstants.errorAuth}: $error');
      }
    } catch (e) {
      throw ServerException(message: 'AuthRemoteDataSource signUp() exception: $e');
    }
  }
}
