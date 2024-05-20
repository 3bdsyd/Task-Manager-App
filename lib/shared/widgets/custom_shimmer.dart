import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_app/core/gen/colors.gen.dart';

class CustomShimmerWidget extends StatelessWidget {
  final double width;
  final double height;

  const CustomShimmerWidget({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorName.purplePlum.withOpacity(.01),
      highlightColor: ColorName.lightGrey,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(8),
        ),
        width: width,
        height: height,
      ),
    );
  }
}
