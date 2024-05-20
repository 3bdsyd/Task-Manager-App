import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/router/app_router.gr.dart';
import 'package:todo_app/core/styles/text_styles.dart';
import 'package:todo_app/src/onboarding/model/onboarding_model.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// Provides functionality related to onboarding.
class OnBoardingProvider extends ChangeNotifier {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerState =
      GlobalKey<ScaffoldMessengerState>();

  final PageController _pageViewController = PageController();

  int _currentPage = 0;

  final List<OnBoardingModel> _onBoardingItems = [
    OnBoardingModel(
      title: 'Keep calm and stay\nin control',
      subTitle: 'You can check your health with just one\nlook.',
      image: Assets.animations.calm,
    ),
    OnBoardingModel(
      title: 'Don’t miss a\nsingle pill, ever!',
      subTitle: 'Plan your supplementation in details.',
      image: Assets.animations.pills,
    ),
    OnBoardingModel(
      title: 'Exercise more\n& breathe better',
      subTitle: 'Learn, measure, set daily goals.',
      image: Assets.animations.yoga,
    ),
  ];

  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerState =>
      _scaffoldMessengerState;

  PageController get pageViewController => _pageViewController;

  int get currentPage => _currentPage;

  List<OnBoardingModel> get onBoardingItems => _onBoardingItems;

  /// Skips to the next pages in onboarding.
  void skipToNextPages() async {
    for (int i = _currentPage; i < _onBoardingItems.length; i++) {
      await _pageViewController.animateToPage(
        i,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn,
      );

      if (_currentPage > 1) {
        _scaffoldMessengerState.currentContext!.router.push(const LoginView());
        break;
      }

      _currentPage++;

      notifyListeners();
    }
  }

  /// Animates to the next page in onboarding.
  void animateToPage() {
    if (_currentPage > 1) {
      _scaffoldMessengerState.currentContext!.router.push(const LoginView());

      return;
    }

    _pageViewController.animateToPage(
      ++_currentPage,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeIn,
    );
    notifyListeners();
  }

  GlobalKey globalKey1 = GlobalKey();
  GlobalKey globalKey2 = GlobalKey();

  List<TargetFocus> listTargets = [];
  void initTargets() {
    listTargets.add(
      _targetFocus(
        "Target 1",
        globalKey1,
        Text(
          "Skip All pages",
          style: TextStyles.styleBold14.copyWith(
            color: ColorName.deepBlue,
          ),
          textAlign: TextAlign.end,
        ).animate().fade().slideY(begin: -3),
        ContentAlign.bottom,
      ),
    );
    listTargets.add(_targetFocus(
        "Target 2",
        globalKey2,
        Text(
          textAlign: TextAlign.start,
          "Skip the current page",
          style: TextStyles.styleBold14.copyWith(
            color: ColorName.deepBlue,
          ),
        ).animate().fade().slideX(
              begin: -3,
              duration: const Duration(milliseconds: 400),
            ),
        ContentAlign.top));
  }

  void showAppTutorial() {
    TutorialCoachMark(
      targets: listTargets,
      pulseAnimationDuration: const Duration(seconds: 1),
      paddingFocus: 1,
      hideSkip: true,
      imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
      opacityShadow: .1,
      onFinish: () {},
      onClickTarget: (target) {},
      onClickOverlay: (target) {},
    ).show(context: _scaffoldMessengerState.currentContext!);
  }

  TargetFocus _targetFocus(
    String identify,
    GlobalKey<State<StatefulWidget>> keyTarget,
    Widget child,
    ContentAlign align,
  ) =>
      TargetFocus(
        identify: identify,
        keyTarget: keyTarget,
        contents: [
          TargetContent(
            align: align,
            child: child,
          ),
        ],
        shape: ShapeLightFocus.RRect,
        radius: 20,
      );
}
