import 'package:balinasoft_test/core/constants/localization_constants.dart';
import 'package:balinasoft_test/core/exception/exception.dart';
import 'package:balinasoft_test/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<bool> isUserSignedIn();
  Future<UserModel> restoreUser();
  Future<void> saveSignedInUser(UserModel user);
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  AuthLocalDataSourceImpl(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  static const String _isUserSignedIn = 'isUserSignedIn';
  static const String _user = 'user';

  @override
  Future<bool> isUserSignedIn() async {
    try {
      final isUserSignedIn = _sharedPreferences.getBool(_isUserSignedIn);
      if (isUserSignedIn != null) {
        return isUserSignedIn;
      }
      return false;
    } catch (e) {
      throw CacheException(message: 'AuthLocalDataSource isUserSignedIn() exception: $e');
    }
  }

  @override
  Future<UserModel> restoreUser() async {
    try {
      final user = _sharedPreferences.getString(_user);
      if (user != null) {
        return UserModel.fromResponseJson(user);
      } else {
        throw CacheException(message: LocalizationConstants.errorRestorUser);
      }
    } catch (e) {
      throw CacheException(message: 'AuthLocalDataSource restoreUser() exception: $e');
    }
  }

  @override
  Future<void> saveSignedInUser(UserModel user) async {
    try {
      _sharedPreferences.setString(_user, user.toJson());
    } catch (e) {
      throw CacheException(message: 'AuthLocalDataSource restoreUser() exception: $e');
    }
  }
}
