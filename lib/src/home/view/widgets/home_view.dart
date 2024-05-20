import 'package:auto_route/auto_route.dart';
import 'package:draggable_expandable_fab/draggable_expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/home/presenters/home_provider.dart';
import 'package:todo_app/src/home/view/widgets/home_body.dart';
import 'package:todo_app/src/home/view/widgets/home_floating_action_button.dart';

@RoutePage()
class HomeView extends StatelessWidget implements AutoRouteWrapper {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScaffoldMessenger(
        key: Provider.of<HomeProviderImp>(context).scaffoldKey,
        child: Scaffold(
          floatingActionButtonAnimator: NoScalingAnimation(),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: const HomeFloatingActionButtonWidget(),
          body: const HomeBodyWidget(),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProviderImp()..getTodos(),
      child: this,
    );
  }
}
