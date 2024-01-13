import 'package:flutter/material.dart';
import 'package:yitirdim/Theme/constants.dart';

class LightThemeConst {
  final lightTheme = ThemeData.light().copyWith(
      useMaterial3: true,
      focusColor: AppConstants().greyColor1,
      dialogBackgroundColor: AppConstants().whiteColor,
      highlightColor: AppConstants().whiteColor.withOpacity(0.5),
      drawerTheme: DrawerThemeData(backgroundColor: AppConstants().whiteColor),
      dividerColor: AppConstants().blackColor,
      scaffoldBackgroundColor: AppConstants().whiteColor,
      cardColor: AppConstants().darkColor,
      hintColor: AppConstants().greyColor,
      primaryColor: AppConstants().whiteColor,
      bottomSheetTheme: BottomSheetThemeData(
        shadowColor: AppConstants().whiteColor,
        surfaceTintColor: AppConstants().whiteColor,
        backgroundColor: AppConstants().whiteColor,
      ),
      colorScheme: ColorScheme.light(
        background: AppConstants().greyColor1,
        onBackground: AppConstants().greyColor1,
      ),
      textTheme: TextTheme(
          bodyMedium: TextStyle(color: AppConstants().darkBlue),
          bodySmall: TextStyle(color: AppConstants().darkBlue),
          bodyLarge: TextStyle(color: AppConstants().darkBlue),
          titleLarge: TextStyle(color: AppConstants().darkBlue),
          titleMedium: TextStyle(color: AppConstants().darkBlue),
          titleSmall: TextStyle(color: AppConstants().darkBlue),
          labelLarge: TextStyle(color: AppConstants().darkBlue),
          labelMedium: TextStyle(color: AppConstants().darkBlue),
          labelSmall: TextStyle(color: AppConstants().darkBlue),
          headlineSmall: TextStyle(color: AppConstants().darkBlue),
          headlineLarge: TextStyle(color: AppConstants().darkBlue),
          headlineMedium: TextStyle(color: AppConstants().darkBlue),
          displayLarge: TextStyle(color: AppConstants().darkBlue)),
      appBarTheme: AppBarTheme(
        backgroundColor: AppConstants().whiteColor,
        foregroundColor: AppConstants().whiteColor,
        surfaceTintColor: AppConstants().whiteColor,
        // color: AppConstants().whiteColor,
        // systemOverlayStyle: SystemUiOverlayStyle.light,
        toolbarTextStyle:
            TextTheme(displayLarge: TextStyle(color: AppConstants().darkBlue))
                .displayLarge,
        titleTextStyle:
            TextTheme(displayLarge: TextStyle(color: AppConstants().darkBlue))
                .displayLarge,
      ),
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      iconTheme: IconThemeData(
        color: AppConstants().mainColor,
      ),
      datePickerTheme: DatePickerThemeData(
          backgroundColor: AppConstants().greyColor1,
          surfaceTintColor: AppConstants().greyColor1),
      canvasColor: AppConstants().darkBlue,
      backgroundColor: AppConstants().blackColor);
}
