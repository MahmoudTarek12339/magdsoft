import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/login_circle.dart';

class OtherOptionsCard extends StatelessWidget {
  const OtherOptionsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginCircle(Text('f',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 36,
            ))),
        SizedBox(
          width: 15,
        ),
        LoginCircle(Image(
          image: Svg(
            AssetsManager.googleLogo,
          ),
        )),
        SizedBox(
          width: 15,
        ),
        LoginCircle(Icon(
          Icons.apple,
          color: Colors.black,
          size: 33,
        )),
      ],
    );
  }
}
