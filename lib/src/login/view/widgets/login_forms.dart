import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/helper/status_view.dart';
import 'package:todo_app/core/utils/validators/forms_validators.dart';
import 'package:todo_app/shared/widgets/custom_text_field.dart';
import 'package:todo_app/src/login/presenters/login_provider.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: Provider.of<LoginProviderImp>(context).formsKey,
      child: Consumer<LoginProviderImp>(
        builder: (BuildContext context, LoginProviderImp loginProvider, _) =>
            Column(
          children: [
            CustomTextField(
              prefixIcon: Assets.icons.email,
              hintText: 'Enter your username here',
              controller: Provider.of<LoginProviderImp>(context).username,
              label: 'Username',
              autofillHints: const [AutofillHints.name],
              textInputType: TextInputType.name,
              validator: (email) => FormsValidate.getUsernameValidate(email),
              enabled: loginProvider.statusViews != StatusViews.loading,
            ),
            const SizedBox(height: 25),
            CustomTextField(
              prefixIcon: Assets.icons.locked,
              hintText: 'Place the password here',
              controller: loginProvider.password,
              label: 'Password',
              obscureText: loginProvider.isHidePassword,
              suffixIcon: loginProvider.isHidePassword
                  ? Assets.icons.showPassword
                  : Assets.icons.hidePassword,
              suffixFunction: () => loginProvider.toggleShowPassword(),
              autofillHints: const [AutofillHints.password],
              textInputType: TextInputType.visiblePassword,
              validator: (password) =>
                  FormsValidate.getPasswordValidate(password),
              enabled: loginProvider.statusViews != StatusViews.loading,
            ),
          ],
        ),
      ),
    );
  }
}
