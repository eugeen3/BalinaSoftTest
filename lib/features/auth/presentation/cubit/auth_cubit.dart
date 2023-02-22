import 'package:balinasoft_test/features/auth/data/models/user_model.dart';
import 'package:balinasoft_test/features/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthLoginState> {
  AuthCubit(this._authRepository) : super(const AuthLoginState());

  final AuthRepository _authRepository;
}
