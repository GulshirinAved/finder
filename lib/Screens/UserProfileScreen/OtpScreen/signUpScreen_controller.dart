import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool obscureText = false.obs;
  RxBool obscure1Text = false.obs;
  RxBool checkBox = false.obs;
  RxBool signInAnimation = true.obs;
  void showPass() {
    obscureText.value = !obscureText.value;
    update();
  }

  void show1Pass() {
    obscure1Text.value = !obscure1Text.value;
    update();
  }

  void ticking(value) {
    checkBox.value = value;
    update();
  }

  changeSignInAnimation() {
    if (signInAnimation.isTrue) {
      signInAnimation.toggle();
    } else {
      signInAnimation.value = true;
    }
  }
}
