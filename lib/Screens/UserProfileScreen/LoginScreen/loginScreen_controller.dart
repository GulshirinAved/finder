import 'package:get/get.dart';

class LogInController extends GetxController {
  RxBool obscureText = false.obs;
  RxBool obscure1Text = false.obs;
  RxBool checkBox = false.obs;
  RxBool expanded = false.obs;
  String otp = '';
  void showPass() {
    obscureText.value = !obscureText.value;
    update();
  }

  void show1Pass() {
    obscure1Text.value = !obscure1Text.value;
    update();
  }

  void converting() {
    expanded.value = true;
    update();
  }
}
