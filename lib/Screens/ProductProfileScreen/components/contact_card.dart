import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yitirdim/Theme/constants.dart';

Widget contactCard(iconName, title, onTap, context) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50,
      width: 115,
      alignment: Alignment.center,
      margin: EdgeInsets.all(4.5),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                color: AppConstants().greyColor1,
                blurRadius: 3,
                spreadRadius: 3)
          ],
          borderRadius: AppConstants().borderRadius5,
          border: Border.all(
            color: AppConstants().mainColor,
          )),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg_icons/$iconName.svg',
            height: 23,
            width: 23,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            title,
            style: TextStyle(
              // color: AppConstants().mainColor,
              fontFamily: 'Comfortaa-SemiBold',
            ),
          )
        ],
      ),
    ),
  );
}
