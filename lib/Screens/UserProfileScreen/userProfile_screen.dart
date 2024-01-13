import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:yitirdim/Screens/ContactUsScreen/contact_screen.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';
import 'package:yitirdim/Screens/UserProfileScreen/components/flag_box.dart';
import 'package:yitirdim/Screens/UserProfileScreen/components/icon_button.dart';
import 'package:yitirdim/Screens/UserProfileScreen/LoginScreen/login_screen.dart';
import 'package:yitirdim/Screens/UserProfileScreen/components/logout_bottomSheet.dart';
import 'package:yitirdim/Screens/UserProfileScreen/settingsScreen_controller.dart';
import 'package:yitirdim/Theme/theme/theme_service.dart';
import 'package:yitirdim/Theme/constants.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsController settingController = Get.put(SettingsController());
    Box auth = Hive.box('api');
    return Scaffold(
      // backgroundColor: AppConstants().whiteColor,
      appBar: CustomAppBar(
        number: 3,
        title: "setting".tr,
      ),
      body: ListView(
        children: [
          GestureDetector(
              onTap: () {
                showModelSheet(context);
              },
              child: iconButton(
                  0,
                  null,
                  Get.locale!.languageCode == 'tkm' ? 'Turkmen' : 'Русский',
                  Get.locale!.languageCode == 'tkm' ? 'tkm' : 'ru',
                  false,
                  context)),
          Obx(() => GestureDetector(
              onTap: () async {
                ThemeService().changeThemeMode();
                settingController.theming();
              },
              child: iconButton(
                  1,
                  settingController.theme.value == true
                      ? CupertinoIcons.moon_stars
                      : CupertinoIcons.sun_max,
                  'theme'.tr,
                  null,
                  false,
                  context))),
          GestureDetector(
            onTap: () {
              auth.get('accessToken') == null
                  ? Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return LogInScreen();
                      },
                    ))
                  : Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ContactScreen();
                      },
                    ));
            },
            child: iconButton(
                1, IconlyLight.message, 'contact'.tr, null, true, context),
          ),
          iconButton(
              1, IconlyLight.infoSquare, 'aboutUs'.tr, null, false, context),
          GestureDetector(
              onTap: () {
                auth.get('accessToken') != null
                    ? logout(context, auth.get('accessToken'))
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LogInScreen(),
                        ));
              },
              child: iconButton(
                  1,
                  auth.get('accessToken') != null
                      ? IconlyLight.logout
                      : IconlyLight.login,
                  auth.get('accessToken') != null ? "logout".tr : 'login'.tr,
                  null,
                  true,
                  context))
        ],
      ),
    );
  }

  Future showModelSheet(BuildContext context) => showModalBottomSheet(
        enableDrag: true,
        isDismissible: false,
        showDragHandle: true,
        useSafeArea: true,
        barrierColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,

        // backgroundColor: AppConstants().whiteColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        context: context,
        builder: (context) {
          SettingsController langController = Get.put(SettingsController());
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                flagBox('tkm', 'Turkmen', () {
                  langController.selectionLanguage(2);
                  Navigator.pop(context);
                }),
                Divider(
                  color: AppConstants().greyColor,
                ),
                flagBox('ru', 'Rus', () {
                  langController.selectionLanguage(1);
                  Navigator.pop(context);
                })
              ],
            ),
          );
        },
      );
}
