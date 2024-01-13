import 'package:flutter/material.dart';
import 'package:yitirdim/Theme/constants.dart';

GestureDetector choiceTile(title, icon, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Container(
            margin: EdgeInsets.all(4),
            child: Icon(
              icon,
              // color: AppConstants().mainColor,
            )),
        Text(
          title,
          style: TextStyle(
              fontFamily: 'Comfortaa-SemiBold',
              // color: AppConstants().darkBlue,
              fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}
