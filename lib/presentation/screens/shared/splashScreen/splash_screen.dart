import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/constants/assets_manager.dart';
import 'package:magdsoft_flutter_structure/constants/constants.dart';
import 'package:magdsoft_flutter_structure/data/data_providers/local/cache_helper.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../../router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primary,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetsManager.splashBackGround),
                      fit: BoxFit.cover)),
            ),
            Image.asset(
              AssetsManager.splashLogo,
              height: 40.0.h,
              width: 40.0.h,
              fit: BoxFit.contain,
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  _startDelay() {
    //init 2 seconds as a delay for splash screen to be shown
    _timer = Timer(const Duration(seconds: Constants.splashDelay), _goNext);
  }

  _goNext() async {
    //check if user logged in or not and navigate to next page
    bool? isUserLoggedIn =
        CacheHelper.getDataFromSharedPreference(key: 'logged');
    if (isUserLoggedIn != null && isUserLoggedIn) {
      //logged in so navigate to home screen
      Navigator.pushReplacementNamed(context, Routes.homeRoute);
    } else {
      // he is not login so navigate to on Log in screen
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
