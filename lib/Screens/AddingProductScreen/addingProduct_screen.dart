import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:yitirdim/API/data/services/posts/userPost_service.dart';
import 'package:yitirdim/Screens/AddedArticleScreen/addingArticle_screen.dart';
import 'package:yitirdim/Screens/AddingProductScreen/addingProductScreen_controller.dart';
import 'package:yitirdim/Screens/AddingProductScreen/components/all_tiles.dart';
import 'package:yitirdim/Screens/AddingProductScreen/components/images_tile.dart';
import 'package:yitirdim/Screens/AddingProductScreen/components/select_button.dart';

import 'package:yitirdim/Screens/AllProductsScreen/CategoryFilterScreen/subCategoryFilter_screen.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/locationScreen_controller.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/location_screen.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';
import 'package:yitirdim/Screens/CustomWidgets/showSnack_bar.dart';
import 'package:yitirdim/Screens/UserProfileScreen/LoginScreen/login_screen.dart';
import 'package:yitirdim/Theme/constants.dart';

class AddingProductScreen extends StatelessWidget {
  const AddingProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddingProductScreenController controller =
        Get.find<AddingProductScreenController>();
    LOcationScreenController locationController =
        Get.find<LOcationScreenController>();
    TextEditingController titleController = TextEditingController();
    TextEditingController dayController = TextEditingController();
    TextEditingController extraDetailController = TextEditingController();
    TextEditingController heightController = TextEditingController();
    TextEditingController weightController = TextEditingController();

    var pickedData;
    Box dataBox = Hive.box('api');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        number: 3,
        title: "addingAd".tr,
        needLeading: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // shrinkWrap: true,
            children: [
              StatusTile(
                extraInfo: false,
                topTitle: "status".tr,
                number: 1,
                title: "status".tr,
              ),
              StatusTile(
                extraInfo: true,
                number: 2,
                topTitle: "name".tr,
                hintText: "Adyny yazyn...",
                textController: titleController,
                onTap: () {
                  controller.titleChange(titleController.value);
                },
              ),
              Obx(() => GestureDetector(
                    onTap: () {
                      Get.to(() => LocationScreen(
                            number: 1,
                          ));
                    },
                    child: StatusTile(
                      title: locationController.allLocationNaming.value == ''
                          ? 'noSelection'.tr
                          : locationController.allLocationNaming.value,
                      number: 3,
                      topTitle: 'location'.tr,
                    ),
                  )),
              GestureDetector(
                  onTap: () async {
                    pickedData = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2101));
                    if (pickedData != null) {
                      dayController.text =
                          DateFormat('dd.MM.yyyy').format(pickedData!);
                      controller.time.value = dayController.text;
                    }
                  },
                  child: StatusTile(
                    title: controller.time.value == ''
                        ? 'noSelection'.tr
                        : controller.time.value,
                    number: 4,
                    topTitle: "time".tr,
                    textController: dayController,
                  )),
              StatusTile(
                number: 2,
                topTitle: "extraInfo".tr,
                textController: extraDetailController,
                maxLine: 2,
                hintText: "Maglumat...",
                onTap: () {
                  controller.extraInfoChange(extraDetailController.text);
                },
              ),
              GetBuilder<AddingProductScreenController>(
                builder: (_) {
                  return GestureDetector(
                      onTap: () {
                        showDialogColor(context);
                      },
                      child: StatusTile(
                        number: 5,
                        topTitle: "color".tr,
                        onTap: Get.find<AddingProductScreenController>()
                            .selectionColor,
                      ));
                },
              ),
              Row(
                children: [
                  StatusTile(
                    number: 2,
                    isTall: 100,
                    topTitle: "Sypaty".tr,
                    textController: heightController,
                    maxLine: 2,
                    hintText: "height".tr + '...',
                    onTap: () {
                      controller.heightInfo(heightController.text);
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 15,
                    width: 1,
                    color: Theme.of(context).backgroundColor.withOpacity(0.5),
                  ),
                  StatusTile(
                    number: 2,
                    isTall: 100,
                    topTitle: "".tr,
                    textController: weightController,
                    maxLine: 2,
                    hintText: 'weight'.tr + '...',
                    onTap: () {
                      controller.weightInfo(weightController.text);
                    },
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SubCatgeoryFilterScreen(
                        number: 1,
                      ));
                },
                child: Obx(() => StatusTile(
                      number: 3,
                      topTitle: "category".tr,
                      title: locationController
                                  .verifySelectedCategoryListAdd.value ==
                              ''
                          ? 'noSelection'.tr
                          : locationController
                              .verifySelectedCategoryListAdd.value
                              .toString(),
                    )),
              ),
              ImageTile(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(
          title: "add".tr,
          ontap: () {
            dataBox.get('accessToken') == null
                ? Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogInScreen()))
                : titleController.text == '' ||
                        locationController.allLocationNaming.value == '' ||
                        controller.time.value == '' ||
                        extraDetailController.text == '' ||
                        locationController
                                .verifySelectedCategoryListAdd.value ==
                            '' ||
                        controller.selectedImageList.isEmpty
                    ? showSnackBar("Yalnyahlyk", "Doly we dogry doldurun",
                        AppConstants().redColor, 1)
                    : userPost(
                            locationController.categoryId1.value,
                            locationController.rayonId.value,
                            controller.type_id.value,
                            controller.colorId.value,
                            jsonDecode(dataBox.get('data'))['id'],
                            titleController.text,
                            controller.titleText.value,
                            extraDetailController.text,
                            controller.extraInfo.value,
                            dataBox.get('data') == null
                                ? 0
                                : int.parse(jsonDecode(
                                    dataBox.get('data'))['phoneNumber']),
                            controller.selectedImageList,
                            dataBox.get('accessToken'),
                            controller.time.value,
                            controller.height.value,
                            controller.weight.value)
                        .then((value) => value == true
                            ? Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddingArticleScreen()))
                            : null);
          }),
    );
  }
}
