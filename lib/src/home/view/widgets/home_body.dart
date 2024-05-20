import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/src/home/view/widgets/home_appbar.dart';
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
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 10),
          ),
          const HomeAppBarWidget(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
          const HomeTypeTodosButtonWidget(),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          const HomeTodosItemsWidget(),
          SliverToBoxAdapter(
            child: Container(),
          )
        ],
      ),
    );
  }
}
