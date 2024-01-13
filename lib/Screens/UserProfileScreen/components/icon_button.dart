import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:yitirdim/Theme/constants.dart';

ListTile iconButton(int? index, IconData? icon, String title, String? flagImage,
    bool neededArrow, context) {
  return ListTile(
      leading: Container(
          height: 40,
          width: 43,
          decoration: BoxDecoration(
              color: AppConstants().lightBlueColor.withOpacity(0.5),
              borderRadius: AppConstants().borderRadius7),
          child: index == 0
              ? ClipRRect(
                  borderRadius: AppConstants().borderRadius7,
                  child: Image.asset(
                    'assets/images/${flagImage}.png',
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(
                  icon,
                  color: AppConstants().whiteColor,
                )),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: 'Comfortaa-SemiBold',
        ),
      ),
      trailing: neededArrow
          ? Icon(
              IconlyLight.arrowRightCircle,
              color: Theme.of(context).iconTheme.color,

              // color: AppConstants().mainColor,
            )
          : null);
}
