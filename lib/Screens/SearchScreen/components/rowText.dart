import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:yitirdim/Theme/constants.dart';

Widget rowText(text, ontap, context) {
  return GestureDetector(
    onTap: ontap,
    child: Padding(
      padding: const EdgeInsets.all(10.0).copyWith(top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontFamily: 'Comfortaa-SemiBold',
                // color: AppConstants().darkBlue,
                fontWeight: FontWeight.bold,
                fontSize: AppConstants().fontSize18),
          ),
          Icon(
            IconlyLight.arrowRightCircle,
            color: Theme.of(context).iconTheme.color,

            // color: AppConstants().mainColor,
          )
        ],
      ),
    ),
  );
}
