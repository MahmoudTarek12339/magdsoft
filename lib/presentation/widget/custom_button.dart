import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double horizontal;
  final double vertical;
  final double borderRadius;
  final void Function()? onPressed;

  const CustomButton(this.text,
      {this.horizontal = 25.0, this.vertical = 5.0, this.onPressed,this.borderRadius=25.0, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: Container(
        height: 6.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(colors: [
            const Color(0xff0062BD),
            const Color(0xff0062BD).withOpacity(0.5),
            const Color(0xff0062BD).withOpacity(0.27),
          ]),
        ),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(75.0.w, 6.0.h)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.transparent)),
            child: Text(
              text,
              textAlign: TextAlign.center,
            )),
      ),
    );
  }
}
