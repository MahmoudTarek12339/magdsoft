import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

class HelpCard extends StatelessWidget {
  final String title;
  final String description;

  const HelpCard({required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.0.w, vertical: 1.5.h),
        child: Material(
          elevation: 10,
          color: AppColor.white,
          borderRadius: BorderRadius.circular(15),
          child: ExpansionTile(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: 2.5.h, right: 2.5.h, bottom: 2.5.h),
                child: Text(
                  description.trimLeft(),
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ],
            title: Text(
              title,
              style: const TextStyle(color: AppColor.primary),
            ),
          ),
        ));
  }
}
