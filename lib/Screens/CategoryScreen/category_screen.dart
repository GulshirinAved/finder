import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yitirdim/Screens/HomePageScreen/components/categories.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';

class CategoryScreen extends StatelessWidget {
  final bool leadingIcon;
  const CategoryScreen({super.key, required this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        number: 3,
        needLeading: leadingIcon,
        title: "category".tr,
      ),
      body: Categories(moreCategory: true),
    );
  }
}
