// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:yitirdim/Theme/constants.dart';

class TextFieldRow extends StatelessWidget {
  TextEditingController? textController;
  String? hintText;
  BuildContext context;
  double width;
  VoidCallback? onTap;

  TextFieldRow(
    TextEditingController textController, {
    Key? key,
    this.hintText,
    required this.context,
    required this.width,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 3),
      margin: EdgeInsets.all(3).copyWith(left: 4),
      width: width,
      child: TextFormField(
        cursorColor: AppConstants().mainColor,
        autofocus: false,
        keyboardType: width == 200 ? TextInputType.text : TextInputType.number,
        controller: textController,
        decoration: InputDecoration(
          isDense: true,
          isCollapsed: true,
          hintText: hintText,
          focusColor: Theme.of(context).backgroundColor,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).backgroundColor)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).backgroundColor)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppConstants().redColor)),
        ),
        onFieldSubmitted: (value) {
          onTap;
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        onTap: () {
          onTap;
          // FocusScope.of(context).requestFocus(new FocusNode());
        },
        onTapOutside: (event) {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
      ),
    );
  }
}
