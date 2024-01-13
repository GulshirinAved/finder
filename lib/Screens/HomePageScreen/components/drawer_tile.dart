import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:yitirdim/Theme/constants.dart';

// ignore: must_be_immutable
class RowText extends StatelessWidget {
  IconData? icon;
  final String title;
  final VoidCallback onTap;

  RowText({super.key, required this.title, this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: AppConstants().borderRadius7,
            color: AppConstants().lightBlueColor.withOpacity(0.5),
          ),
          child: Icon(
            icon,
            color: AppConstants().whiteColor,
          )),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Comfortaa-SemiBold',
          // color: AppConstants().blackColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Icon(
        IconlyLight.arrowRightCircle,
        color: Theme.of(context).iconTheme.color,

        // color: AppConstants().lightBlueColor,
      ),
    );
  }
}
