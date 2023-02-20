import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthDataModel extends Equatable {
  const AuthDataModel({
    required this.login,
    required this.password,
  });

  final String login;
  final String password;

  AuthDataModel copyWith({
    String? login,
    String? password,
  }) {
    return AuthDataModel(
      login: login ?? this.login,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'password': password,
    };
  }

  factory AuthDataModel.fromMap(Map<String, dynamic> map) {
    return AuthDataModel(
      login: map['login'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthDataModel.fromJson(String source) =>
      AuthDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [login, password];
}
