import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yitirdim/API/data/services/allcategories_services.dart';
import 'package:yitirdim/API/data/services/filter_service.dart';
import 'package:yitirdim/API/data/services/posts/post_service.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/locationScreen_controller.dart';
import 'package:yitirdim/Screens/CategoryScreen/categoryScreen_controller.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/category_card.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/stuff_card.dart';
import 'package:yitirdim/Screens/HomePageScreen/homePage_controller.dart';
import 'package:yitirdim/Screens/TodaysScreen/todaysProduct_screem.dart';
import 'package:yitirdim/Screens/UserProfileScreen/components/icon_button.dart';
import 'package:yitirdim/Theme/constants.dart';

class SubCategoryScreen extends StatefulWidget {
  final int index;
  final int categoryId;
  final String title;
  final int id;

  const SubCategoryScreen(
      {super.key,
      required this.index,
      required this.categoryId,
      required this.title,
      required this.id});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  HomePageController homeController = Get.put(HomePageController());
  LOcationScreenController locationController =
      Get.put(LOcationScreenController());
  CategoryScreenController categoryController =
      Get.put(CategoryScreenController());
  Box dataBox = Hive.box('api');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        // toolbarHeight: 65,
        centerTitle: true,
        automaticallyImplyLeading: false,
        // titleSpacing: 0.0,
        // scrolledUnderElevation: 0.0,
        leading: IconButton(
          onPressed: () {
            homeController.selectionIndexContainer.value = -1;
            Get.back();
          },
          icon: Icon(
            IconlyLight.arrowLeftCircle,

            color: Theme.of(context).iconTheme.color,

            // color: AppConstants().mainColor,
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: 'Comfortaa-SemiBold',
              fontSize: AppConstants().fontSize20,
              fontWeight: FontWeight.w500,
              // color: AppConstants().darkBlue
            ),
          ),
        ),
      ),
      body: FutureBuilder(
          future: AllcategoryServices().getSubCategory(widget.categoryId, -1),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  SizedBox(
                    height: 60,
                    width: Get.width,
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 5),
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            homeController.selectionIndexContainer.value =
                                index;
                            homeController.nullCheckingAppbar.value =
                                snapshot.data[index]['parent_id'];

                            homeController.appBarSelection.value =
                                snapshot.data[index]['id'];
                          },
                          child: CardForSubCategory(
                            index: index,
                            homeController: homeController,
                            title: snapshot.data[index]['name_tm'],
                          ),
                        );
                      },
                    ),
                  ),
                  Obx(() => FutureBuilder(
                      future: homeController.selectionIndexContainer.value != -1
                          ? PostService().getSubCAtegories(
                              dataBox.get('velayat1') ?? 'ashgabat',
                              homeController.appBarSelection.value)
                          : PostService().getSubCAtegoriesAll(
                              dataBox.get('velayat1') ?? 'ashgabat',
                              snapshot.data[0]['parent_id']),
                      builder: (context, snapshot1) {
                        if (snapshot1.hasData) {
                          return Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.only(left: 3.2, right: 3.2),
                            child: GridView.builder(
                              itemCount: snapshot1.data.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisExtent: 200,
                                      crossAxisSpacing: 6,
                                      mainAxisSpacing: 6),
                              padding: EdgeInsets.only(right: 10, left: 10),
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 200,
                                  margin: EdgeInsets.only(bottom: 2.5),
                                  alignment: Alignment.topCenter,
                                  child: StuffCard(
                                      colorName:
                                          snapshot1.data[index].color.name_tm,
                                      status: snapshot1.data[index].status,
                                      imageTitle: snapshot1.data[index].name_tm,
                                      index: index,
                                      category: snapshot1
                                          .data[index].category.name_tm,
                                      desc: snapshot1.data[index].desc_tm,
                                      height: 0,
                                      locationTitle:
                                          Get.locale!.languageCode == 'tkm'
                                              ? snapshot1
                                                  .data[index].location.name_tm
                                              : snapshot1
                                                  .data[index].location.name_ru,
                                      mainCategory: '',
                                      phoneNumber: snapshot1.data[index].phone,
                                      post_id: snapshot1.data[index].id,
                                      clientName:
                                          snapshot1.data[index].client.name,
                                      subCategory: snapshot1
                                          .data[index].category.name_tm,
                                      type_id: snapshot1.data[index].type_id,
                                      client_id:
                                          snapshot1.data[index].client_id,
                                      weight: 0,
                                      loading: false,
                                      created_at:
                                          snapshot1.data[index].created_at,
                                      imageList: [],
                                      locationId:
                                          snapshot1.data[index].location_id),
                                );
                              },
                            ),
                          ));
                        } else {
                          return ShimmerGridview(
                            height: Get.height - 147,
                          );
                        }
                      }))
                ],
              );
              // return Center(child: Text(snapshot.data[1].name_tm.toString()));
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else {
              return Shimmer.fromColors(
                child: Container(
                  height: 60,
                  width: Get.width,
                ),
                baseColor: Theme.of(context).focusColor,
                highlightColor: Theme.of(context).highlightColor,
              );
            }
          }),
    );
  }
}
