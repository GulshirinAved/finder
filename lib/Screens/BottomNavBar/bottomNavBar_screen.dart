import 'package:custom_top_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:yitirdim/Screens/CategoryScreen/category_screen.dart';
import 'package:yitirdim/Screens/FavScreen/favScreen.dart';
import 'package:yitirdim/Screens/FavScreen/favScreen_conrtoller.dart';
import 'package:yitirdim/Screens/HomePageScreen/homePage_screen.dart';
import 'package:yitirdim/Screens/BottomNavBar/bottomNavBarScreen_controller.dart';
import 'package:yitirdim/Screens/UserProfileScreen/userProfile_screen.dart';
import 'package:yitirdim/Theme/constants.dart';

class BottomNavBarView extends StatelessWidget {
  const BottomNavBarView({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavBarController controller = Get.put(BottomNavBarController());

    List<Widget> screens = [
      HomePageScreen(),
      CategoryScreen(leadingIcon: false),
      FavScreen(),
      UserProfileScreen(),
    ];
    return CustomScaffold(
      scaffold: Scaffold(
        body: Center(
          child: screens.elementAt(controller.tabIndex.value),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            showSelectedLabels: true,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: AppConstants().greyColor.withOpacity(0.8),
            currentIndex: controller.tabIndex.value,
            showUnselectedLabels: false,
            selectedItemColor: AppConstants().mainColor,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(IconlyBold.home), label: "homePage".tr),
              BottomNavigationBarItem(
                  icon: Icon(IconlyBold.category), label: "category".tr),
              BottomNavigationBarItem(
                  icon: Icon(IconlyBold.heart), label: "favorites".tr),
              BottomNavigationBarItem(
                  icon: Icon(IconlyBold.profile), label: "setting".tr),
            ]),
      ),
      children: screens,
      onItemTap: (p0) {
        controller.selection(p0);
      },
    );
  }
}
