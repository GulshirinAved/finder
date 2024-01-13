import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:yitirdim/Helpers/bindings.dart';
import 'package:yitirdim/Screens/AddedArticleScreen/addingArticle_screen.dart';
import 'package:yitirdim/Screens/AddingProductScreen/addingProduct_screen.dart';
import 'package:yitirdim/Screens/ChatScreen/chat_screen.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/drawer_tile.dart';
import 'package:yitirdim/Screens/HomePageScreen/homePage_screen.dart';
import 'package:yitirdim/Screens/UserProfileScreen/LoginScreen/login_screen.dart';
import 'package:yitirdim/Screens/UserProfileScreen/components/logout_bottomSheet.dart';
import 'package:yitirdim/Theme/constants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Box auth = Hive.box('api');

    return Drawer(
      // backgroundColor: AppConstants().whiteColor,
      child: Column(
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: AppConstants().mainColor.withOpacity(0.3)),
            child: Center(
              child: Text("Finder"),
            ),
          ),
          RowText(
            title: 'homePage'.tr,
            icon: IconlyLight.home,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HomePageScreen();
                  },
                ),
              );
            },
          ),
          RowText(
              title: 'addingAd'.tr,
              icon: IconlyLight.plus,
              onTap: () {
                Get.to(() => AddingProductScreen(), binding: MyBindings());
              }),
          RowText(
              title: 'myAd'.tr,
              icon: IconlyLight.document,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return AddingArticleScreen();
                  },
                ));
                // Get.to(() => AddingArticleScreen());
              }),
          RowText(
              title: auth.get('accessToken') != null ? "logout".tr : 'login'.tr,
              icon: IconlyLight.login,
              onTap: () {
                auth.get('accessToken') != null
                    ? logout(context, auth.get('accessToken'))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogInScreen(),
                        ));
              })
        ],
      ),
    );
  }
}
