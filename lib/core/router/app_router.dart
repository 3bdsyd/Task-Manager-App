import 'package:auto_route/auto_route.dart';
import 'package:todo_app/core/helper/shared_preferences.dart';
import 'package:todo_app/core/utils/constants/app_key.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashView.page,
          initial: SharedPref.getString(AppKey.skipOnBoarding) == null,
        ),
        AutoRoute(page: OnBoardingView.page),
        CustomRoute(
          page: LoginView.page,
          transitionsBuilder: TransitionsBuilders.slideBottom,
          durationInMilliseconds: 400,
          initial: SharedPref.getString(AppKey.skipOnBoarding) != null &&
              SharedPref.getString(AppKey.userId) == null,
        ),
        CustomRoute(
          page: HomeView.page,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          durationInMilliseconds: 400,
          initial: SharedPref.getString(AppKey.userId) != null,
        ),
      ];
}
