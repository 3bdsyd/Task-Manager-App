import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/src/onboarding/presenters/onboarding_provider.dart';
import 'package:todo_app/src/onboarding/view/widgets/onboarding_body.dart';
import 'package:provider/provider.dart';

@RoutePage()
class OnBoardingView extends StatelessWidget implements AutoRouteWrapper {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OnBoardingProvider>(context, listen: false).initTargets();
      Provider.of<OnBoardingProvider>(context, listen: false).showAppTutorial();
    });
    return ScaffoldMessenger(
      key: Provider.of<OnBoardingProvider>(context, listen: false)
          .scaffoldMessengerState,
      child: const SafeArea(
        child: Scaffold(
          backgroundColor: ColorName.violetLight,
          body: OnBoardingBodyWidget(),
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OnBoardingProvider(),
      child: this,
    );
  }
}
