import 'package:todo_app/core/helper/failures_handling.dart';
import 'package:todo_app/core/network/crud.dart';
import 'package:todo_app/core/utils/constants/app_api.dart';
import 'package:todo_app/src/login/model/login_model.dart';

abstract class LoginRepo {
  Future postLogin(String username, String password);
}

class LoginRepoImp extends LoginRepo {
  @override
  Future postLogin(String username, String password) async {
    try {
      final result = await Crud().post(url: AppApi.login, body: {
        'username': username,
        'password': password,
      });
      return result.fold(
        (failure) => failure,
        (login) => LoginModel.fromJson(login),
      );
    } catch (_) {
      return Failures(errMessage: 'An error occurred, try again');
    }
  }
}
