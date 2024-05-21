import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';
import 'package:todo_app/src/home/presenters/home_provider.dart';

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
          GestureDetector(
            onTap: () =>
                Provider.of<HomeProviderImp>(context, listen: false).logOut(),
            child: Assets.icons.exit.image(fit: BoxFit.scaleDown, width: 25),
          ),
        ],
      ),
    );
  }
}
