import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:yitirdim/API/data/services/auth_service.dart';
import 'package:yitirdim/Screens/AddingProductScreen/components/select_button.dart';
import 'package:yitirdim/Screens/ProductProfileScreen/productProfileScreen_controller.dart';
import 'package:yitirdim/Screens/UserProfileScreen/components/textField.dart';
import 'package:yitirdim/Screens/UserProfileScreen/components/textFields.dart';
import 'package:yitirdim/Theme/constants.dart';

Widget userProfile(context, height, bottom, userName) {
  TextEditingController nameController = TextEditingController();
  ProductProfileController userProdile = Get.put(ProductProfileController());
  Box dataBox = Hive.box('api');
  String? jsonData = dataBox.get('data');
  String? name;
  if (jsonData != null) {
    Map<String, dynamic> decodedData = json.decode(jsonData);
    name = decodedData['name'];
  }
  String? phone;
  if (jsonData != null) {
    Map<String, dynamic> decodedData = json.decode(jsonData);
    phone = decodedData['phone'];
  }

  return Container(
    margin: EdgeInsets.only(left: 7, right: 7, top: height, bottom: bottom),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        border: Border.all(color: AppConstants().whiteColor),
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: AppConstants().borderRadius15,
        boxShadow: [
          BoxShadow(
              color: AppConstants().greyColor1, blurRadius: 3, spreadRadius: 1)
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ClipOval(
            child: Image.network(
          'https://www.international.gc.ca/world-monde/assets/images/issues_development-enjeux_developpement/gender_equality-egalite_des_genres/jacqueline_oneill.jpg',
          height: 65,
          width: 65,
        )),
        Container(
          margin: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName),
              Text(
                "Şahs",
                style: TextStyle(
                  color: AppConstants().greyColor,
                  fontFamily: 'Comfortaa-SemiBold',
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
