import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/src/home/view/widgets/home_appbar.dart';
import 'package:todo_app/src/home/view/widgets/home_navigation_bar.dart';
import 'package:todo_app/src/home/view/widgets/home_todos_items.dart';
import 'package:todo_app/src/home/view/widgets/home_type_todos_button.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorName.violet.withOpacity(.1),
            ColorName.darkGrey.withOpacity(.4),
          ],
        ),
      ),
      child: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          HomeAppBarWidget(),
          SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          HomeTypeTodosButtonWidget(),
          SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          HomeNavigationBarWidget(),
          SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          HomeTodosItemsWidget(),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}
