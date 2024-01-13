import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt tabIndex = 0.obs;
  void selection(int index) {
    tabIndex.value = index;

    update();
  }
}
