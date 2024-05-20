import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/helper/failures_handling.dart';
import 'package:todo_app/core/helper/shared_preferences.dart';
import 'package:todo_app/core/helper/status_view.dart';
import 'package:todo_app/core/router/app_router.gr.dart';
import 'package:todo_app/core/utils/constants/app_key.dart';
import 'package:todo_app/src/login/model/login_model.dart';
import 'package:todo_app/src/login/repository/login_repo.dart';

// Abstract class defining the LoginProvider interface
abstract class LoginProvider extends ChangeNotifier {
  void toggleShowPassword(); // Toggle visibility of password
  Future postLogin(); // Handle login process
}

// Implementation of the LoginProvider
class LoginProviderImp extends LoginProvider {
  final GlobalKey<FormState> formsKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final LoginRepoImp _loginRepoImp = LoginRepoImp();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  bool isHidePassword = true; // Password visibility state

  // Toggle the visibility of the password field
  @override
  void toggleShowPassword() {
    isHidePassword = !isHidePassword;
    notifyListeners();
  }

  StatusViews statusViews = StatusViews.initial; // Initial status view
  LoginModel? loginModel; // Login model instance

  // Handle login process
  @override
  Future postLogin() async {
    // Validate the form and check if already loading
    if (!formsKey.currentState!.validate() ||
        statusViews == StatusViews.loading) return;

    statusViews = StatusViews.loading; // Set status to loading
    notifyListeners();

    // Attempt to login with the provided username and password
    await _loginRepoImp
        .postLogin(username.text.trim(), password.text.trim())
        .then((result) async {
      if (result is Failures) {
        // If login fails, show a snackbar with the error message
        scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text(result.errMessage),
          ),
        );
      } else if (result is LoginModel) {
        // If login is successful, update the login model and navigate to HomeView
        loginModel = result;

        await SharedPref.setString(AppKey.userId, result.id.toString());

        scaffoldKey.currentContext!.router.replaceAll([
          const HomeView(),
        ]);
      }
    });

    statusViews = StatusViews.initial; // Reset status to initial
    notifyListeners();
  }
}
