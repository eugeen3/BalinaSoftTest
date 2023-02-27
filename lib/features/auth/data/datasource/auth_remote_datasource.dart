import 'dart:convert';

import 'package:balinasoft_test/core/constants/http_constants.dart';
import 'package:balinasoft_test/core/constants/localization_constants.dart';
import 'package:balinasoft_test/core/exception/exception.dart';
import 'package:balinasoft_test/features/auth/data/model/auth_data_model.dart';
import 'package:balinasoft_test/features/auth/data/model/user_model.dart';
import 'package:balinasoft_test/features/auth/utils/auth_type.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<UserModel> auth(AuthDataModel authData, AuthType authType);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._httpClient);

  final http.Client _httpClient;

  static const Map<String, String> headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json'
  };
  static const String _signUpEndpoint = '/api/account/signup';
  static const String _signInEndpoint = '/api/account/signin';

  @override
  Future<UserModel> auth(AuthDataModel authData, AuthType authType) async {
    try {
      final uri = Uri.https(
        HttpConstants.baseURL,
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

      if (response.statusCode == HttpConstants.successHttpCode) {
        return UserModel.fromResponseJson(response.body);
      } else {
        final error = jsonDecode(response.body)['error'];
        throw ServerException(message: '${LocalizationConstants.errorAuth}: $error');
      }
    } catch (e) {
      throw ServerException(message: 'AuthRemoteDataSource signUp() exception: $e');
    }
  }
}
