// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yitirdim/Theme/constants.dart';

class CustomButton extends StatelessWidget {
  VoidCallback ontap;
  String? title;
  CustomButton({
    Key? key,
    required this.ontap,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 45,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
            color: AppConstants().mainColor.withOpacity(0.5),
            borderRadius: AppConstants().borderRadius15),
        width: Get.width,
        alignment: Alignment.center,
        child: Text(
          title ?? "select".tr,
          style: TextStyle(
              fontFamily: 'Comfortaa-SemiBold',
              color: AppConstants().whiteColor,
              fontWeight: FontWeight.w500,
              fontSize: AppConstants().fontSize17),
        ),
      ),
    );
  }
}
