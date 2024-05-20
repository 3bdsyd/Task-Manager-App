import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashView.page,
        ),
        AutoRoute(page: OnBoardingView.page),
        CustomRoute(
          page: LoginView.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 400,
        ),
        CustomRoute(
          page: HomeView.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
          initial: true,
        ),
      ];
}
