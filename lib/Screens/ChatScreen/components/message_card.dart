import 'package:flutter/material.dart';
import 'package:yitirdim/Theme/constants.dart';

class Messages extends StatelessWidget {
  final String text;
  Messages({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: AppConstants().borderRadius10,
          border: Border.all(
            color: AppConstants().greyColor,
          )),
      padding: EdgeInsets.only(left: 5, right: 14, top: 10, bottom: 2),
      child: Text(
        text,
        style: TextStyle(
          fontSize: AppConstants().fontSize15,
          fontFamily: 'Comfortaa-SemiBold',
        ),
      ),
    );
  }
}
