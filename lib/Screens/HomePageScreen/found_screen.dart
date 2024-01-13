import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yitirdim/API/data/services/posts/post_service.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/categories.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/listviewProduct.dart';
import 'package:yitirdim/Screens/HomePageScreen/homePage_controller.dart';

class FoundScreen extends StatelessWidget {
  const FoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Box dataBox = Hive.box('api');

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListView(
        children: [
          Categories(moreCategory: false),
          GetBuilder<HomePageController>(
            builder: (_) {
              return FutureBuilder(
                  future: PostService().getToday(
                      [], 'found'.tr, dataBox.get('velayat') ?? 'ashgabat'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListviewProduct(
                        day: 'today',
                        titleDay: 'todays'.tr,
                        type: 'found'.tr,
                        snapshot: snapshot,
                      );
                    } else {
                      return SizedBox();
                    }
                  });
            },
          ),
          GetBuilder<HomePageController>(
            builder: (_) {
              return FutureBuilder(
                  future: PostService().getVip(
                      [], 'found'.tr, dataBox.get('velayat') ?? 'ashgabat'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListviewProduct(
                        day: 'vip',
                        titleDay: 'vip'.tr,
                        type: 'found'.tr,
                        snapshot: snapshot,
                      );
                    } else {
                      return Container(
                        height: 1,
                      );
                    }
                  });
            },
          ),
          // BannerBox(),
          GetBuilder<HomePageController>(
            builder: (controller) {
              return FutureBuilder(
                  future: PostService().getWeek(
                      [], 'Tapylan', dataBox.get('velayat') ?? 'ashgabat'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListviewProduct(
                        day: 'week',
                        titleDay: 'week'.tr,
                        type: 'found'.tr,
                        snapshot: snapshot,
                      );
                    } else {
                      return Container(
                        height: 1,
                      );
                    }
                  });
            },
          ),
          GetBuilder<HomePageController>(
            builder: (controller) {
              return FutureBuilder(
                  future: PostService().getLotTime(
                      [], 'Tapylan', dataBox.get('velayat') ?? 'ashgabat'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListviewProduct(
                        day: 'all',
                        titleDay: 'lotTime'.tr,
                        type: 'found'.tr,
                        snapshot: snapshot,
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  });
            },
          )
        ],
      ),
    );
  }
}

class BannerBox extends StatelessWidget {
  const BannerBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: PostService().sliders(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: buildImage(snapshot.data[0].image, 0));
          } else {
            return SizedBox.shrink();
          }
        });
  }
}

Widget buildImage(String urlImages, int index) {
  return CachedNetworkImage(
    imageUrl: 'https://finder.alemtilsimat.com/storage/slider/${urlImages}',
    fit: BoxFit.cover,
    height: 120,
    width: Get.width,
  );
}
