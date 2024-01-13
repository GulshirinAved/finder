import 'package:flutter/material.dart';
import 'package:yitirdim/Screens/ProductProfileScreen/productProfileScreen_controller.dart';
import 'package:yitirdim/Theme/constants.dart';

AnimatedContainer dot(ProductProfileController productController, int index) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    margin: EdgeInsets.symmetric(horizontal: 4),
    curve: Curves.decelerate,
    height: 16,
    width: productController.changeDots.value == index ? 18 : 10,
    decoration: BoxDecoration(
        color: productController.changeDots.value == index
            ? AppConstants().mainColor
            : AppConstants().whiteColor,
        borderRadius: AppConstants().borderRadius5),
  );
}
