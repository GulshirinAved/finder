import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:yitirdim/Screens/ChatScreen/chatScreen_controller.dart';
import 'package:yitirdim/Theme/constants.dart';

Container chatTextField(
    context, TextEditingController textController, VoidCallback ontap) {
  ChatScreenController chatController = Get.put(ChatScreenController());

  return Container(
    decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
            bottom:
                BorderSide(color: AppConstants().greyColor.withOpacity(0.1)))),
    child: Row(
      children: [
        Expanded(
          child: Card(
            color: Theme.of(context).colorScheme.onBackground,
            shape: RoundedRectangleBorder(
                borderRadius: AppConstants().borderRadius15),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextField(
                  maxLines: null,
                  controller: textController,
                  decoration: InputDecoration(
                      hintText: "Birzatlar yazyn", border: InputBorder.none),
                )),
              ],
            ),
          ),
        ),
        MaterialButton(
          onPressed: ontap,
          minWidth: 0,
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 10),
          shape: CircleBorder(),
          child: Icon(
            IconlyBold.send,
            color: AppConstants().mainColor,
          ),
        )
      ],
    ),
  );
}
