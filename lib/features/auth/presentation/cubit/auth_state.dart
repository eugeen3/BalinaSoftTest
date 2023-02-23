part of 'app_cubit.dart';

class AuthState extends Equatable {
  const AuthState({
    this.user,
    bool? waitingForResponse,
    this.errorMessage,
  }) : waitingForResponse = waitingForResponse ?? false;

  final UserModel? user;
  final bool waitingForResponse;
  final String? errorMessage;

  AuthState copyWith({
    UserModel? user,
    bool? waitingForResponse,
    String? errorMessage,
  }) {
    return AuthState(
      user: user ?? this.user,
      waitingForResponse: waitingForResponse ?? this.waitingForResponse,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [user, waitingForResponse, errorMessage];
}
