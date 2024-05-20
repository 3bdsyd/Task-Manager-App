import 'package:todo_app/core/helper/check_forms.dart';

class FormsValidate {
  static String? getUsernameValidate(String username) {
    if (!CheckForms.checkEmpty(username)) return 'Required field *';

    if (!CheckForms.checkUsernameRegex(username)) return 'Username is invalid';

    return null;
  }

  static String? getPasswordValidate(String password) {
    if (!CheckForms.checkEmpty(password)) return 'Required field *';

    if (password.length < 6) {
      return 'Password is invalid';
    }

    return null;
  }
}
