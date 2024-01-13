// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:yitirdim/API/data/services/favoriteAdd_service.dart';

import 'package:yitirdim/Screens/FavScreen/favScreen_conrtoller.dart';
import 'package:yitirdim/Theme/constants.dart';

class FavButton extends StatefulWidget {
  final int post_id;

  FavButton({
    Key? key,
    required this.post_id,
  }) : super(key: key);

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  FavoriteScreenController controller = Get.put(FavoriteScreenController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    work();
  }

  dynamic work() {
    for (var element in controller.favList) {
      if (element == widget.post_id) {
        value = true;
      }
    }
  }

  bool value = false;
  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        value = !value;
        if (value) {
          controller.addToFavorites(widget.post_id);
        } else {
          controller.removeFromFavorites(widget.post_id);
        }
        setState(() {});
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: AppConstants().mainColor, blurRadius: 3),
          ],
        ),
        child: Icon(
          value ? IconlyBold.heart : IconlyLight.heart,
          size: 25,
        ),
      ),
    );
  }
}
