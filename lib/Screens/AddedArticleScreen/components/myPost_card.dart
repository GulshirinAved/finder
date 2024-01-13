// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:yitirdim/API/data/services/posts/postDelete_service.dart';
import 'package:yitirdim/API/data/services/posts/post_edit.dart';
import 'package:yitirdim/Screens/CustomWidgets/showSnack_bar.dart';
import 'package:yitirdim/Theme/constants.dart';

class MyPostCard extends StatelessWidget {
  String? imageUrl;
  String? title;
  String? location;
  String? time;
  String? extraInfo;
  String? approve;
  int? category_id;
  int? location_id;
  int? type_id;
  int? color_id;
  int? client_id;
  String? name_tm;
  String? name_ru;
  String? desc_tm;
  String? desc_ru;
  int? post_id;
  int? phone;
  List images;
  String? token;
  int? height;
  int? weight;
  int? id;
  MyPostCard({
    Key? key,
    this.imageUrl,
    this.title,
    this.location,
    this.time,
    this.extraInfo,
    this.approve,
    this.category_id,
    this.location_id,
    this.type_id,
    this.color_id,
    this.client_id,
    this.name_tm,
    this.name_ru,
    this.desc_tm,
    this.desc_ru,
    this.post_id,
    this.phone,
    required this.images,
    this.token,
    this.weight,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: Get.width,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: AppConstants().borderRadius15,
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: AppConstants().blueColor.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
                color: AppConstants().whiteColor,
                offset: Offset(1, -1),
                blurRadius: 2,
                spreadRadius: 2)
          ]),
      child: Stack(
        children: [
          Container(
            // margin: EdgeInsets.only(right: 5),
            // height: 120,
            // width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              child: CachedNetworkImage(
                height: 120,
                width: 150,
                imageUrl: imageUrl ??
                    'https://finder.alemtilsimat.com/img/temp/post.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 160,
            child: Align(
              alignment: Alignment.topCenter,
              child: Text(title ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AppConstants().fontSize17,
                      fontFamily: 'Comfortaa-SemiBold')),
            ),
          ),
          Positioned(
              top: 45,
              left: 160,
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(location ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Comfortaa-SemiBold',
                          fontSize: AppConstants().fontSize12)))),
          Positioned(
            right: 10,
            top: 5,
            child: Text(time ?? '',
                style: TextStyle(
                    // color: AppConstants().greyColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Comfortaa-SemiBold',
                    fontSize: AppConstants().fontSize12)),
          ),
          Positioned(
            top: 60,
            left: 160,
            child: Text(extraInfo ?? '',
                style: TextStyle(
                    // color: AppConstants().blackColor.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Comfortaa-SemiBold',
                    fontSize: AppConstants().fontSize12)),
          ),
          Positioned(
            bottom: 20,
            left: 160,
            child: Row(
              children: [
                Text("Status:",
                    style: TextStyle(
                        // color: AppConstants().mainColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Comfortaa-SemiBold',
                        fontSize: AppConstants().fontSize12)),
                Text(approve ?? '',
                    style: TextStyle(
                        // color: AppConstants().mainColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Comfortaa-SemiBold',
                        fontSize: AppConstants().fontSize12))
              ],
            ),
          ),
          Positioned(
              right: 1,
              child: IconButton(
                  onPressed: () {
                    Box dataBox = Hive.box('api');

                    print(post_id);
                    postDelete(post_id, dataBox.get('accessToken')).then(
                        (value) => showSnackBar(
                            "Pozuldy",
                            "Sizin bildirisiniz pozuldy",
                            AppConstants().mainColor,
                            1));
                  },
                  icon: Icon(IconlyLight.delete))

              //  Column(
              //   children: [
              //     Container(
              //       decoration:
              //           BoxDecoration(borderRadius: AppConstants().borderRadius7),
              //       child: ,
              //     ),
              //     Container(
              //       decoration:
              //           BoxDecoration(borderRadius: AppConstants().borderRadius7),
              //       child: IconButton(
              //           onPressed: () {
              //             editPost(
              //                     category_id ?? 0,
              //                     location_id ?? 0,
              //                     type_id ?? 0,
              //                     color_id ?? 0,
              //                     client_id ?? 0,
              //                     name_tm ?? '',
              //                     name_ru ?? '',
              //                     desc_tm ?? '',
              //                     desc_ru ?? '',
              //                     phone ?? 0,
              //                     images,
              //                     token!,
              //                     time,
              //                     height,
              //                     weight,
              //                     id)
              //                 .then((value) => print(value));
              //           },
              //           icon: Icon(IconlyLight.edit)),
              //     )
              //   ],
              // ),
              )
        ],
      ),
    );
  }
}
