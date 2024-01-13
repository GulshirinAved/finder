import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yitirdim/API/data/services/allcategories_services.dart';
import 'package:yitirdim/Screens/CategoryScreen/category_screen.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/category_card.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/topTitle.dart';
import 'package:yitirdim/Theme/constants.dart';

class Categories extends StatelessWidget {
  final bool moreCategory;

  const Categories({
    super.key,
    required this.moreCategory,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AllcategoryServices().getMainCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                moreCategory == true
                    ? SizedBox.shrink()
                    : topTitle("category".tr, () {
                        Get.to(() => CategoryScreen(
                              leadingIcon: true,
                            ));
                      }, context),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: moreCategory == true
                      ? snapshot.data.length
                      : snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 80,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      loading: false,
                      index: index,
                      color: imageTitle[index]['color'] ?? '',
                      title: Get.locale!.languageCode == 'tkm'
                          ? snapshot.data[index].name_tm ?? ''
                          : snapshot.data[index].name_ru ?? '',
                      id: snapshot.data[index].id ?? 0,
                      child_id: snapshot.data[index].child_id ?? 0,
                      categoryIdd: snapshot.data[index].id ?? 0,
                      imageUrl: snapshot.data[index].image ?? '',
                    );
                  },
                ),
              ],
            );
          } else {
            return SizedBox.shrink();
          }
        });
  }
}
