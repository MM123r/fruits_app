import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/core/functions/navigation.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/utils/text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/featuer/auth/presentation/views/signin_view.dart';
import 'package:fruits/featuer/intro/onboarding/model/onboarding_model.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value; // تحديث pageIndex عند التغيير بين الصفحات
                });
              },
              itemCount: onboardingPage.length,
              itemBuilder: (context, index) {
                return SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Stack(
                          children: [
                            Positioned.fill(
                                child: SvgPicture.asset(
                              onboardingPage[index].bgImage,
                              fit: BoxFit.fill,
                            )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: SvgPicture.asset(
                                  onboardingPage[index].image,
                                )),
                            if (pageIndex != onboardingPage.length - 1)
                              Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextButton(
                                      onPressed: () {
                                        pushTo(context, const SigninView());
                                      },
                                      child: Text(
                                        "تخط",
                                        style: getFont14TextStyle(context,color:const Color(0xFF989D9E),
                                            fontWeight: FontWeight.w400),
                                      )))
                          ],
                        ),
                      ),
                      const Gap(50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [onboardingPage[index].title],
                      ),
                      const Gap(13),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                            textAlign: TextAlign.center,
                            style: get20TextStyle(fontSize: 13),
                            onboardingPage[index].subTitle),
                      ),
                      const Gap(10),
                      DotsIndicator(
                        dotsCount: onboardingPage.length,
                        position: pageIndex.toInt(),
                        decorator: DotsDecorator(
                          activeColor: AppColors.primaryColor,
                          color: pageIndex == 1
                              ? AppColors.primaryColor
                              : Colors.grey,
                        ),
                      ),
                      const Gap(10),
                    ],
                  ),
                );
              },
            ),
          ),
          if (pageIndex == onboardingPage.length - 1) // تعديل الشرط هنا
            CustomButton(
              text: "ابدأ الان",
              width: 250,
              onPressed: () {
                pushTo(context,const SigninView());
              },
            ),
          const Gap(20),
        ],
      ),
    );
  }
}
