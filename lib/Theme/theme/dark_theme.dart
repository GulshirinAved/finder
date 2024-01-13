import 'package:flutter/material.dart';
import 'package:yitirdim/Theme/constants.dart';

class DarkThemeConst {
  final darkTheme = ThemeData.dark().copyWith(
      useMaterial3: true,
      dialogBackgroundColor: AppConstants().blackColor,
      highlightColor: AppConstants().blackColor.withOpacity(0.5),
      focusColor: AppConstants().darkBlue.withOpacity(0.5),
      dividerColor: AppConstants().whiteColor,
      hintColor: Colors.white.withOpacity(.5),
      primaryColor: AppConstants().darkPurple,
      bottomSheetTheme: BottomSheetThemeData(
        shadowColor: AppConstants().greyColor,
        surfaceTintColor: AppConstants().greyColor,
        backgroundColor: AppConstants().greyColor,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: AppConstants().darkColor),
      scaffoldBackgroundColor: AppConstants().darkColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppConstants().darkColor,
          selectedItemColor: AppConstants().darkBlue),
      cardColor: AppConstants().darkColor,
      colorScheme: ColorScheme.dark(
        background: AppConstants().greyColor1,
        onBackground: AppConstants().darkColor,
      ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: AppConstants().whiteColor),
        bodySmall: TextStyle(color: AppConstants().whiteColor),
        bodyLarge: TextStyle(color: AppConstants().whiteColor),
        titleLarge: TextStyle(color: AppConstants().whiteColor),
        titleMedium: TextStyle(color: AppConstants().whiteColor),
        titleSmall: TextStyle(color: AppConstants().whiteColor),
        labelLarge: TextStyle(color: AppConstants().whiteColor),
        labelMedium: TextStyle(color: AppConstants().whiteColor),
        labelSmall: TextStyle(color: AppConstants().whiteColor),
        headlineSmall: TextStyle(color: AppConstants().whiteColor),
        headlineLarge: TextStyle(color: AppConstants().whiteColor),
        headlineMedium: TextStyle(color: AppConstants().whiteColor),
        displayLarge: TextStyle(color: AppConstants().whiteColor),
        displaySmall: TextStyle(color: AppConstants().whiteColor),
        displayMedium: TextStyle(color: AppConstants().whiteColor),
      ),
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      appBarTheme: AppBarTheme(
          foregroundColor: Color.fromARGB(255, 24, 29, 34),
          surfaceTintColor: Color.fromARGB(255, 24, 29, 34),
          backgroundColor: const Color.fromARGB(255, 24, 29, 34),
          toolbarTextStyle: TextTheme(
                  displayLarge: TextStyle(color: AppConstants().whiteColor))
              .displayLarge,
          titleTextStyle: TextTheme(
                  displayLarge: TextStyle(color: AppConstants().whiteColor))
              .displayLarge),
      iconTheme: IconThemeData(
        color: AppConstants().whiteColor,
      ),
      canvasColor: AppConstants().whiteColor,
      backgroundColor: AppConstants().whiteColor,
      datePickerTheme: DatePickerThemeData(
          backgroundColor: AppConstants().mainColor,
          todayBackgroundColor:
              MaterialStatePropertyAll(AppConstants().whiteColor)));
}
