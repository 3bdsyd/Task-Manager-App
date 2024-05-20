import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/styles/text_styles.dart';
import 'package:todo_app/src/home/presenters/home_provider.dart';
import 'package:todo_app/src/home/view/widgets/home_navigation_button.dart';

class HomeNavigationBarWidget extends StatelessWidget {
  const HomeNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeNavigationButtonWidget(
            title: 'PREVIOUS',
            onTap: () {
              Provider.of<HomeProviderImp>(context, listen: false)
                  .previousPage();
            },
          ),
          Text(
            'PAGE ${Provider.of<HomeProviderImp>(context).currentPage}',
            style: TextStyles.style20.copyWith(),
          ),
          HomeNavigationButtonWidget(
            title: 'NEXT',
            onTap: () {
              Provider.of<HomeProviderImp>(context, listen: false).nextPage();
            },
          ),
        ],
      ),
    );
  }
}
