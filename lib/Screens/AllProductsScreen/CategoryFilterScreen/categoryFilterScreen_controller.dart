import 'package:get/get.dart';

class FilterController extends GetxController {
  void expandedChanging(bool expanded, int index) {
    RxBool isExpanded = false.obs;
    isExpanded.value = expanded;
    update();
  }

  RxList subCategoryList = [].obs;
  void addingToList(String titles, bool checked) {
    if (checked) {
      subCategoryList.add(titles);
    } else {
      subCategoryList.removeWhere((item) => item == titles);
    }
    update();
  }
}
