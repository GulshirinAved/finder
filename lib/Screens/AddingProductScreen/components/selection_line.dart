import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:yitirdim/Theme/constants.dart';

Widget lineForSelection(String text, needRow, context) {
  return Container(
    margin: EdgeInsets.only(left: 4, bottom: 3, top: 2.5),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              child: Text(
                overflow: TextOverflow.fade,
                text,
                style: TextStyle(
                    color: text == 'noSelection'.tr
                        ? AppConstants().darkBlue.withOpacity(0.7)
                        : AppConstants().darkBlue,
                    fontFamily: 'Comfortaa-SemiBold',
                    fontSize: AppConstants().fontSize14,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              color: Theme.of(context).backgroundColor,
              height: 1,
              width: 200,
            )
          ],
        ),
        SizedBox(width: 15),
        needRow
            ? Icon(
                IconlyLight.arrowRight2,
                size: 15,
              )
            : SizedBox.shrink()
      ],
    ),
  );
}
