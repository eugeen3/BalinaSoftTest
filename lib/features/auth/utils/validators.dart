abstract class AuthValidators {
  static String? validateLogin(String? value) {
    if (value == null || value.isEmpty) {
      return 'Login must not be empty';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password must not be empty';
    } else {
      return null;
    }
  }
}
