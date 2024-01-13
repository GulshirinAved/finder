import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yitirdim/API/data/services/location_service.dart';
import 'package:yitirdim/API/data/services/posts/post_service.dart';
import 'package:yitirdim/Screens/AddingProductScreen/components/select_button.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/locationScreen_controller.dart';
import 'package:yitirdim/Screens/AllProductsScreen/LocationScreen/location_screen.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/stuff_card.dart';

class TodaysProductScreen extends StatelessWidget {
  final String topTitle;
  final String type;

  final String day;
  const TodaysProductScreen({
    super.key,
    required this.topTitle,
    required this.day,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    Box dataBox = Hive.box('api');
    LOcationScreenController locationController =
        Get.put(LOcationScreenController());

    return Scaffold(
      appBar: CustomAppBar(
        number: 3,
        title: topTitle,
        needFilter: false,
        onTap: () {
          //   await showModalBottomSheet(
          //     context: context,
          //     enableDrag: true,
          //     isDismissible: false,
          //     showDragHandle: true,
          //     useSafeArea: true,
          //     barrierColor:
          //         Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          //     backgroundColor:
          //         Theme.of(context).bottomNavigationBarTheme.backgroundColor,

          //     // backgroundColor: AppConstants().whiteColor,
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.only(
          //             topLeft: Radius.circular(25),
          //             topRight: Radius.circular(25))),

          //     builder: (context) {
          //       return Column(
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Container(
          //             height: 4,
          //             width: 120,
          //             margin: EdgeInsets.only(bottom: 10),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(15),
          //                 topRight: Radius.circular(15),
          //               ),
          //             ),
          //           ),
          //           Container(),
          //           GestureDetector(
          //             onTap: () {
          //               Get.to(() => SubCatgeoryFilterScreen(
          //                     number: 2,
          //                   ));
          //             },
          //             child: rowText("categories".tr, () {
          //               Get.to(() => SubCatgeoryFilterScreen(
          //                     number: 2,
          //                   ));
          //             }, context),
          //           ),
          //           CustomButton(ontap: () {
          //             // _getData(isRefresh: true);
          //             PostService().getPosts(
          //                 type,
          //                 day,
          //                 dataBox.get('velayat') ?? 'ashgabat',
          //                 1,
          //                 locationController.verifyCategoryList2.value);
          //             print(locationController.verifyCategoryList2.value);
          //             Navigator.pop(context);

          //             // Get.back();
          //           }),
          //         ],
          //       );
          //     },
          //   );
        },
        needLeading: true,
      ),
      body: GetBuilder<LOcationScreenController>(
        builder: (locationController) {
          return FutureBuilder(
              future: PostService().getPosts(
                  type,
                  day,
                  dataBox.get('velayat') ?? 'ashgabat',
                  1,
                  locationController.verifyCategoryList2.value),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SizedBox.shrink();
                }
                if (snapshot.hasData) {
                  return SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: GridView.builder(
                      padding: EdgeInsets.only(right: 10, left: 10),
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 6,
                          mainAxisSpacing: 2,
                          mainAxisExtent: 210),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              margin: EdgeInsets.only(left: 3, right: 3),
                              alignment: Alignment.topCenter,
                              child: StuffCard(
                                post_id: snapshot.data[index].id,
                                type_id: snapshot.data[index].type_id,
                                loading: false,
                                imageList: snapshot.data[index].images,
                                imageTitle: Get.locale!.languageCode == 'tkm'
                                    ? snapshot.data[index].name_tm
                                    : snapshot.data[index].name_ru,
                                index: index,
                                locationTitle: Get.locale!.languageCode == 'tkm'
                                    ? snapshot.data[index].location.name_tm
                                    : snapshot.data[index].location.name_ru,
                                desc: Get.locale!.languageCode == 'tkm'
                                    ? snapshot.data[index].desc_tm
                                    : snapshot.data[index].desc_ru,
                                phoneNumber: snapshot.data[index].phone,
                                category: snapshot.data[index].category.name_tm,
                                client_id: snapshot.data[index].client_id,
                                height: 0,
                                weight: 0,
                                created_at: snapshot.data[index].created_at,
                                locationId: snapshot.data[index].location_id,
                                colorName: snapshot.data[index].color.name_tm,
                                clientName: snapshot.data[index].client.name,
                              )),
                        );
                      },
                    ),
                  );
                } else {
                  return ShimmerGridview();
                }
              });
        },
      ),
    );
  }
}

class ShimmerGridview extends StatelessWidget {
  double? height;
  ShimmerGridview({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height == null ? Get.height : height,
      width: Get.width,
      child: GridView.builder(
        padding: EdgeInsets.only(right: 10, left: 10),
        // padding: EdgeInsets.only(right: 25),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 2),
        // itemCount: snapshot.data.length,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).focusColor,
            highlightColor: Theme.of(context).highlightColor,
            // baseColor: AppConstants().greyColor1,
            // highlightColor: AppConstants().whiteColor,
            child: Container(
              margin: EdgeInsets.only(bottom: 7),
              alignment: Alignment.topCenter,
              child: StuffCard(
                phoneNumber: 0,
                post_id: 0,
                client_id: 0,
                imageList: [],
                locationId: 0,
                colorName: '',

                created_at: 0,
                imageTitle: '',
                index: index,
                // imageUrl: 'assets/images/1.jpg',
                loading: true,
                clientName: '',
              ),
            ),
          );
        },
      ),
    );
  }
}
