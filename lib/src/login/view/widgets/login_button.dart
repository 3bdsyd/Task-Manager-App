import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/helper/status_view.dart';
import 'package:todo_app/shared/widgets/custom_button.dart';
import 'package:todo_app/src/login/presenters/login_provider.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginProviderImp>(
      builder: (BuildContext context, LoginProviderImp loginProvider, _) =>
          CustomButtonWidget(
        title: 'Log In',
        onTap: () => loginProvider.postLogin(),
        suffixIcon: loginProvider.statusViews == StatusViews.loading
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator(
                  color: ColorName.white,
                  strokeWidth: 2,
                ),
              )
            : null,
      ),
    );
  }
}
