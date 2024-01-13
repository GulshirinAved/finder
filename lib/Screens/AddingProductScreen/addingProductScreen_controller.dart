import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddingProductScreenController extends GetxController {
  var select;
  var selectLocation;
  var selectedLocation;
  var selectVelayat;
  var value1;
  RxBool open = false.obs;
  RxString selectionColor = ''.obs;
  RxString categoryTitle = ''.obs;
  RxBool isExpanded = false.obs;
  List<String> selectedImageList = [];
  RxString time = ''.obs;
  int maxLength = 3;
  RxString titleText = ''.obs;
  RxString extraInfo = ''.obs;
  List<Map<String, dynamic>> allInfoForAddingList = [];
  var infoList = [].obs;
  RxString statusTitle = ''.obs;
  RxInt type_id = 0.obs;
  RxInt colorId = 0.obs;
  RxString nameText = ''.obs;
  RxString height = ''.obs;
  RxString weight = ''.obs;

  void choiceStatus(value, title, typeId) {
    select = value;
    statusTitle.value = title;
    type_id.value = typeId;
    update();
  }

  void expandedChanging(bool expanded, int index) {
    isExpanded.value = expanded;
    update();
  }

  void selectionLocation(value, velayat) {
    selectLocation = value;
    selectVelayat = velayat;
    update();
  }

  void showSelectedLocation() {
    selectedLocation = selectVelayat + ',' + selectLocation;
    update();
  }

  chooseColor(String color, id) {
    selectionColor.value = color;
    colorId.value = id;
    update();
  }

  void getImagesCamera(ImageSource imageSource) async {
    XFile? pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      addingImages([pickedFile]);
    }
    Get.back();
  }

  void getImagesGallery() async {
    final List<XFile>? pickedFile = await ImagePicker().pickMultiImage();
    addingImages(pickedFile);
    Get.back();
  }

  void addingImages(images) {
    for (int i = 0; i < images.length; i++) {
      if (selectedImageList.length < maxLength) {
        selectedImageList.add(images[i].path);
      } else {
        break;
      }
    }

    update();
  }

  void removeImage(imageFile) {
    selectedImageList.remove(imageFile);
    update();
  }

  void titleChange(title) {
    titleText.value = title;

    update();
  }

  void extraInfoChange(extraText) {
    extraInfo.value = extraText;
    update();
  }

  void heightInfo(heightText) {
    height.value = heightText;
    update();
  }

  void weightInfo(weightText) {
    weight.value = weightText;
    update();
  }
}
