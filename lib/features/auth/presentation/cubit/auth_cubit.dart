import 'package:balinasoft_test/core/constants/localization_constants.dart';
import 'package:balinasoft_test/features/auth/data/model/auth_data_model.dart';
import 'package:balinasoft_test/features/auth/data/model/user_model.dart';
import 'package:balinasoft_test/features/auth/domain/repository/auth_repository.dart';
import 'package:balinasoft_test/features/auth/utils/auth_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(const AuthState());

  final AuthRepository _authRepository;

  Future<UserModel?> _auth(AuthDataModel authData, AuthType authType) async {
    emit(state.copyWith(waitingForResponse: true));
    final result = await _authRepository.auth(authData, authType);
    emit(state.copyWith(waitingForResponse: false));
    result.fold(
      (exception) {
        debugPrint(exception.message);
        emit(state.copyWith(errorMessage: exception.message));
      },
      (user) {
        debugPrint('Retrieved user: ${user.toString()}');
        emit(state.copyWith(user: user));
      },
    );
    return null;
  }

  void logIn(bool isUserDataValid, AuthDataModel authData) {
    if (isUserDataValid) {
      _auth(authData, AuthType.login);
    }
  }

  void signUp(bool isUserDataValid, AuthDataModel authData) {
    if (isUserDataValid) {
      if (authData.password == authData.confirmPassword) {
        _auth(authData, AuthType.register);
      } else {
        emit(state.copyWith(errorMessage: LocalizationConstants.validatorComparePasswords));
        emit(state.copyWith(errorMessage: null));
      }
    }
  }

  String? validateLogin(String? value) {
    if (value == null || value.isEmpty) {
      return LocalizationConstants.validatorLogin;
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocalizationConstants.validatorPassword;
    } else {
      return null;
    }
  }

  bool isNeedToAuth() {
    return true;
  }

  void mockAuth(String token) {
    emit(state.copyWith(user: UserModel(userId: 1502, login: 'abobus', token: token)));
  }
}
