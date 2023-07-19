import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class LoginCircle extends StatelessWidget {
  final Widget widget;
  const LoginCircle(this.widget,{super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: AppColor.white,
      elevation: 10,
      child: Center(
        child: IconButton(onPressed: (){}, icon: widget),
      ),
    );
  }
}
