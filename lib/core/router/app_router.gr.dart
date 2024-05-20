// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:todo_app/src/home/view/widgets/home_view.dart' as _i1;
import 'package:todo_app/src/login/view/login_view.dart' as _i2;
import 'package:todo_app/src/onboarding/view/onboarding_view.dart' as _i3;
import 'package:todo_app/src/splash/view/splash_view.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    LoginView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i2.LoginView()),
      );
    },
    OnBoardingView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i3.OnBoardingView()),
      );
    },
    SplashView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeView]
class HomeView extends _i5.PageRouteInfo<void> {
  const HomeView({List<_i5.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginView]
class LoginView extends _i5.PageRouteInfo<void> {
  const LoginView({List<_i5.PageRouteInfo>? children})
      : super(
          LoginView.name,
          initialChildren: children,
        );

  static const String name = 'LoginView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OnBoardingView]
class OnBoardingView extends _i5.PageRouteInfo<void> {
  const OnBoardingView({List<_i5.PageRouteInfo>? children})
      : super(
          OnBoardingView.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashView]
class SplashView extends _i5.PageRouteInfo<void> {
  const SplashView({List<_i5.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
