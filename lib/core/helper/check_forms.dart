import 'package:todo_app/core/utils/constants/app_regular_exp.dart';

class CheckForms {
  static bool checkUsernameRegex(String value) {
    final regex = RegExp(
      AppRegularExpressions.usernameRegExp,
      caseSensitive: false,
    );
    return regex.hasMatch(value);
  }

  static bool checkPasswordRegex(String value) {
    final regex = RegExp(
      AppRegularExpressions.passwordRegExp,
      caseSensitive: false,
    );
    return regex.hasMatch(value);
  }

  static bool checkEmpty(String value) {
    if (value.isEmpty) return false;
    return true;
  }
}
