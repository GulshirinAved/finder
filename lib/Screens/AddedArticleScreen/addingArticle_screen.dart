// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/shimmer.dart';

import 'package:yitirdim/API/data/services/posts/post_service.dart';
import 'package:yitirdim/Screens/AddedArticleScreen/components/myPost_card.dart';
import 'package:yitirdim/Screens/AddingProductScreen/addingProductScreen_controller.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';
import 'package:yitirdim/Theme/constants.dart';

class AddingArticleScreen extends StatelessWidget {
  const AddingArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AddingProductScreenController controller =
        Get.put(AddingProductScreenController());
    Box dataBox = Hive.box('api');

    return Scaffold(
      appBar: CustomAppBar(
        number: 3,
        title: "Goşulan bildirişlerim",
        needLeading: true,
      ),
      body: dataBox.get('accessToken') == null
          ? Container()
          : FutureBuilder(
              future: PostService()
                  .getNotApproved(jsonDecode(dataBox.get('data'))['id']),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return MyPostCard(
                        title: snapshot.data[index].name_tm ?? '',
                        extraInfo: snapshot.data[index].desc_tm ?? '',
                        imageUrl:
                            'https://finder.alemtilsimat.com/storage/posts/' +
                                snapshot.data[index].images[0]['name'],
                        location: snapshot.data[index].location_id.toString(),
                        time: '',
                        approve: snapshot.data[index].approve == 2
                            ? "Kabul edilmedi"
                            : snapshot.data[index].approve == 1
                                ? "Kabul edildi"
                                : 'Garashylyar',
                        post_id: snapshot.data[index].id,
                        category_id: snapshot.data[index].category_id,
                        client_id: snapshot.data[index].client_id,
                        color_id: snapshot.data[index].color_id,
                        desc_ru: snapshot.data[index].desc_ru,
                        desc_tm: snapshot.data[index].desc_tm,
                        id: snapshot.data[index].id,
                        images: snapshot.data[index].images,
                        location_id: snapshot.data[index].location_id,
                        name_ru: snapshot.data[index].name_ru,
                        name_tm: snapshot.data[index].name_tm,
                        phone: snapshot.data[index].phone,
                        token: dataBox.get('accessToken'),
                        type_id: snapshot.data[index].type_id,
                        weight: snapshot.data[index].weight,
                      );
                    },
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return ListView.builder(
                    padding: EdgeInsets.all(5),
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                          baseColor: Theme.of(context).focusColor,
                          highlightColor: Theme.of(context).highlightColor,
                          child: MyPostCard(
                            post_id: 0,
                            images: [],
                          ));
                    },
                  );
                }
              }),
    );
  }
}
