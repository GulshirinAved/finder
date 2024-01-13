import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:yitirdim/API/data/services/auth_service.dart';
import 'package:yitirdim/API/data/services/logout_service.dart';
import 'package:yitirdim/Theme/constants.dart';

void logout(BuildContext context, token) {
  Get.bottomSheet(
    Container(
      decoration: BoxDecoration(color: AppConstants().whiteColor),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox.shrink(),
                Text(
                  "logout".tr,
                  style: TextStyle(
                      fontFamily: 'Comfortaa-SemiBold',
                      // color: AppConstants().darkBlue,
                      fontSize: AppConstants().fontSize15),
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    CupertinoIcons.xmark_circle,
                    size: 22,
                    // color: AppConstants().blackColor,
                  ),
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[200],
            height: 1,
            thickness: 2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Text(
              'logoutConfirm'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Comfortaa-SemiBold',
                  color: Colors.grey[500],
                  fontSize: AppConstants().fontSize15),
            ),
          ),
          GestureDetector(
            onTap: () async {
              logoutService(token: token).then((value) {
                if (value == true) {
                  Auth().logout();
                  Auth().removeToken();
                  Auth().getToken().then((value) {});
                  Get.back();
                  Restart.restartApp();
                }
              });
            },
            child: Container(
              width: Get.size.width,
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: AppConstants().borderRadius10),
              child: Text(
                'yes'.tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Comfortaa-SemiBold',
                    color: AppConstants().whiteColor,
                    fontSize: AppConstants().fontSize15),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              Get.back();
            },
            child: Container(
              width: Get.size.width,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: AppConstants().borderRadius10),
              child: Text(
                "no".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Comfortaa-SemiBold',
                    color: AppConstants().blackColor,
                    fontSize: AppConstants().fontSize15),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
