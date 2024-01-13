import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yitirdim/Screens/ChatScreen/chat_screen.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';
import 'package:yitirdim/Screens/FavScreen/components/fav_button.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/location_text.dart';
import 'package:yitirdim/Screens/ProductProfileScreen/components/contact_card.dart';
import 'package:yitirdim/Screens/ProductProfileScreen/components/desc_card.dart';
import 'package:yitirdim/Screens/ProductProfileScreen/components/dot.dart';
import 'package:yitirdim/Screens/ProductProfileScreen/components/image_slider.dart';
import 'package:yitirdim/Screens/ProductProfileScreen/components/textLine.dart';
import 'package:yitirdim/Screens/ProductProfileScreen/components/user_card.dart';

import 'package:yitirdim/Screens/ProductProfileScreen/productProfileScreen_controller.dart';
import 'package:yitirdim/Screens/UserProfileScreen/LoginScreen/login_screen.dart';
import 'package:yitirdim/Theme/constants.dart';

class ProductProfileScreen extends StatelessWidget {
  final String title;
  final List urlImagesList;
  final String desc;
  final String location;
  final int phoneNumber;
  final String mainCategory;
  final String subCategory;
  final int client_id;
  final String category;
  final String clientName;
  final int height;
  final int weight;
  final String created_at;
  final int locationId;
  final int indexx;
  final String colorName;
  final int post_id;

  const ProductProfileScreen(
      {super.key,
      required this.title,
      required this.urlImagesList,
      required this.desc,
      required this.location,
      required this.phoneNumber,
      required this.category,
      required this.mainCategory,
      required this.subCategory,
      required this.client_id,
      required this.height,
      required this.weight,
      required this.created_at,
      required this.locationId,
      required this.indexx,
      required this.colorName,
      required this.post_id,
      required this.clientName});

  @override
  Widget build(BuildContext context) {
    ProductProfileController productController =
        Get.put(ProductProfileController());
    Box dataBox = Hive.box('api');

    return Scaffold(
      appBar: CustomAppBar(
        number: 3,
        title: title,
        needLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 6, right: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                      itemCount: urlImagesList.length,
                      itemBuilder: (context, index, realIndex) {
                        return buildImages(index, urlImagesList);
                      },
                      options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          productController.swapDots(index);
                        },
                        height: 320,
                        viewportFraction: 1.0,
                        autoPlay: urlImagesList.length == 1 ||
                                urlImagesList.length == 0
                            ? false
                            : true,
                        aspectRatio: 4 / 2,
                        scrollPhysics: const BouncingScrollPhysics(),
                        autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 2000),
                      )),
                  Positioned(
                    bottom: 15,
                    child: Container(
                      height: 4,
                      width: Get.size.width,
                      alignment: Alignment.center,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: urlImagesList.length,
                        itemBuilder: (context, index) {
                          return Obx(() => dot(productController, index));
                        },
                      ),
                    ),
                  ),
                ],
              ),

              ///Surat
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'Comfortaa-SemiBold',
                          fontWeight: FontWeight.w500,
                          fontSize: AppConstants().fontSize23,
                        ),
                      ),
                      LocationText(
                        locationId: locationId,
                        locationTitle: '$location',
                        width: 200,
                        color: Theme.of(context).backgroundColor,
                        index: indexx,
                      )
                    ],
                  ),

                  ///yerleshyan yeri
                  Row(
                    children: [
                      FavButton(
                        post_id: post_id,
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () async {
                          await Share.share(
                              urlImagesList.length == 0
                                  ? 'https://st4.depositphotos.com/14953852/24787/v/450/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg'
                                  : 'https://finder.alemtilsimat.com/storage/posts/${urlImagesList[0]['name']}',
                              subject: desc);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppConstants().mainColor,
                                    blurRadius: 3)
                              ]),
                          child: Icon(
                            Icons.share,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              ///Share and like
              Container(
                  height: 75,
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      cardForDesc(colorName, 'color'.tr, context),
                      cardForDesc(height.toString(), 'Boyy', context),
                      cardForDesc(weight.toString(), 'Agramy', context),
                    ],
                  )),

              ///height,weight
              Container(
                width: Get.width,
                margin: EdgeInsets.only(top: 7, bottom: 7),
                padding: EdgeInsets.only(top: 7, bottom: 7),
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(color: AppConstants().greyColor1),
                        bottom: BorderSide(color: AppConstants().greyColor1))),
                child: Text(desc),
              ),

              ///desc
              Container(
                  height: 55,
                  width: Get.width,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      contactCard('phone_call', "Jan etmek", () async {
                        final Uri url = Uri(
                            scheme: 'tel',
                            path: '+993${phoneNumber.toString()}');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      }, context),
                      contactCard('message', "Yazmak", () async {
                        final Uri url = Uri(
                            scheme: 'sms',
                            path: '+993${phoneNumber.toString()}');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      }, context),
                      contactCard('chat', "Chat", () {
                        var data = dataBox.get('data');
                        if (data is Map<dynamic, dynamic>) {
                          var id = data['id'];
                        }

                        ///contact

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return dataBox.get('accessToken') == null
                                  ? LogInScreen()
                                  : ChatScreen(
                                      userName: clientName.toString(),
                                      fromUserId:
                                          jsonDecode(dataBox.get('data'))['id'],
                                      toUserID: client_id,
                                      status: 1,
                                    );
                            },
                          ),
                        );
                      }, context),
                    ],
                  )),
              userProfile(context, 10.0, 10.0, clientName),
              textDesc('category'.tr, category),
              textDesc('Eyesinin ady', clientName.toString()),
              textDesc('Telefon belgisi', '+993${phoneNumber.toString()}'),
              textDesc(
                  'Goyulan senesi',
                  DateFormat('dd/MM/yyyy')
                      .format(DateTime.parse(created_at.toString()))
                      .toString()),
              SizedBox(
                height: 5,
              )
              //info about product
            ],
          ),
        ),
      ),
    );
  }
}
