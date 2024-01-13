import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yitirdim/Screens/BottomNavBar/bottomNavBar_screen.dart';

class OnboardingController extends GetxController {
  void completeOnboarding() {
    Hive.box('api').put(
        'onboardingComplete', true); // Set onboarding completion flag in Hive
    Get.off(() =>
        BottomNavBarView()); // Navigate to the main screen after completing onboarding
  }
}
