import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yitirdim/Screens/ProductProfileScreen/viewWholepicture_screen.dart';
import 'package:yitirdim/Theme/constants.dart';

Widget buildImages(int index, List imageList) => GestureDetector(
      onTap: () {
        Get.to(() => ViewWholePictureScreen(
              imagelist: imageList,
            ));
      },
      child: Container(
        color: AppConstants().greyColor1,
        // height: 150,
        width: Get.width,
        margin: EdgeInsets.only(bottom: 5),
        child: ClipRRect(
          borderRadius: AppConstants().borderRadius8,
          child: CachedNetworkImage(
            // height: 200,
            imageUrl: imageList.length == 0
                ? 'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg'
                : 'https://finder.alemtilsimat.com/storage/posts/${imageList[index]['name']}',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
