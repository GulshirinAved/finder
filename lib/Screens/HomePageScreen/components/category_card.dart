import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yitirdim/Theme/constants.dart';

import '../../CategoryScreen/subCategory_screen.dart';

class CategoryCard extends StatelessWidget {
  final int index;
  final Color color;
  final String title;
  final bool loading;
  final int id;
  final int categoryIdd;

  final int child_id;
  final String imageUrl;
  const CategoryCard(
      {super.key,
      required this.index,
      required this.color,
      required this.title,
      required this.loading,
      required this.id,
      required this.categoryIdd,
      required this.child_id,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SubCategoryScreen(
              index: index,
              categoryId: id,
              title: title,
              id: categoryIdd,
            ));
      },
      child: Container(
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            borderRadius: AppConstants().borderRadius8,
            color: color,
            gradient: loading == false
                ? LinearGradient(colors: [color, color.withOpacity(0.9)])
                : null,
            boxShadow: [
              loading == false
                  ? BoxShadow(
                      color: AppConstants().greyColor.withOpacity(0.2),
                      offset: Offset(3, 2),
                      blurRadius: 2,
                      spreadRadius: 1)
                  : BoxShadow(color: AppConstants().greyColor1)
            ]),
        child: Container(
          margin: EdgeInsets.all(2.7),
          decoration: BoxDecoration(
              border: Border.all(
                  color: loading == false
                      ? AppConstants().whiteColor.withOpacity(0.9)
                      : AppConstants().greyColor),
              borderRadius: AppConstants().borderRadius8),
          child: Row(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(left: 5, right: 10),
                  child:
                      //  loading == false
                      // ? CachedNetworkImage(
                      //     imageUrl:
                      //         'https://finder.alemtilsimat.com/storage/categories/${imageUrl}')
                      SizedBox()),
              Container(
                width: 115,
                child: loading == false
                    ? Text(
                        title,
                        overflow: TextOverflow.fade,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: AppConstants().fontSize17,
                          fontFamily: 'Comfortaa-SemiBold',
                        ),
                      )
                    : SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
