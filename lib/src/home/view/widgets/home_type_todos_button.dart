import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';
import 'package:todo_app/src/home/presenters/home_provider.dart';

class HomeTypeTodosButtonWidget extends StatelessWidget {
  const HomeTypeTodosButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final int activeIndex = Provider.of<HomeProviderImp>(context).activeIndex;
    Provider.of<HomeProviderImp>(context).activeIndex;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 30,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Provider.of<HomeProviderImp>(context, listen: false)
                  .selectTypeTodos(index);
            },
            child: AnimatedContainer(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                color: index == activeIndex
                    ? ColorName.purplePlum
                    : ColorName.purplePlum.withOpacity(.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                titleButton(index),
                style: TextStyles.style12.copyWith(
                  color: ColorName.white,
                ),
              ),
            ),
          ),
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
            width: 5,
          ),
        ),
      ),
    );
  }

  String titleButton(int index) {
    switch (index) {
      case 0:
        return 'All';
      case 1:
        return 'In Progress';
      case 2:
        return 'Done';
    }
    return '';
  }
}
