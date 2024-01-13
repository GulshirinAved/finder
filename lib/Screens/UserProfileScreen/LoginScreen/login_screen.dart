// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:yitirdim/API/data/services/otpCheck_service.dart';
import 'package:yitirdim/API/data/services/register_service.dart';
import 'package:yitirdim/Screens/CustomWidgets/showSnack_bar.dart';
import 'package:yitirdim/Screens/UserProfileScreen/LoginScreen/loginScreen_controller.dart';
import 'package:yitirdim/Screens/UserProfileScreen/OtpScreen/otpCheck_screen.dart';
import 'package:yitirdim/Screens/UserProfileScreen/components/otp_textfield.dart';

import 'package:yitirdim/Screens/UserProfileScreen/components/textField.dart';

import '../../../Theme/constants.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    LogInController loginController = Get.put(LogInController());

    double _width = Get.size.width;
    double _height = Get.size.height;
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              IconlyLight.arrowLeftCircle,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150, bottom: 20),
                  child: Text(
                    "login".tr,
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
                TExtField(
                  controllerr: phoneController,
                  icon: null,
                  hintText: 'Nomeriniz...',
                  isPassword: false,
                  phone: true,
                  number: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: AnimationButoon(
                      width: _width,
                      text: 'Kod ugrat',
                      onTap: () {
                        nameController.text == '' ||
                                phoneController.text.length != 8
                            ? showSnackBar(
                                'Yalnyshlyk',
                                'Doly we dogry doldurun',
                                AppConstants().redColor,
                                1)
                            : otpCheckService(
                                phoneNumber: phoneController.text,
                              ).then((value) {
                                print(value);
                                if (value != false) {
                                  Get.to(
                                    () => OtpCheckScreen(
                                      phoneNumber: phoneController.text,
                                      code: value.toString(),
                                      name: nameController.text,
                                    ),
                                  );
                                }
                              });
                      }),
                )
              ],
            ),
          ),
        ));
  }
}

class AnimationButoon extends StatelessWidget {
  final String text;
  final onTap;
  final width;
  const AnimationButoon(
      {super.key, required this.text, this.onTap, this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 50,
        width: width * .7,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: AppConstants().borderRadius15,
          color: AppConstants().darkBlue,
          shape: BoxShape.rectangle,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Comfortaa-SemiBold',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  final String text;
  VoidCallback onTap;
  SignUpButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 37),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
            textAlign: TextAlign.left,
            text: TextSpan(
                text: text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppConstants().lightBlueColor),
                recognizer: TapGestureRecognizer()..onTap = onTap)),
      ),
    );
  }
}
