// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class AuthDataModel extends Equatable {
  const AuthDataModel({
    required this.login,
    required this.password,
    this.confirmPassword,
  });

  final String login;
  final String password;
  final String? confirmPassword;

  AuthDataModel copyWith({
    String? login,
    String? password,
    String? confirmPassword,
  }) {
    return AuthDataModel(
      login: login ?? this.login,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [login, password, confirmPassword];
}
