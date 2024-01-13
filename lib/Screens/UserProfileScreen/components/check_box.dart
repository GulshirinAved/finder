import 'package:flutter/material.dart';
import 'package:yitirdim/Screens/UserProfileScreen/OtpScreen/signUpScreen_controller.dart';
import 'package:yitirdim/Theme/constants.dart';

CheckboxListTile checkBoxing(SignUpController signUpController) {
  return CheckboxListTile(
    value: signUpController.checkBox.value,
    fillColor: MaterialStateProperty.all(Colors.transparent),
    side: MaterialStateBorderSide.resolveWith((states) {
      if (states.contains(MaterialState.pressed)) {
        return BorderSide(color: AppConstants().mainColor);
      } else {
        return BorderSide(color: AppConstants().mainColor);
      }
    }),
    checkColor: AppConstants().mainColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    onChanged: (value) {
      signUpController.ticking(value);
    },
    title: Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        'Şahsy maglumatlarymyň gaýtadan işlenmegi hakda habarly bolmagym üçin telefona iberilmegini kabul edýärin.',
        style: TextStyle(
          color: AppConstants().greyColor,
          fontFamily: 'Comfortaa-SemiBold',
          fontSize: 14,
        ),
        textAlign: TextAlign.start,
        softWrap: true,
      ),
    ),
    controlAffinity: ListTileControlAffinity.leading,
  );
}
