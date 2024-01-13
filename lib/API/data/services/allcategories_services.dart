import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yitirdim/API/data/models/allcategories_model.dart';
import 'package:yitirdim/Theme/constants.dart';

class AllcategoryServices {
  Future getMainCategory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getStringList('category');
    if (cachedData != null) {
      List cachedCategories = cachedData!
          .map((item) => AllCategories.fromJson(jsonDecode(item)))
          .where((item) => item.parent_id == 0)
          .toList();
      // Return the cached data
      return cachedCategories;
    }

    Dio dio = Dio();
    String postUrl = '${url}allCategories';

    try {
      Response response = await dio.get(postUrl);
      final apiDataList = response.data['data'];

      // Convert API response to List<AllCategories> objects
      List categories = apiDataList
          .map((item) => AllCategories.fromJson(item))
          .where((item) => item.parent_id == 0)
          .toList();

      // Convert List<AllCategories> to String list for SharedPreferences
      List<String> categoryData =
          categories.map((category) => jsonEncode(category.toJson())).toList();

      // Save the data in category cache
      await prefs.setStringList('category', categoryData);
      return categories;
    } catch (e) {
      // Handle error
    }
  }

  Future getSubCategory(categoryid, selectedIndex) async {
    Dio dio = Dio();

    try {
      Response response = await dio.get('${url}allCategories');

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        List<dynamic> filteredData =
            data.where((item) => item['parent_id'] == categoryid).toList();

        return filteredData;
      }
    } catch (e) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getStringList('category');
      if (cachedData != null) {
        List cachedCategories = cachedData!
            .map((item) => AllCategories.fromJson(jsonDecode(item)))
            .where((item) => item.parent_id == 0)
            .toList();
        // Return the cached data
        return cachedCategories;
      }
    }
  }

  Future getCategories(int parent_id) async {
    try {
      Dio dio = Dio();
      String postUrl = '${url}allCategories';
      Response response = await dio.get(postUrl);
      if (response.statusCode == 200) {
        List allCategoriesList = (response.data['data'] as List)
            .map((item) => AllCategories.fromJson(item))
            .where((category) => category.id == parent_id)
            .toList();
        return allCategoriesList;
      } else {
        throw Exception('Failed to load subcategories');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
