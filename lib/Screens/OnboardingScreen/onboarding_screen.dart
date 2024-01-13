import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yitirdim/Screens/OnboardingScreen/onboardingScreen_controller.dart';
import 'package:yitirdim/Theme/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    OnboardingController onboardingController = Get.put(OnboardingController());
    List texts = [
      'Eger-de size gymmatly bolan zadynyzy yitirdinmi ya-da basga birinin yitiren zadyny tapdynyzmy?',
      'Alada etmeginize\n                    hic hili geregi yok',
      "Tapan zadynyz ya-da yitiren zadynyz barada maglumatlary girizip, begendirip ya-da begenip bilersiniz"
    ];
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: 3,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              width: Get.width,
              height: Get.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 270,
                          child: Text(
                            texts[index],
                            style: TextStyle(
                                fontFamily: 'Comfortaa-SemiBold',
                                // color: AppConstants().darkBlue,
                                fontSize: AppConstants().fontSize17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Column(
                          children: List.generate(
                              3,
                              (indexDot) => Container(
                                    margin: EdgeInsets.only(bottom: 2),
                                    height: index == indexDot ? 25 : 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: index == indexDot
                                            ? AppConstants().mainColor
                                            : AppConstants()
                                                .mainColor
                                                .withOpacity(0.3),
                                        borderRadius:
                                            AppConstants().borderRadius8),
                                  )),
                        )
                      ],
                    ),
                  ),
                  index == 2
                      ? IconButton(
                          number: 0,
                          onTap: () {
                            onboardingController.completeOnboarding();
                          })
                      : RotationTransition(
                          turns: AlwaysStoppedAnimation(90 / 360),
                          child: IconButton(
                              number: 0,
                              width: 50,
                              height: 65,
                              onTap: () {
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.linear);
                              }),
                        ),
                  Container(
                      height: 250,
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(10).copyWith(top: 100),
                      child: Lottie.asset(
                        height: 250,
                        reverse: true,
                        repeat: true,
                        fit: BoxFit.fill,
                        'assets/animations/lottie/onboarding${index + 1}.json',
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  VoidCallback? onTap;
  int? number;
  double? width;
  double? height;
  IconButton({super.key, this.onTap, this.number, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 45,
        width: width ?? 75,
        alignment: Alignment.center,
        margin: EdgeInsets.all(10).copyWith(left: 35),
        decoration: BoxDecoration(
            color: AppConstants().mainColor.withOpacity(0.7),
            borderRadius: AppConstants().borderRadius15),
        child: Lottie.asset(
          'assets/animations/lottie/$number.json',
          height: 50,
          reverse: true,
          repeat: true,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
