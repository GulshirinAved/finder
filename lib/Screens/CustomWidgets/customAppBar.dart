import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:yitirdim/API/data/services/allcategories_services.dart';

import 'package:yitirdim/Screens/HomePageScreen/components/textFields.dart';
import 'package:yitirdim/Screens/HomePageScreen/homePage_controller.dart';
import 'package:yitirdim/Screens/SearchScreen/search_screen.dart';
import 'package:yitirdim/Theme/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final int number;
  VoidCallback? onTap;
  TextEditingController? searchController;
  String? title;
  bool? needBottom;
  String? subCategory;
  int? index;
  bool? needFilter;
  bool? needLeading;
  bool? needHeart;
  String? image;
  int? parent_id;
  int? id;
  int? child_id;
  Function()? onEditingComplete;
  bool? needDelete;
  Widget? widget;

  CustomAppBar(
      {super.key,
      required this.number,
      this.searchController,
      this.onTap,
      this.title,
      this.needBottom,
      this.subCategory,
      this.index,
      this.needFilter,
      this.needLeading,
      this.needHeart,
      this.image,
      this.parent_id,
      this.id,
      this.onEditingComplete,
      this.needDelete,
      this.widget});

  @override
  Widget build(BuildContext context) {
    HomePageController homeController = Get.put(HomePageController());
    List subCategories = [];

    for (var item in imageTitle) {
      if (item['title'] == title) {
        subCategories = List.from(item['subCategory']);
      }
    }
    return number == 1
        ? appbarWithTabBar(context)
        : AppBar(
            // backgroundColor: AppConstants().whiteColor,
            elevation: 0,
            toolbarHeight: 65,
            centerTitle: true,
            leadingWidth: 34.0,
            automaticallyImplyLeading: false,
            leading: needLeading == true
                ? Material(
                    color: AppConstants().transpColor,
                    child: InkWell(
                      onTap: () {
                        // Get.back();
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 11),
                        child: Icon(
                          IconlyLight.arrowLeftCircle,

                          color: Theme.of(context).iconTheme.color,

                          // color: AppConstants().mainColor,
                        ),
                      ),
                    ),
                  )
                : null,
            titleSpacing: 0.0,
            scrolledUnderElevation: 0.0,
            actions: number == 2
                ? [
                    GestureDetector(
                      onTap: onTap,
                      child: Container(
                        height: 50,
                        width: 50,
                        margin: EdgeInsets.only(bottom: 4, right: 5, top: 3.2),
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onBackground,
                            borderRadius: AppConstants().borderRadius7,
                            border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .background
                                    .withOpacity(0.1))),
                        child: Icon(
                          IconlyBold.filter2,
                          color: Theme.of(context).iconTheme.color,
                        ),
                      ),
                    ),
                  ]
                : needFilter == true
                    ? [
                        IconButton(
                          onPressed: onTap,
                          icon: Icon(
                            IconlyBold.filter2,
                            color: AppConstants().mainColor,
                          ),
                        )
                      ]
                    : needDelete == true
                        ? [widget!]
                        : [],
            title: number == 2
                ? Container(
                    alignment: Alignment.center,
                    width: Get.size.width,
                    margin: EdgeInsets.only(left: 10, right: 5),
                    child: TextFieldsSearch(
                      searchController: searchController!,
                      onEditingComplete: onEditingComplete,
                    ),
                  )
                : Text(
                    title.toString(),
                    style: TextStyle(
                      fontFamily: 'Comfortaa-SemiBold',
                      fontSize: AppConstants().fontSize20,
                      fontWeight: FontWeight.w500,
                      // color: AppConstants().darkBlue
                    ),
                  ),
            bottom: needBottom == true
                ? PreferredSize(
                    preferredSize: Size.fromHeight(0),
                    child: Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FutureBuilder(
                            future: AllcategoryServices().getSubCategory(
                                homeController.selectionIndexContainer.value ==
                                        0
                                    ? 4
                                    : homeController.categoryId.value,
                                homeController.selectionIndexContainer.value),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.only(left: 2),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        homeController.chagingSubParentId(
                                            snapshot.data[index].id);

                                        homeController
                                            .changingIndexContainer(index);
                                      },
                                      child: CardForSubCategory(
                                        homeController: homeController,
                                        index: index,
                                        title: Get.locale!.languageCode == 'tkm'
                                            ? snapshot.data[index].name_tm
                                            : snapshot.data[index].name_ru,
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return SizedBox();
                              }
                            }),
                      ),
                    ))
                : null,
          );
  }

  AppBar appbarWithTabBar(BuildContext context) {
    Box dataBox = Hive.box('api');

    return AppBar(
      backgroundColor: AppConstants().mainColor.withOpacity(0.3),
      iconTheme: IconThemeData(color: AppConstants().mainColor),
      title: Text(
        "Finder",
        style: TextStyle(
            fontFamily: 'Comfortaa-SemiBold',
            fontWeight: FontWeight.w700,
            fontSize: AppConstants().fontSize20),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            _showDialog(context);
          },
          child: Row(
            children: [
              GetBuilder<HomePageController>(
                initState: (_) {},
                builder: (_) {
                  // Retrieve the saved value from local storage
                  String selectedVelayat = dataBox.get('velayat') ?? 'ashgabat';
                  // Display the translated value
                  return Text(
                    selectedVelayat.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Comfortaa-SemiBold',
                    ),
                  );
                },
              ),
              iconButton(IconlyLight.location, () {
                _showDialog(context);
              }, 30, 20),
            ],
          ),
        ),
        iconButton(IconlyLight.search, () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
        }, 30, 20)
      ],
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: TabBar(
            automaticIndicatorColorAdjustment: false,
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            tabs: [
              Container(
                width: Get.width / 2.5,
                child: Tab(
                  text: 'lost'.tr,
                ),
              ),
              Container(
                width: Get.width / 2.5,
                child: Tab(
                  text: Get.locale!.languageCode == 'tkm'
                      ? 'Tapylan'
                      : 'Найденный',
                ),
              ),
            ],
            indicatorColor: AppConstants().mainColor,
            isScrollable: true,
            indicatorWeight: 1.3,
            unselectedLabelColor: AppConstants().greyColor.withOpacity(0.5),
            unselectedLabelStyle: TextStyle(
              fontSize: AppConstants().fontSize18,
              fontWeight: FontWeight.w400,
              fontFamily: 'Comfortaa-SemiBold',
              // color: AppConstants().blueColor
            ),
            labelColor: AppConstants().mainColor,
            dividerColor: AppConstants().transpColor,
            labelStyle: TextStyle(
              fontSize: AppConstants().fontSize18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Comfortaa-SemiBold',
              // color: AppConstants().mainColor
            ),
          )),
    );
  }

  void _showDialog(context) {
    HomePageController homeController = Get.put(HomePageController());

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        surfaceTintColor: Theme.of(context).dialogBackgroundColor,
        insetAnimationCurve: Curves.bounceInOut,
        shadowColor: Theme.of(context).dialogBackgroundColor,
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        shape:
            RoundedRectangleBorder(borderRadius: AppConstants().borderRadius8),
        child: Container(
          margin: EdgeInsets.all(10).copyWith(top: 0),
          height: 270,
          width: 200,
          child: Stack(
            children: [
              Positioned.fill(
                top: 7,
                // left: 18,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'selectLocation'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Comfortaa-SemiBold',
                        fontSize: AppConstants().fontSize14,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Positioned(
                top: -10,
                right: -18,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          CupertinoIcons.clear,
                          size: 17,
                          color: AppConstants().redColor,
                        ))
                  ],
                ),
              ),
              Container(
                  width: Get.width,
                  margin: EdgeInsets.only(top: 30),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: velayatRu.keys.length,
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          homeController.changingIndexContainer(index);
                          homeController.changingSelection(
                            index,
                            Get.locale!.languageCode == 'tkm'
                                ? velayatTm.values.toList()[index]
                                : velayatRu.values.toList()[index],
                          );
                          Get.back();
                        },
                        child: Obx(() => Container(
                              alignment: Alignment.center,
                              height: 30,
                              width: Get.width,
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: homeController
                                                .selectionIndexContainer
                                                .value ==
                                            index
                                        ? AppConstants().mainColor
                                        : AppConstants().whiteColor),
                                borderRadius: BorderRadius.circular(5),
                                color:
                                    AppConstants().blueColor.withOpacity(0.2),
                              ),
                              child: Text(
                                Get.locale!.languageCode == 'tkm'
                                    ? velayatTm.keys.toList()[index]
                                    : velayatRu.keys.toList()[index],
                                textAlign: TextAlign.center,
                              ),
                            ))),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget iconButton(IconData icon, VoidCallback onTap, double containerSize,
      double? iconSize) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: containerSize,
        width: containerSize,
        margin: EdgeInsets.only(right: 5, left: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppConstants().transpColor,
            border: Border.all(color: AppConstants().mainColor, width: 1.5)),
        child: Icon(
          icon,
          size: iconSize,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(number == 1
      ? 90
      : needBottom == true
          ? 100
          : 56);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}

class CardForSubCategory extends StatelessWidget {
  final int index;
  final String title;
  final HomePageController homeController;
  const CardForSubCategory(
      {super.key,
      required this.index,
      required this.title,
      required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: 65,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: AppConstants().borderRadius10,
          border: Border.all(
            color: homeController.selectionIndexContainer.value == index
                ? AppConstants().mainColor
                : AppConstants().greyColor1,
          ),
        ),
        margin: EdgeInsets.all(4),
        alignment: Alignment.center,
        child: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'Comfortaa-SemiBold',
              fontWeight: FontWeight.w500,
              color: homeController.selectionIndexContainer.value == index
                  ? AppConstants().mainColor
                  : Theme.of(context).dividerColor),
        )));
  }
}
