import 'package:get/get.dart';

class ProductProfileController extends GetxController {
  RxInt changeDots = 0.obs;
  RxString name = 'User'.obs;

  void swapDots(value) {
    changeDots.value = value;
    update();
  }

  updatevalue(nameValue) {
    name.value = nameValue;
    update();
  }
}
