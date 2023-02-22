// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  factory AuthDataModel.fromMap(Map<String, dynamic> map) {
    return AuthDataModel(
      login: map['login'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirmPassword'] != null ? map['confirmPassword'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthDataModel.fromJson(String source) =>
      AuthDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [login, password, confirmPassword];
}
