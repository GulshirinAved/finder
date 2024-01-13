import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yitirdim/Theme/constants.dart';

Widget cardForDesc(topTitle, belowTitle, context) {
  return Container(
    height: 75,
    width: 110,
    margin: EdgeInsets.all(5),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 1),
            color: AppConstants().greyColor1,
          ),
        ],
        border: Border.all(color: AppConstants().greyColor1, width: 2),
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: AppConstants().borderRadius15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          topTitle,
          style: TextStyle(
            // color: AppConstants().darkBlue,
            fontFamily: 'Comfortaa-SemiBold',
          ),
        ),
        Text(
          belowTitle,
          style: TextStyle(
            color: AppConstants().greyColor,
            fontFamily: 'Comfortaa-SemiBold',
          ),
        )
      ],
    ),
  );
}
