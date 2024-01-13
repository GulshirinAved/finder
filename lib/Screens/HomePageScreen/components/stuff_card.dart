import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/location_text.dart';
import 'package:yitirdim/Screens/ProductProfileScreen/productProfile_screen.dart';
import 'package:yitirdim/Theme/constants.dart';

class StuffCard extends StatelessWidget {
  StuffCard(
      {super.key,
      required this.imageTitle,
      required this.index,
      required this.loading,
      this.desc,
      this.locationTitle,
      required this.phoneNumber,
      this.mainCategory,
      this.subCategory,
      this.category,
      required this.colorName,
      this.height,
      this.weight,
      required this.created_at,
      required this.imageList,
      this.type_id,
      required this.locationId,
      required this.post_id,
      this.client_id,
      this.locationPoSt,
      this.status,
      required this.clientName});

  final String imageTitle;
  final int index;
  final bool loading;
  String? locationTitle;
  String? desc;
  int phoneNumber;
  String? mainCategory;
  String? subCategory;
  String? category;
  String colorName;
  int? height;
  int? weight;
  final created_at;
  List imageList;
  int? type_id;
  int locationId;
  int post_id;
  int? client_id;
  String? locationPoSt;
  bool? status;
  final String clientName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: AppConstants().borderRadius20,
          border: loading == false
              ? Border.all(
                  color: status == true
                      ? AppConstants().yellowColor
                      : AppConstants().blueColor.withOpacity(0.2))
              : null,
          boxShadow: loading == false
              ? [
                  BoxShadow(
                      color: Theme.of(context).colorScheme.onBackground,
                      offset: Offset(1, -1),
                      blurRadius: 2,
                      spreadRadius: 2)
                ]
              : [BoxShadow(color: AppConstants().greyColor1)]),
      child: GestureDetector(
        onTap: loading == false
            ? () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductProfileScreen(
                        title: imageTitle,
                        urlImagesList: imageList ?? [],
                        desc: desc ?? 'desc',
                        location: locationTitle ?? 'location',
                        phoneNumber: phoneNumber,
                        category: category.toString(),
                        mainCategory: mainCategory.toString(),
                        subCategory: subCategory.toString(),
                        client_id: client_id ?? 0,
                        height: height ?? 12,
                        weight: weight ?? 12,
                        created_at: created_at,
                        locationId: locationId,
                        indexx: index,
                        colorName: colorName,
                        post_id: post_id ?? 0,
                        clientName: clientName,
                      ),
                    ));
              }
            : () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
              ),
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                child: loading == false
                    ? CachedNetworkImage(
                        fadeInCurve: Curves.ease,
                        imageUrl: imageList.length == 0
                            ? 'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg'
                            : 'https://finder.alemtilsimat.com/storage/posts/${imageList[0]['name']}',
                        width: 165,
                        fit: BoxFit.fill,
                      )
                    : SizedBox(),
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 10, right: 5, bottom: 0, top: 4),
                height: 18,
                child: Text(
                  imageTitle,
                  style: TextStyle(
                    fontFamily: 'Comfortaa-SemiBold',
                    fontSize: AppConstants().fontSize15,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                )),
            Container(
              margin: EdgeInsets.only(bottom: 2, top: 1, left: 5),
              padding: EdgeInsets.all(2).copyWith(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: AppConstants().borderRadius7,
                color: AppConstants().mainColor.withOpacity(0.5),
              ),
              child: loading == false
                  ? Text(
                      type_id == 1 ? 'found'.tr : 'lost'.tr,
                      style: TextStyle(
                          color: AppConstants().whiteColor,
                          fontSize: AppConstants().fontSize12),
                    )
                  : SizedBox(),
            ),
            Container(
              margin: EdgeInsets.only(left: 7, top: 5),

              // height: 28,
              child: loading == false
                  ? LocationText(
                      locationId: locationId,
                      color: Theme.of(context).iconTheme.color,
                      locationTitle: locationTitle ?? '',
                    )
                  : SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
