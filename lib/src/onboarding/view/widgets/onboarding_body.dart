import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/onboarding/presenters/onboarding_provider.dart';
import 'package:todo_app/src/onboarding/view/widgets/onboarding_button_next.dart';
import 'package:todo_app/src/onboarding/view/widgets/onboarding_button_skip.dart';
import 'package:todo_app/src/onboarding/view/widgets/onboarding_page_view.dart';
import 'package:todo_app/src/onboarding/view/widgets/onboarding_transition_indicator.dart';

class OnBoardingBodyWidget extends StatelessWidget {
  const OnBoardingBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: OnBoardingButtonSkip(),
                ),
                const SizedBox(height: 18),
                SizedBox(
                  height: heightPageView(size.maxHeight),
                  child: OnBoardingPageViewWidget(
                    height: size.maxHeight,
                  ),
                ),
                const Expanded(
                  child: SizedBox(height: 20),
                ),
                OnBoardingButtonNextWidget(
                  height: size.maxHeight,
                  onTap: () =>
                      Provider.of<OnBoardingProvider>(context, listen: false)
                          .animateToPage(),
                ),
                OnBoardingTransitionIndicatorWidget(
                  width: size.maxWidth,
                )
              ],
            ),
          ),
        ],
      );
    });
  }

  double heightPageView(double size) {
    return size < 750
        ? 388
        : size < 780
            ? 490
            : size < 900
                ? 500
                : size < 1100
                    ? 600
                    : size < 1300
                        ? 700
                        : 800;
  }
}
