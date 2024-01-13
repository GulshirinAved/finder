import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hive/hive.dart';
import 'package:yitirdim/API/data/models/filter_model.dart';
import 'package:yitirdim/Screens/HomePageScreen/homePage_controller.dart';
import 'package:yitirdim/Theme/constants.dart';

class FilterService {
  HomePageController controller = Get.put(HomePageController());
  String filterUrl = '${url}filter';
  Box dataBox = Hive.box('api');

  // Future getLocations() async {
  //   var nameData = dataBox.get('velayaty');

  //   Dio dio = Dio();
  //   if (nameData != null && nameData['locations'] is Map<String, dynamic>) {
  //     var nameList = (nameData['locations'] as Map<String, dynamic>)
  //         .map((key, value) => MapEntry(key, Location.fromJson(value)));
  //     return nameList.values.toList();
  //   }
  //   Response response = await dio.get(filterUrl);
  //   if (response.statusCode == 200) {
  //     final apiDataLIst = (response.data['locations'] as List<dynamic>)
  //         .map((item) => Location.fromJson(item))
  //         .where((item) => item.parent_id == 0)
  //         .toList();
  //     await dataBox.put('velayaty', response.data);

  //     return apiDataLIst;
  //   } else {
  //     return [];
  //   }
  // }

  Future searchProducts(name, page, locationIds, categoryId) async {
    Dio dio = Dio();
    String locationQueryParam = '';
    String categoryQueryParam = '';
    for (int id in locationIds) {
      locationQueryParam += 'l%5B%5D=${id}&';
    }
    for (int id in categoryId) {
      categoryQueryParam += 'c%5B%5D=${id}&';
    }
    final finalurl =
        '$filterUrl?${categoryQueryParam}${locationQueryParam}q=${name.toString()}page=${page.toString()}';
    Response response = await dio.get(finalurl);
    if (response.statusCode == 200) {
      final responseData = response.data['posts'];
      final responseDataList = responseData['data']
          .map((item) => Data.fromJson(item))
          .where((item) => item.approve == 1)
          .toList();

      // if (responseData.isEmpty) {
      //   return Center(
      //     child: Text("Sizin gozleyan zadynyz yok"),
      //   );
      // }
      return responseDataList;
    } else {
      return [];
    }
  }

  Future allProducts(searchText) async {
    Dio dio = Dio();
    Response response = await dio.get(filterUrl);
    if (response.statusCode == 200) {
      final responseData = response.data['posts'];
      final responseDataList = responseData['data']
          .map((item) => Data.fromJson(item))
          .where((item) => item.approve == 1)
          .toList();

      // if (responseData.isEmpty) {
      //   return Center(
      //     child: Text("Sizin gozleyan zadynyz yok"),
      //   );
      // }
      return responseDataList;
    } else {
      return [];
    }
  }
}
