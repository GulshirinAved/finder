import 'package:get/get.dart';

class AllProductsScreenController extends GetxController {
  RxString searchText = ''.obs;
  RxBool loading = false.obs;

  searchingText(searchTextController) {
    searchText.value = searchTextController;

    update();
  }
}
