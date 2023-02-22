// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

class AuthLoginState extends Equatable {
  const AuthLoginState({
    this.login,
    this.password,
    bool? waitingForResponse,
    this.user,
  }) : waitingForResponse = waitingForResponse ?? false;

  final String? login;
  final String? password;
  final bool waitingForResponse;
  final UserModel? user;

  AuthLoginState copyWith({
    String? login,
    String? password,
    bool? waitingForResponse,
    UserModel? user,
  }) {
    return AuthLoginState(
      login: login ?? this.login,
      password: password ?? this.password,
      waitingForResponse: waitingForResponse ?? this.waitingForResponse,
      user: user ?? this.user,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [login, password, waitingForResponse, user];
}

class AuthRegisterState extends AuthLoginState {
  const AuthRegisterState({
    super.login,
    super.password,
    super.waitingForResponse,
    super.user,
    this.confirmPassword,
  });

  final String? confirmPassword;

  @override
  AuthRegisterState copyWith({
    String? login,
    String? password,
    bool? waitingForResponse,
    UserModel? user,
    String? confirmPassword,
  }) {
    return AuthRegisterState(
      login: login ?? this.login,
      password: password ?? this.password,
      waitingForResponse: waitingForResponse ?? this.waitingForResponse,
      user: user ?? this.user,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [login, password, waitingForResponse, user, confirmPassword];
}
