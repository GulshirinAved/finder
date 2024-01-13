import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomePageController extends GetxController {
  RxString selectedLocation = ''.obs;
  RxString mainTitle = ''.obs;
  RxString finalSelectedVelayatId = ''.obs;
  RxInt selectedIndex = 0.obs;
  RxInt selectionIndexContainer = RxInt(-1);
  RxInt categoryId = 0.obs;
  RxInt subCategoryId = 0.obs;
  RxString velayat1 = ''.obs;
  RxString velayat = ''.obs;
  RxString velayatName = ''.obs;
  RxString velayatName1 = ''.obs;
  RxList todayData = [].obs;
  RxList weekData = [].obs;
  RxList vipData = [].obs;
  RxList lotData = [].obs;

  // '''''
  RxInt appBarSelection = RxInt(0);
  RxInt nullCheckingAppbar = RxInt(0);

  Box dataBox = Hive.box('api');

  changingSelection(index, name) async {
    selectedIndex.value = index;
    // velayat.value = name;
    // velayat1.value = name1;

    await dataBox.put('velayat', name);

    // await dataBox.put('velayat1', velayat1.value);

    update();
  }

  reading() async {
    velayatName.value = dataBox.get('velayat1');
    velayatName1.value = dataBox.get('velayat');
    update();
  }

  changingIndexContainer(index) {
    selectionIndexContainer.value = index;
    update();
  }

  categoryIdUpdate(name) {
    categoryId.value = name;
    selectionIndexContainer.value == -1;
    update();
  }

  chagingSubParentId(parentId) {
    subCategoryId.value = parentId;
    update();
  }
}
