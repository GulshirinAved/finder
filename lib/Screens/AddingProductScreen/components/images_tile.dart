import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yitirdim/Screens/AddingProductScreen/addingProductScreen_controller.dart';
import 'package:yitirdim/Screens/AddingProductScreen/components/choice_tile.dart';
import 'package:yitirdim/Theme/constants.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({super.key});

  @override
  Widget build(BuildContext context) {
    AddingProductScreenController controller =
        Get.put(AddingProductScreenController());

    return Container(
      margin: EdgeInsets.all(2).copyWith(bottom: 10),
      padding: EdgeInsets.only(left: 5, top: 2, bottom: 2),
      child: GetBuilder<AddingProductScreenController>(
        builder: (controller) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Surat',
                  style: TextStyle(
                      fontFamily: 'Comfortaa-SemiBold',
                      // color: AppConstants().darkBlue,
                      fontSize: AppConstants().fontSize17,
                      fontWeight: FontWeight.w600),
                ),
                // Text('3den kop surat goshmak mumkinciligi yok',
                //     style: TextStyle(
                //         fontFamily: 'Comfortaa-SemiBold',
                //         color: AppConstants().greyColor,
                //         fontSize: AppConstants().fontSize12,
                //         fontWeight: FontWeight.w400)),
                controller.selectedImageList.length == controller.maxLength
                    ? Row(
                        children: List.generate(
                            controller.selectedImageList.length,
                            (index) => picturesBox(controller, index)),
                      )
                    : Row(
                        children: [
                          imageButton(context, controller),
                          for (int i = 0;
                              i < controller.selectedImageList.length;
                              i++)
                            picturesBox(controller, i)
                        ],
                      ),
              ]);
        },
      ),
    );
  }

  Stack picturesBox(AddingProductScreenController controller, int index) {
    return Stack(
      children: [
        Container(
          height: 75,
          width: 75,
          margin: EdgeInsets.all(2),
          child: ClipRRect(
              borderRadius: AppConstants().borderRadius8,
              child: Image.file(
                File(controller.selectedImageList[index]),
                fit: BoxFit.cover,
              )),
        ),
        Positioned(
            top: -10,
            right: -10,
            child: IconButton(
              onPressed: () {
                controller.removeImage(controller.selectedImageList[index]);
              },
              icon: Icon(
                Icons.remove_circle,
                size: 23,
                color: AppConstants().redColor,
              ),
            ))
      ],
    );
  }

  GestureDetector imageButton(
      BuildContext context, AddingProductScreenController controller) {
    return GestureDetector(
        onTap: () async {
          await showModalBottomSheet(
            enableDrag: true,
            isDismissible: false,
            showDragHandle: true,
            useSafeArea: true,
            barrierColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            backgroundColor:
                Theme.of(context).bottomNavigationBarTheme.backgroundColor,

            // backgroundColor: AppConstants().whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    choiceTile('Surat', IconlyLight.image2, () async {
                      final status = await Permission.photos.request();
                      if (status.isGranted) {
                        controller.getImagesGallery();
                      } else {}
                      // controller.getImagesGallery();
                    }),
                    Divider(
                      color: AppConstants().greyColor,
                    ),
                    choiceTile('Kamera', IconlyLight.camera, () {
                      controller.getImagesCamera(ImageSource.camera);
                      Get.back();
                    }),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          height: 75,
          width: 75,
          margin: EdgeInsets.only(top: 5, bottom: 3, right: 10),
          decoration: BoxDecoration(
              borderRadius: AppConstants().borderRadius15,
              color: AppConstants().mainColor.withOpacity(0.2)),
          alignment: Alignment.center,
          child: Icon(
            IconlyLight.plus,
            size: 35,
            color: AppConstants().greyColor1,
          ),
        ));
  }
}
