import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreenController extends GetxController {
  Map<int, bool> favoriteStatus = {};
  RxList favList = <dynamic>[].obs;

  Future<void> addToFavorites(int itemId) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var response = await dio
        .get('https://finder.alemtilsimat.com/api/favoriteAdd/$itemId');
    if (response.statusCode == 200) {
      favList.add(itemId);
      favList.refresh();
      await prefs.setStringList(
          'favList', favList.map((e) => e.toString()).toList());
      update();
    }
  }

  Future<void> removeFromFavorites(int itemId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Dio dio = Dio();
    var response = await dio
        .get('https://finder.alemtilsimat.com/api/favoriteRemove/$itemId');
    if (response.statusCode == 200) {
      favList.remove(itemId);
      favList.refresh();
      await prefs.setStringList(
          'favList', favList.map((e) => e.toString()).toList());
      update();
      // favoriteStatus[itemId] = false;
    }
  }

  dynamic returnFav() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final result = prefs.getStringList('favList');
    final List<dynamic> jsonData = jsonDecode(result.toString());
    for (int i = 0; i < jsonData.length; i++) {
      addToFavorites(jsonData[i]['id']);
    }
  }
}
