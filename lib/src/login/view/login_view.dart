import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/login/presenters/login_provider.dart';
import 'package:todo_app/src/login/view/widgets/login_body.dart';

@RoutePage()
class LoginView extends StatelessWidget implements AutoRouteWrapper {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldMessenger(
        key: Provider.of<LoginProviderImp>(context).scaffoldKey,
        child: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: LoginBodyWidget(),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProviderImp(),
      child: this,
    );
  }
}
