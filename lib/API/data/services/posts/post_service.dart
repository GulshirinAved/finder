import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yitirdim/API/data/models/banner_model.dart';

import 'package:yitirdim/Theme/constants.dart';

import '../../models/filter_model.dart';

class PostService {
  String postUrl = '${url}posts';

  // Future getRayons(mainId) async {
  //   Dio dio = Dio();
  //   Response response = await dio.get(postUrl);
  //   if (response.statusCode == 200) {
  //     int parent_id = mainId;
  //     List childLocations = response.data['locations']
  //         .map((item) => LocationModal.fromJson(item))
  //         .where((item) => item.parent_id == parent_id)
  //         .toList();
  //     return childLocations;
  //   }
  //   return [];
  // }

  Future getSubCAtegories(location, categoryId) async {
    Dio dio = Dio();
    Response response = await dio.get(postUrl);
    if (response.statusCode == 200) {
      List apiData = response.data[location]?['data']
          .map((items) => Data.fromJson(items))
          .where((items) {
        return categoryId == items.category.id;
      }).toList();
      return apiData;
    }
  }

  Future getSubCAtegoriesAll(location, childParentId) async {
    Dio dio = Dio();
    String postUrl = '${url}posts';
    Response response = await dio.get(postUrl);
    if (response.statusCode == 200) {
      List apiData = response.data[location]?['data']
          .map((items) => Data.fromJson(items))
          .where((items) {
        return childParentId == items.category.parent_id;
      }).toList();

      return apiData;
    }
  }

  Future getNotApproved(int client_id) async {
    Dio dio = Dio();

    String postUrl = '${url}posts';

    Response response = await dio.get(postUrl);
    List apiDataList = [];

    if (response.statusCode == 200) {
      DateTime currentDate = DateTime.now();
      var locationData = response.data?['all'];
      apiDataList = locationData?['data'] != null
          ? (locationData['data'] as List)
              .map((item) => Data.fromJson(item))
              .where((element) => element.client_id == client_id)
              .toList()
          : [];
      return apiDataList;
    }
  }

  Future getAll(categoryId, typePost) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String categoryQueryParam = '';
    for (int id in categoryId) {
      categoryQueryParam += 'c%5B%5D=${id}&';
    }
    final finalurl = '$postUrl?${categoryQueryParam}';
    Response response = await dio.get(finalurl);
    List others = [];
    List apiDataList = [];

    DateTime currentDate = DateTime.now();
    var locationData = response.data?['all'];
    apiDataList = locationData?['data'] != null
        ? (locationData['data'] as List)
            .map((item) => Data.fromJson(item))
            .toList()
        : [];
    others = apiDataList
        .where((element) =>
            currentDate.difference(DateTime.parse(element.created_at)).inDays >=
            8)
        .where((element) => element.approve == 1)
        .where((element) =>
            element.type.name_tm == typePost ||
            element.type.name_ru == typePost)
        .toList();
    await prefs.setStringList(
        'all', others.map((e) => json.encode(e.toJson())).toList());
    List<String>? savedData = prefs.getStringList('all');
    if (savedData != null && savedData.isNotEmpty) {
      return savedData.map((item) => Data.fromJson(json.decode(item))).toList();
    } else {
      return others;
    }
  }

  Future getToday(categoryId, typePost, location) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List today = [];
    List apiDataList = [];
    String categoryQueryParam = '';

    for (int id in categoryId) {
      categoryQueryParam += 'c%5B%5D=${id}&';
    }
    final finalurl = '$postUrl?${categoryQueryParam}';
    try {
      Response response = await dio.get(finalurl);

      DateTime currentDate = DateTime.now();
      var locationData = response.data?[location];

      apiDataList = locationData?['data'] != null
          ? (locationData['data'] as List)
              .map((item) => Data.fromJson(item))
              .toList()
          : [];

      today = apiDataList
          .where((element) =>
              currentDate
                      .difference(DateTime.parse(element.created_at))
                      .inDays ==
                  0 ||
              currentDate
                      .difference(DateTime.parse(element.created_at))
                      .inDays ==
                  1)
          .where((element) => element.approve == 1)
          .where((element) =>
              element.type.name_tm == typePost ||
              element.type.name_ru == typePost)
          .toList();

      await prefs.setStringList(
          'today', today.map((e) => json.encode(e.toJson())).toList());

      List<String>? savedData = prefs.getStringList('today');

      if (savedData != null && savedData.isNotEmpty) {
        return savedData
            .map((item) => Data.fromJson(json.decode(item)))
            .toList();
      } else {
        return today;
      }
    } catch (e) {
      List<String>? savedData = prefs.getStringList('today');

      if (savedData != null && savedData.isNotEmpty) {
        return savedData
            .map((item) => Data.fromJson(json.decode(item)))
            .toList();
      }
    }
  }

  Future getWeek(categoryId, typePost, location) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List week = [];
    List apiDataList = [];
    String categoryQueryParam = '';

    for (int id in categoryId) {
      categoryQueryParam += 'c%5B%5D=${id}&';
    }
    final finalurl = '$postUrl?${categoryQueryParam}';
    try {
      Response response = await dio.get(finalurl);
      if (response.statusCode == 200) {
        DateTime currentDate = DateTime.now();
        var locationData = response.data?[location];

        apiDataList = (locationData['data'] as List)
            .map((item) => Data.fromJson(item))
            .toList();

        week = apiDataList
            .where((element) =>
                currentDate
                        .difference(DateTime.parse(element.created_at))
                        .inDays >=
                    2 &&
                currentDate
                        .difference(DateTime.parse(element.created_at))
                        .inDays <=
                    7)
            .where((element) => element.approve == 1)
            .where((element) =>
                element.type.name_tm == typePost ||
                element.type.name_ru == typePost)
            .toList();

        // return week;

        await prefs.setStringList(
            'week', week.map((e) => json.encode(e.toJson())).toList());

        List<String>? savedData = prefs.getStringList('week');

        if (savedData != null && savedData.isNotEmpty) {
          return savedData
              .map((item) => Data.fromJson(json.decode(item)))
              .toList();
        }
        return week;
      }
    } catch (e) {
      List<String>? savedData = prefs.getStringList('week');

      if (savedData != null && savedData.isNotEmpty) {
        return savedData
            .map((item) => Data.fromJson(json.decode(item)))
            .toList();
      }
    }
  }

  Future getVip(categoryId, typePost, location) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List vip = [];
    List apiDataList = [];
    String categoryQueryParam = '';

    for (int id in categoryId) {
      categoryQueryParam += 'c%5B%5D=${id}&';
    }
    final finalurl = '$postUrl?${categoryQueryParam}';

    try {
      Response response = await dio.get(finalurl);

      var locationData = response.data?[location];

      apiDataList = locationData?['data'] != null
          ? (locationData['data'] as List)
              .map((item) => Data.fromJson(item))
              .toList()
          : [];

      vip = apiDataList
          .where((element) => element.status == true)
          .where((element) => element.approve == 1)
          .where((element) =>
              element.type.name_tm == typePost ||
              element.type.name_ru == typePost)
          .toList();
      await prefs.setStringList(
          'vip', vip.map((e) => json.encode(e.toJson())).toList());

      List<String>? savedData = prefs.getStringList('vip');

      if (savedData != null && savedData.isNotEmpty) {
        return savedData
            .map((item) => Data.fromJson(json.decode(item)))
            .toList();
      } else {
        return vip;
      }
    } catch (e) {
      List<String>? savedData = prefs.getStringList('vip');

      if (savedData != null && savedData.isNotEmpty) {
        return savedData
            .map((item) => Data.fromJson(json.decode(item)))
            .toList();
      }
    }
  }

  Future getLotTime(categoryId, typePost, location) async {
    Dio dio = Dio();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List others = [];
    List apiDataList = [];
    String categoryQueryParam = '';

    for (int id in categoryId) {
      categoryQueryParam += 'c%5B%5D=${id}&';
    }
    final finalurl = '$postUrl?${categoryQueryParam}';
    try {
      Response response = await dio.get(finalurl);
      if (response.statusCode == 200) {
        DateTime currentDate = DateTime.now();
        var locationData = response.data?[location];

        apiDataList = (locationData['data'] as List)
            .map((item) => Data.fromJson(item))
            .toList();
        others = apiDataList
            .where((element) =>
                currentDate
                    .difference(DateTime.parse(element.created_at))
                    .inDays >=
                8)
            .where((element) => element.approve == 1)
            .where((element) =>
                element.type.name_tm == typePost ||
                element.type.name_ru == typePost)
            .toList();
        // return week;

        await prefs.setStringList(
            'others', others.map((e) => json.encode(e.toJson())).toList());

        List<String>? savedData = prefs.getStringList('others');

        if (savedData != null && savedData.isNotEmpty) {
          return savedData
              .map((item) => Data.fromJson(json.decode(item)))
              .toList();
        }
        return others;
      }
    } catch (e) {
      List<String>? savedData = prefs.getStringList('others');

      if (savedData != null && savedData.isNotEmpty) {
        return savedData
            .map((item) => Data.fromJson(json.decode(item)))
            .toList();
      }
    }
  }

  Future getPosts(
    String typePost,
    String day,
    String? location,
    int page,
    categoryId,
  ) async {
    Dio dio = Dio();
    String categoryQueryParam = '';
    for (int id in categoryId) {
      categoryQueryParam += 'c%5B%5D=${id}&';
    }
    final finalurl = '$postUrl?${categoryQueryParam}';
    print(finalurl);

    Response response = await dio.get(finalurl);
    List apiDataList = [];
    List today = [];
    List week = [];
    List vip = [];
    List others = [];
    if (response.statusCode == 200) {
      DateTime currentDate = DateTime.now();
      var locationData = response.data?[location];
      apiDataList = locationData?['data'] != null
          ? (locationData['data'] as List)
              .map((item) => Data.fromJson(item))
              .toList()
          : [];
      if (day == 'vip') {
        vip = apiDataList
            .where((element) => element.status == true)
            .where((element) => element.approve == 1)
            .where((element) =>
                element.type.name_tm == typePost ||
                element.type.name_ru == typePost)
            .toList();
        return vip;
      }

      if (day == 'today') {
        today = apiDataList
            .where((element) =>
                currentDate
                        .difference(DateTime.parse(element.created_at))
                        .inDays ==
                    0 ||
                currentDate
                        .difference(DateTime.parse(element.created_at))
                        .inDays ==
                    1)
            .where((element) => element.approve == 1)
            .where((element) =>
                element.type.name_tm == typePost ||
                element.type.name_ru == typePost)
            .toList();

        return today;
      } else if (day == 'week') {
        week = apiDataList
            .where((element) =>
                currentDate
                        .difference(DateTime.parse(element.created_at))
                        .inDays >=
                    2 &&
                currentDate
                        .difference(DateTime.parse(element.created_at))
                        .inDays <=
                    7)
            .where((element) => element.approve == 1)
            .where((element) =>
                element.type.name_tm == typePost ||
                element.type.name_ru == typePost)
            .toList();
        return week;
      } else {
        others = apiDataList
            .where((element) =>
                currentDate
                    .difference(DateTime.parse(element.created_at))
                    .inDays >=
                8)
            .where((element) => element.approve == 1)
            .where((element) =>
                element.type.name_tm == typePost ||
                element.type.name_ru == typePost)
            .toList();
        return others;
      }
    }
  }

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
        '$postUrl?${categoryQueryParam}${locationQueryParam}q=${name.toString()}&page=${page.toString()}';
    Response response = await dio.get(finalurl);
    if (response.statusCode == 200) {
      final responseDataList = response.data['all']['data']
          .map((item) => Data.fromJson(item))
          .where((item) => item.approve == 1)
          .toList();

      return responseDataList;
    } else {
      return [];
    }
  }

  Future sliders() async {
    Dio dio = Dio();
    String postUrl = '${url}posts';

    Response response = await dio.get(postUrl);
    List apiDataList = [];

    if (response.statusCode == 200) {
      var locationData = response.data?['sliders'];
      apiDataList =
          locationData.map((item) => BannerModel.fromJson(item)).toList();

      return apiDataList;
    }
  }
}
