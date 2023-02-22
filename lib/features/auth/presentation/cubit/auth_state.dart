// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

class AuthLoginState extends Equatable {
  const AuthLoginState({
    this.login,
    this.password,
    bool? waitingForResponse,
    this.errorMessage,
  }) : waitingForResponse = waitingForResponse ?? false;

  final String? login;
  final String? password;
  final bool waitingForResponse;
  final String? errorMessage;

  AuthLoginState copyWith({
    String? login,
    String? password,
    bool? waitingForResponse,
    String? errorMessage,
  }) {
    return AuthLoginState(
      login: login ?? this.login,
      password: password ?? this.password,
      waitingForResponse: waitingForResponse ?? this.waitingForResponse,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [login, password, waitingForResponse, errorMessage];
}

class AuthRegisterState extends AuthLoginState {
  const AuthRegisterState({
    super.login,
    super.password,
    super.waitingForResponse,
    this.confirmPassword,
    super.errorMessage,
  });

  final String? confirmPassword;

  @override
  AuthRegisterState copyWith({
    String? login,
    String? password,
    bool? waitingForResponse,
    String? confirmPassword,
    String? errorMessage,
  }) {
    return AuthRegisterState(
      login: login ?? this.login,
      password: password ?? this.password,
      waitingForResponse: waitingForResponse ?? this.waitingForResponse,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [login, password, waitingForResponse, confirmPassword];
}
