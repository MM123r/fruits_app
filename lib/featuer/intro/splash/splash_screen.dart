import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/core/constants/app_assets.dart';
import 'package:fruits/core/functions/navigation.dart';
import 'package:fruits/featuer/intro/onboarding/page/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      pushAndRemoveUntil(context,const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(AppAssets.plantSvg),
              ],
            ),
            SvgPicture.asset(AppAssets.logoSvg),
            SvgPicture.asset(
              AppAssets.circlesSvg,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
