import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:yitirdim/API/data/services/posts/post_service.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/categories.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/listviewProduct.dart';
import 'package:yitirdim/Screens/HomePageScreen/homePage_controller.dart';

class LostPageScreen extends StatelessWidget {
  const LostPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Box dataBox = Hive.box('api');

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(4.0).copyWith(top: 0),
        child: ListView(
          children: [
            Categories(moreCategory: false),
            GetBuilder<HomePageController>(
              builder: (_) {
                return FutureBuilder(
                    future: PostService().getToday(
                        [], "lost".tr, dataBox.get('velayat') ?? 'ashgabat'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListviewProduct(
                          day: 'today',
                          titleDay: 'todays'.tr,
                          type: 'lost'.tr,
                          snapshot: snapshot,
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    });
              },
            ),
            GetBuilder<HomePageController>(
              builder: (_) {
                return FutureBuilder(
                    future: PostService().getVip(
                        [], "lost".tr, dataBox.get('velayat') ?? 'ashgabat'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListviewProduct(
                          day: 'vip',
                          titleDay: 'vip'.tr,
                          type: 'lost'.tr,
                          snapshot: snapshot,
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    });
              },
            ),
            // BannerBox(),
            GetBuilder<HomePageController>(
              builder: (_) {
                return FutureBuilder(
                    future: PostService().getWeek(
                        [], 'Ýiten', dataBox.get('velayat') ?? 'ashgabat'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListviewProduct(
                          day: 'week',
                          titleDay: 'week'.tr,
                          type: 'lost'.tr,
                          snapshot: snapshot,
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    });
              },
            ),
            GetBuilder<HomePageController>(
              builder: (controller) {
                return FutureBuilder(
                    future: PostService().getLotTime(
                        [], 'Ýiten', dataBox.get('velayat') ?? 'ashgabat'),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListviewProduct(
                          day: 'all',
                          titleDay: 'lotTime'.tr,
                          type: 'lost'.tr,
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
      ),
    );
  }
}
