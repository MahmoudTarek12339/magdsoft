import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class LineContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;
  const LineContainer(this.width,this.height,{this.color=AppColor.primary,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
