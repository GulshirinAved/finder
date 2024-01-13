import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yitirdim/API/data/models/types_model.dart';
import 'package:yitirdim/API/data/services/types_service.dart';

import 'package:shimmer/shimmer.dart';
import 'package:yitirdim/Screens/AddingProductScreen/addingProductScreen_controller.dart';
import 'package:yitirdim/Theme/constants.dart';

Widget statusRow() {
  return FutureBuilder(
      future: TypesService().getTypes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return GetBuilder<AddingProductScreenController>(
                builder: (controller) {
                  return Row(
                    children: [
                      Radio(
                          fillColor: MaterialStatePropertyAll(
                              AppConstants().mainColor),
                          value: index,
                          groupValue: controller.select,
                          onChanged: (value) {
                            controller.choiceStatus(
                                index,
                                snapshot.data[index].name_tm,
                                snapshot.data[index].id);
                          }),
                      Text(
                        snapshot.data[index].name_tm ?? '',
                        style: TextStyle(
                            fontFamily: 'Comfortaa-SemiBold',
                            // color: AppConstants().blackColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  );
                },
              );
            },
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else {
          return Shimmer.fromColors(
              baseColor: Theme.of(context).focusColor,
              highlightColor: Theme.of(context).highlightColor,
              child: Container(
                height: 100,
                width: Get.width,
              ));
        }
      });
}
