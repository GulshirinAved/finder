import 'package:get/get.dart';

class LOcationScreenController extends GetxController {
  RxList locationList = [].obs;
  RxList locationListAdd = [].obs;
  RxList verifyLocationList = [].obs;
  RxList verifyLocationListAdd = [].obs;
  RxInt velayatId = 0.obs;
  RxInt rayonId = 0.obs;
  RxInt categoryId = 0.obs;
  RxInt categoryId1 = 0.obs;

  List allProducts = [].obs;
  List allProducts2 = [].obs;

  RxList categoryList = [].obs;
  RxList categoryList2 = [].obs;

  RxList categoryListAdd = [].obs;

  RxList verifyCategoryList = [].obs;
  RxList verifyCategoryList2 = [].obs;
  RxList verifyCategoryList3 = [].obs;

  RxList verifyCategoryListAdd = [].obs;
  RxString verifySelectedCategoryListAdd = ''.obs;

  RxString selectedCategoryAdd = ''.obs;
  RxString verifyAddCategory = ''.obs;

  RxBool selectedLocation = false.obs;
  RxString nameRayon = ''.obs;
  RxString nameRayonV = ''.obs;

  RxString nameVelayat = ''.obs;
  RxString allLocationNaming = ''.obs;

  void namingLocation(bool checked, int titles) {
    if (checked) {
      if (locationListAdd.isEmpty) {
        locationListAdd.add(titles);
      } else {
        locationListAdd.clear();
        locationListAdd.add(titles);
      }
    } else {
      locationListAdd.removeWhere((item) => item == titles);
    }
    update();
  }

  void addingLocation(
    int titles,
    bool checked,
  ) {
    if (checked) {
      locationList.add(titles);
    } else {
      locationList.removeWhere((item) => item == titles);
    }
    update();
  }

  void addingVerifiedLocation(checkedList) {
    verifyLocationList.value = checkedList;
    update();
  }

  void addingVerifiedLocationAdd(checkedList) {
    verifyLocationListAdd.value = checkedList;
    update();
  }

  void addingCategory(
    int titles,
    bool checked,
  ) {
    if (checked) {
      categoryList.add(titles);
    } else {
      categoryList.removeWhere((item) => item == titles);
    }
    update();
  }

  void addingCategory2(
    int titles,
    bool checked,
  ) {
    if (checked) {
      categoryList2.add(titles);
    } else {
      categoryList2.removeWhere((item) => item == titles);
    }
    update();
  }

  void addingCategoryAdd(bool checked, int titles) {
    if (checked) {
      if (categoryListAdd.isEmpty) {
        categoryListAdd.add(titles);
      } else {
        categoryListAdd.clear();
        categoryListAdd.add(titles);
      }
    } else {
      categoryListAdd.removeWhere((item) => item == titles);
    }
    update();
  }

  void addingVerifiedCategory(checkedList) {
    verifyCategoryList.value = checkedList;

    update();
  }

  void addingVerifiedCategory2(checkedList) {
    verifyCategoryList2.value = checkedList;

    update();
  }

  void addingVerifiedCategoryAdd(List checkedList) {
    verifyCategoryListAdd.value = checkedList;

    update();
  }

  selectedCategory(categoryname, maincategory, catgeory_id) {
    selectedCategoryAdd.value = categoryname + ',' + maincategory;
    categoryId.value = catgeory_id;
    update();
  }

  selectedCategoryVerify(category_id) {
    verifySelectedCategoryListAdd.value = selectedCategoryAdd.value;
    categoryId1.value = category_id;
    update();
  }

  void selectionLocation(velayat, velayat_id, rayon_id) {
    nameRayonV.value = nameRayon.value;
    nameVelayat.value = velayat;
    allLocationNaming.value = nameRayonV.value + ',' + nameVelayat.value;
    velayatId.value = velayat_id;
    rayonId.value = rayon_id;
    update();
  }

  // void showSelectedLocation() {
  //   allLocationNaming.value = nameRayonV.value + ',' + nameVelayat.value;
  //   update();
  // }
}
