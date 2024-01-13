// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yitirdim/API/data/services/color_services.dart';
import 'package:yitirdim/Screens/AddingProductScreen/addingProductScreen_controller.dart';
import 'package:yitirdim/Screens/AddingProductScreen/components/selection_line.dart';
import 'package:yitirdim/Screens/AddingProductScreen/components/status_tile.dart';
import 'package:yitirdim/Screens/AddingProductScreen/components/textField_tile.dart';
import 'package:yitirdim/Theme/constants.dart';

class StatusTile extends StatelessWidget {
  TextEditingController? textController;
  int? number;
  String? topTitle;
  String? hintText;
  int? maxLine;
  String? title;
  VoidCallback? onTap;
  bool? extraInfo;
  double? isTall;
  StatusTile(
      {Key? key,
      this.textController,
      this.topTitle,
      required this.number,
      this.hintText,
      this.maxLine,
      this.title,
      this.onTap,
      this.extraInfo,
      this.isTall})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    AddingProductScreenController controller =
        Get.put(AddingProductScreenController());
    return Container(
      margin: EdgeInsets.all(2).copyWith(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 5, top: 2, bottom: 2),
            child: Text(
              topTitle ?? '',
              style: TextStyle(
                  fontFamily: 'Comfortaa-SemiBold',
                  // color: AppConstants().darkBlue,
                  fontSize: AppConstants().fontSize17,
                  fontWeight: FontWeight.w600),
            ),
          ),
          number == 1
              ? statusRow()
              : number == 2
                  ? Container(
                      padding: EdgeInsets.only(bottom: 3),
                      margin: EdgeInsets.all(3).copyWith(left: 4),
                      width: isTall ?? 200,
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          cursorColor: AppConstants().mainColor,
                          autofocus: false,
                          keyboardType: isTall == 100
                              ? TextInputType.number
                              : TextInputType.text,
                          controller: textController,
                          decoration: InputDecoration(
                            isDense: true,
                            isCollapsed: true,
                            hintText: hintText,
                            hintStyle: TextStyle(
                                height: 1.35,
                                fontWeight: FontWeight.w500,
                                color: AppConstants().darkBlue.withOpacity(0.7),
                                fontFamily: 'Comfortaa-SemiBold',
                                fontSize: AppConstants().fontSize14),
                            focusColor: Theme.of(context).backgroundColor,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).backgroundColor)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).backgroundColor)),
                            errorBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppConstants().redColor)),
                          ),
                          validator: extraInfo == false
                              ? (value) {
                                  if (value!.length < 3) {
                                    return '3 harpdan kop bolmaly';
                                  }
                                  if (value.length > 12) {
                                    return 'Text must be less than 12 characters';
                                  }

                                  return null; // Return null if validation passes
                                }
                              : extraInfo == null
                                  ? (value) {}
                                  : (value) {
                                      if (value!.length < 3) {
                                        return '3 harpdan kop bolmaly';
                                      }

                                      return null; // Return null if validation passes
                                    },
                          onFieldSubmitted: (value) {
                            onTap;
                            if (_formKey.currentState!.validate()) {}
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          onTap: () {
                            onTap;
                            // FocusScope.of(context).requestFocus(new FocusNode());
                          },
                          onTapOutside: (event) {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                        ),
                      ),
                    )
                  : number == 3
                      ? Container(
                          padding: EdgeInsets.only(bottom: 3),
                          child: lineForSelection(title ?? '', true, context),
                        )
                      : number == 4
                          ? Obx(() => lineForSelection(
                              controller.time.value == ''
                                  ? 'noSelection'.tr
                                  : controller.time.value,
                              false,
                              context))
                          : controller.open.value == false
                              ? lineForSelection(
                                  controller.selectionColor.value == ''
                                      ? 'noSelection'.tr
                                      : controller.selectionColor.value,
                                  true,
                                  context)
                              : number == 5
                                  ? lineForSelection(
                                      controller.selectionColor.value == ''
                                          ? 'noSelection'.tr
                                          : controller.selectionColor.value,
                                      true,
                                      context)
                                  : Container()
        ],
      ),
    );
  }
}

void showDialogColor(context) {
  AddingProductScreenController colorController =
      Get.put(AddingProductScreenController());
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => Dialog(
        surfaceTintColor: Theme.of(context).dialogBackgroundColor,
        insetAnimationCurve: Curves.bounceInOut,
        shadowColor: Theme.of(context).dialogBackgroundColor,
        backgroundColor: Theme.of(context).dialogBackgroundColor,

        // backgroundColor: AppConstants().whiteColor,
        shape:
            RoundedRectangleBorder(borderRadius: AppConstants().borderRadius8),
        child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).dialogBackgroundColor,
                borderRadius: AppConstants().borderRadius8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(top: 15, bottom: 10),
                      child: Text(
                        "selectColor".tr,
                        style: TextStyle(
                          fontSize: AppConstants().fontSize18,
                          fontFamily: 'Comfortaa-SemiBold',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      right: -12,
                      top: -12,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(CupertinoIcons.clear,
                              size: 17, color: AppConstants().redColor)),
                    )
                  ],
                ),
                FutureBuilder(
                    future: ColorServices().getColors(null),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(10),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                colorController.chooseColor(
                                    snapshot.data[index].name_tm,
                                    snapshot.data[index].id);
                                Get.back();
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 5, bottom: 5),
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: index ==
                                                    snapshot.data.length - 1
                                                ? AppConstants().transpColor
                                                : AppConstants().greyColor1))),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 25,
                                      width: 25,
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(int.parse(
                                              '0xFF${snapshot.data[index].color}')),
                                          border: Border.all(
                                              color: AppConstants().greyColor,
                                              width: 0.5)),
                                    ),
                                    Text(snapshot.data[index].name_tm)
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
              ],
            ))),
  );
}
