import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yitirdim/Theme/theme/theme_service.dart';

class SettingsController extends GetxController {
  RxBool theme = false.obs;

  var box = Hive.box('api');
  dynamic selectionLanguage(int language) {
    if (language == 1) {
      Get.updateLocale(Locale('ru'));
      box.put('lancode', 'ru');
    } else {
      Get.updateLocale(Locale('tkm'));
      box.put('lancode', 'tkm');
    }
    update();
  }

  theming() {
    theme.value = ThemeService().isSavedDarkMode() ?? false;
    update();
  }
}
