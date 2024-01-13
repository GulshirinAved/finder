import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:yitirdim/API/data/services/register_service.dart';
import 'package:yitirdim/Screens/BottomNavBar/bottomNavBar_screen.dart';
import 'package:yitirdim/Screens/CustomWidgets/showSnack_bar.dart';
import 'package:yitirdim/Screens/UserProfileScreen/LoginScreen/login_screen.dart';
import 'package:yitirdim/Screens/UserProfileScreen/components/otp_textfield.dart';
import 'package:yitirdim/Theme/constants.dart';

class OtpCheckScreen extends StatelessWidget {
  final String phoneNumber;
  String code;
  final String name;
  OtpCheckScreen(
      {super.key,
      required this.phoneNumber,
      required this.code,
      required this.name});

  @override
  Widget build(BuildContext context) {
    TextEditingController verificationCodeController = TextEditingController();
    TextEditingController verificationCodeController1 = TextEditingController();

    TextEditingController verificationCodeController2 = TextEditingController();

    TextEditingController verificationCodeController3 = TextEditingController();
    TextEditingController verificationCodeController4 = TextEditingController();

    String code1 = '';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Otp Werifikasiya",
            style: TextStyle(
                fontSize: AppConstants().fontSize23,
                fontFamily: 'Comfortaa-SemiBold'),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 7, right: 7, top: 50, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NumberTextFormField(
                  first: true,
                  last: false,
                  controller: verificationCodeController,
                ),
                NumberTextFormField(
                  first: false,
                  last: false,
                  controller: verificationCodeController1,
                ),
                NumberTextFormField(
                  first: false,
                  last: false,
                  controller: verificationCodeController2,
                ),
                NumberTextFormField(
                  first: false,
                  last: false,
                  controller: verificationCodeController3,
                ),
                NumberTextFormField(
                  first: false,
                  last: true,
                  controller: verificationCodeController4,
                ),
              ],
            ),
          ),
          AnimationButoon(
            text: "Tassykla",
            width: Get.width,
            onTap: () {
              code1 = verificationCodeController.text +
                  verificationCodeController1.text +
                  verificationCodeController2.text +
                  verificationCodeController3.text +
                  verificationCodeController4.text;
              code != code1
                  ? showSnackBar('Yalnyshlyk', 'Doly we dogry doldurun',
                      AppConstants().mainColor, 1)
                  : RegisterService()
                      .login(phoneNumber, code1, name)
                      .then((value) async {
                      if (value == true) {
                        showSnackBar(
                            'Ustunlikli',
                            'Siz hasaba alyndynyz ${name}',
                            AppConstants().mainColor,
                            1);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return BottomNavBarView();
                            },
                          ),
                        );
                      } else {
                        showSnackBar('Yalnyshlyk', 'Siz hasaba alynmadynyz',
                            AppConstants().mainColor, 1);
                      }
                    });
            },
          )
        ],
      ),
    );
  }
}
