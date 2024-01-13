import 'package:get/get.dart';
import 'package:yitirdim/Screens/AddingProductScreen/addingProductScreen_controller.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/locationScreen_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddingProductScreenController>(
        () => AddingProductScreenController(),
        fenix: true);
    Get.lazyPut<LOcationScreenController>(() => LOcationScreenController(),
        fenix: true);
  }
}
