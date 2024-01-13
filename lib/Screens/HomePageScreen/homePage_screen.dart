import 'package:flutter/material.dart';
import 'package:yitirdim/Screens/CustomWidgets/customAppBar.dart';
import 'package:yitirdim/Screens/CustomWidgets/customDrawer.dart';
import 'package:yitirdim/Screens/HomePageScreen/found_screen.dart';
import 'package:yitirdim/Screens/HomePageScreen/lost_screen.dart';
import 'package:yitirdim/Theme/constants.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: AppConstants().whiteColor,
        appBar: CustomAppBar(
          number: 1,
        ),
        drawer: CustomDrawer(),
        body: TabBarView(children: [LostPageScreen(), FoundScreen()]),
      ),
    );
  }
}
