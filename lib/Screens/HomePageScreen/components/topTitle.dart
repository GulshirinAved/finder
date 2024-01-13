import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:yitirdim/Theme/constants.dart';

Widget topTitle(title, VoidCallback onTap, context) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 4, left: 4, top: 8, bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Comfortaa-SemiBold',
              fontSize: AppConstants().fontSize20,
              fontWeight: FontWeight.w500,
              // color: AppConstants().darkBlue
            ),
          ),
          Icon(
            IconlyLight.arrowRightCircle,
            color: Theme.of(context).iconTheme.color,

            // color: AppConstants().mainColor,
          ),
        ],
      ),
    ),
  );
}
