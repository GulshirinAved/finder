import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:yitirdim/API/data/services/contact_service.dart';
import 'package:yitirdim/Screens/CustomWidgets/showSnack_bar.dart';
import 'package:yitirdim/Screens/UserProfileScreen/LoginScreen/login_screen.dart';
import 'package:yitirdim/Screens/UserProfileScreen/components/textField.dart';
import 'package:yitirdim/Theme/constants.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController feedBackController = TextEditingController();
    Box dataBox = Hive.box('api');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  IconlyLight.arrowLeftCircle,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 150, bottom: 20),
                child: Text(
                  "contact".tr,
                  style: TextStyle(
                      fontSize: AppConstants().fontSize23,
                      fontFamily: 'Comfortaa-SemiBold'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: TExtField(
                  controllerr: nameController,
                  icon: IconlyLight.profile,
                  hintText: 'Adynyz...',
                  isPassword: false,
                  phone: false,
                  // controller: nameController,
                  number: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                child: TExtField(
                  controllerr: feedBackController,
                  icon: IconlyLight.message,
                  hintText: 'Teswir...',
                  isPassword: false,
                  phone: false,
                  // controller: nameController,
                  number: null,
                ),
              ),
              AnimationButoon(
                text: 'Ugrat',
                width: Get.width,
                onTap: () {
                  feedBackController.text == '' || feedBackController.text == ''
                      ? showSnackBar("Ýalňyşlyk", 'Doly we dogry dolduruň',
                          AppConstants().redColor, 1)
                      : contactService(
                              nameController.text,
                              jsonDecode(dataBox.get('data'))['phoneNumber']
                                  .toString(),
                              feedBackController.text)
                          .then((value) {
                          if (value == true) {
                            return showSnackBar("Üstünlikli", 'Ugradyldy',
                                AppConstants().mainColor, 1);
                          } else {
                            return showSnackBar("Ýalňyşlyk", 'Başa barmady',
                                AppConstants().mainColor, 1);
                          }
                        });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
