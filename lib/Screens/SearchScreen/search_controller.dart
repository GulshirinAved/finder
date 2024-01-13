import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:yitirdim/API/data/models/filter_model.dart';
import 'package:yitirdim/API/data/services/posts/post_service.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/locationScreen_controller.dart';

class SEarchScreenController extends GetxController {
  final int limit = 20;
  int page = 1;
  var searchListData = <Data>[].obs;
  RxString searchText = ''.obs;
  RxBool loading = false.obs;
  var hasMore = true.obs;
  Future getSearch(name, location, category) async {
    try {
      List<Data> response =
          await PostService().searchProducts(name, page, location, category);
      if (response.length < limit) {
        hasMore.value = false;
      }
      searchListData.addAll(response);
      page++;
    } catch (e) {}
  }

  Future refreshData(name, location, category) async {
    page = 1;
    hasMore.value = true;
    searchListData.value = [];
    await getSearch(name, location, category);
  }

  searchingText(searchTextController) {
    searchText.value = searchTextController;

    update();
  }
}
