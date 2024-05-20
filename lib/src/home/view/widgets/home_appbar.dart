import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          const Text(
            'MY TODOS',
            style: TextStyles.style20,
          ),
          Assets.icons.exit.image(fit: BoxFit.scaleDown, width: 25),
        ],
      ),
    );
  }
}
