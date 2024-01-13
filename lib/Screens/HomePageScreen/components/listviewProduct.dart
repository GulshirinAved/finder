import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/stuff_card.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/topTitle.dart';
import 'package:yitirdim/Screens/TodaysScreen/todaysProduct_screem.dart';

class ListviewProduct extends StatelessWidget {
  final String day;
  final String titleDay;
  final String type;
  AsyncSnapshot snapshot;

  ListviewProduct(
      {super.key,
      required this.day,
      required this.titleDay,
      required this.type,
      required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        snapshot.data.length == 0
            ? SizedBox.shrink()
            : topTitle(titleDay.tr, () {
                Get.to(() => TodaysProductScreen(
                    topTitle: titleDay, day: day, type: type));
              }, context),
        snapshot.data.length == 0
            ? SizedBox.shrink()
            : SizedBox(
                height: 200,
                width: Get.width,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemExtent: 150,
                    itemCount:
                        snapshot.data.length > 20 ? 5 : snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 4, left: 5),
                        child: StuffCard(
                          type_id: snapshot.data[index].type_id ?? 0,
                          loading: false,
                          imageList: snapshot.data[index].images ?? [],
                          imageTitle: Get.locale!.languageCode == 'tkm'
                              ? snapshot.data[index].name_tm ?? ''
                              : snapshot.data[index].name_ru ?? '',
                          index: index,
                          locationTitle: Get.locale!.languageCode == 'tkm'
                              ? snapshot.data[index].location.name_tm ?? ''
                              : snapshot.data[index].location.name_ru ?? '',
                          desc: Get.locale!.languageCode == 'tkm'
                              ? snapshot.data[index].desc_tm ?? ''
                              : snapshot.data[index].desc_ru ?? '',
                          status: snapshot.data[index].status ?? false,
                          phoneNumber: snapshot.data[index].phone ?? 0,
                          category: snapshot.data[index].category.name_tm ?? '',
                          client_id: snapshot.data[index].client_id,
                          height: snapshot.data[index].height ?? 0,
                          weight: snapshot.data[index].weight ?? 0,
                          created_at: snapshot.data[index].created_at ?? '',
                          locationId: snapshot.data[index].location_id ?? 0,
                          post_id: snapshot.data[index].id ?? 0,
                          colorName: snapshot.data[index].color.name_tm ?? '',
                          clientName: snapshot.data[index].client.name,
                        ),
                      );
                    }),
              )
      ],
    );
  }
}
