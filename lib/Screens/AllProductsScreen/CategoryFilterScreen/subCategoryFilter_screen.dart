import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yitirdim/API/data/services/allcategories_services.dart';
import 'package:yitirdim/Screens/AddingProductScreen/components/select_button.dart';
import 'package:yitirdim/Screens/AllProductsScreen/CategoryFilterScreen/categoryFilterScreen_controller.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/locationScreen_controller.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/rayonScreen.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';
import 'package:yitirdim/Theme/constants.dart';

class SubCatgeoryFilterScreen extends StatefulWidget {
  final int number;
  SubCatgeoryFilterScreen({super.key, required this.number});

  @override
  State<SubCatgeoryFilterScreen> createState() =>
      _SubCatgeoryFilterScreenState();
}

class _SubCatgeoryFilterScreenState extends State<SubCatgeoryFilterScreen> {
  @override
  Widget build(BuildContext context) {
    FilterController filterController =
        Get.put(FilterController(), permanent: true);
    LOcationScreenController locationController =
        Get.put(LOcationScreenController());
    return Scaffold(
      // backgroundColor: AppConstants().whiteColor,
      appBar: CustomAppBar(
        number: 3,
        title: 'categories'.tr,
        needLeading: true,
        needDelete: true,
        widget: Obx(() => IconButton(
              onPressed: () {
                locationController.categoryList.clear();
                locationController.categoryList2.clear();
                locationController.categoryListAdd.clear();
              },
              icon: Text(
                "Arassalamak",
                style: TextStyle(
                    fontFamily: 'Comfortaa-SemiBold',
                    color: widget.number == 0
                        ? locationController.categoryList.value.isNotEmpty
                            ? AppConstants().redColor
                            : AppConstants().greyColor
                        : widget.number == 1
                            ? locationController
                                    .categoryListAdd.value.isNotEmpty
                                ? AppConstants().redColor
                                : AppConstants().greyColor
                            : widget.number == 2
                                ? locationController.categoryList2.isNotEmpty
                                    ? AppConstants().redColor
                                    : AppConstants().greyColor
                                : AppConstants().greyColor),
              ),
            )),
      ),
      body: FutureBuilder(
          future: AllcategoryServices().getMainCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: ExpansionPanelList.radio(
                  dividerColor: AppConstants().whiteColor,
                  elevation: 0,
                  animationDuration: Duration(milliseconds: 600),
                  expandedHeaderPadding: EdgeInsets.zero,
                  expansionCallback: (int index, bool expanded) {
                    filterController.expandedChanging(expanded, index);
                  },
                  children: snapshot.data.map<ExpansionPanelRadio>((category) {
                    return ExpansionPanelRadio(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        canTapOnHeader: true,
                        value: category,
                        headerBuilder: (context, isExpanded) {
                          return Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: isExpanded
                                  ? SvgPicture.asset(
                                      color: AppConstants().mainColor,
                                      "assets/svg_icons/drop_down.svg",
                                    )
                                  : SvgPicture.asset(
                                      color: AppConstants().mainColor,
                                      "assets/svg_icons/direction-down.svg",
                                    ),
                            ),
                            Text(category.name_tm)
                          ]);
                        },
                        body: FutureBuilder(
                            future: AllcategoryServices()
                                .getCategories(category.id),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: category.child.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, childIndex) {
                                    final child = category.child[childIndex];
                                    return Obx(() => CheckBox(
                                        value: widget.number == 0
                                            ? locationController.categoryList
                                                .contains(child.id)
                                            : widget.number == 1
                                                ? locationController
                                                    .categoryListAdd
                                                    .contains(child.id)
                                                : widget.number == 2
                                                    ? locationController
                                                        .categoryList2
                                                        .contains(child.id)
                                                    : false,
                                        locationController: locationController,
                                        title: child.name_tm,
                                        onChanged: widget.number == 0
                                            ? (value) {
                                                locationController
                                                    .addingCategory(
                                                        child.id, value!);
                                              }
                                            : widget.number == 1
                                                ? (value) {
                                                    locationController
                                                        .addingCategoryAdd(
                                                            value!, child.id);
                                                    locationController
                                                        .selectedCategory(
                                                            category.name_tm,
                                                            child.name_tm,
                                                            child.id);
                                                  }
                                                : widget.number == 2
                                                    ? (value) {
                                                        locationController
                                                            .addingCategory2(
                                                                child.id,
                                                                value!);
                                                      }
                                                    : (value) {}));
                                  },
                                );
                              }

                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              } else {
                                return SizedBox.shrink();
                              }
                            }));
                  }).toList(),
                ),
              );
            } else {
              return SizedBox();
            }
          }),
      bottomNavigationBar: CustomButton(ontap: () {
        widget.number == 0
            ? locationController
                .addingVerifiedCategory(locationController.categoryList.value)
            : widget.number == 1
                ? locationController.selectedCategoryVerify(
                    locationController.categoryId.value,
                  )
                : locationController.addingVerifiedCategory2(
                    locationController.categoryList2.value);
        Get.back();
      }),
    );
  }
}
