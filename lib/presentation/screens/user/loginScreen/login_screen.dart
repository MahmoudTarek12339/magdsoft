import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/view/login_card.dart';
import 'package:magdsoft_flutter_structure/presentation/view/other_options_card.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/line_container.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              //here i used stack to add some blur to the image
              Stack(
                children: [
                  Image(
                    image: const Svg(AssetsManager.loginBackGround),
                    width: MediaQuery.of(context).size.width,
                    height: 40.0.h,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: AppColor.white.withOpacity(0.2),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 31.0.h,
                  ),
                  Container(
                    height: 70.0.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            LineContainer(17.0.h, 1),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              'OR',
                              style: TextStyle(
                                color: AppColor.primary,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            LineContainer(17.0.h, 1),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const OtherOptionsCard()
                      ],
                    ),
                    decoration: const BoxDecoration(
                        color: AppColor.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25.0))),
                  ),
                ],
              ),
              LoginCard()
            ],
          ),
        ),
      ),
    );
  }
}
