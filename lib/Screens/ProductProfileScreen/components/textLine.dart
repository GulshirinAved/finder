import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yitirdim/Theme/constants.dart';

Widget textDesc(firstTitle, secondTitle) {
  return Container(
    width: Get.width,
    margin: EdgeInsets.only(right: 2),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstTitle,
          style: TextStyle(
            color: AppConstants().greyColor,
            fontFamily: 'Comfortaa-SemiBold',
          ),
        ),
        Text(
          secondTitle,
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: AppConstants().fontSize13,
            fontFamily: 'Comfortaa-SemiBold',
          ),
        )
      ],
    ),
  );
}
