import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController showSnackBar(
    String title, String subtitle, Color color, posNum) {
  return Get.snackbar(
    title,
    subtitle,
    snackStyle: SnackStyle.FLOATING,
    titleText: title == ""
        ? const SizedBox.shrink()
        : Text(
            title.tr,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontFamily: 'Comfortaa-SemiBold',
            ),
          ),
    messageText: Text(
      subtitle.tr,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontFamily: 'Comfortaa-SemiBold',
      ),
    ),
    snackPosition: posNum == null ? SnackPosition.BOTTOM : SnackPosition.TOP,
    backgroundColor: color,
    borderRadius: 10.0,
    margin: const EdgeInsets.all(8),
  );
}
