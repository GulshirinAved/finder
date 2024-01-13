import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:yitirdim/API/data/models/filter_model.dart';

import '../../../Theme/constants.dart';

class LocationService {
  String locationUrl = '${url}locations';

  Future getVelayat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      // Check if the data is already cached
      String? cachedData = prefs.getString('apiDataList');
      if (cachedData != null) {
        List<dynamic> cachedList = jsonDecode(cachedData);
        List<Location> locations =
            cachedList.map((item) => Location.fromJson(item)).toList();
        return locations.reversed.toList();
      }

      Dio dio = Dio();
      Response response = await dio.get(locationUrl);

      final apiDataLIst = (response.data['data'])
          .map((item) => Location.fromJson(item))
          .where((item) => item.parent_id == null)
          .toList();

      // Cache the data
      prefs.setString('apiDataList', jsonEncode(apiDataLIst));

      return apiDataLIst.reversed.toList();
    } catch (e) {
      String? cachedData = prefs.getString('apiDataList');
      if (cachedData != null) {
        List<dynamic> cachedList = jsonDecode(cachedData);
        List<Location> locations =
            cachedList.map((item) => Location.fromJson(item)).toList();
        return locations.reversed.toList();
      }
    }
  }

  Future getRayons(mainId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    Response response = await dio.get(locationUrl);
    if (response.statusCode == 200) {
      List childLocations = response.data['data'].reversed
          .map((item) => Location.fromJson(item))
          .where((item) => item.parent_id == mainId)
          .toList();

      return childLocations;
    }
    return [];
  }

  Future getLocations(locationId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? location = prefs.getString('location');

      if (location != null) {
        List cachedLocations = (jsonDecode(location) as List<dynamic>)
            .map((item) => Location.fromJson(item))
            .where((item) => item.id == locationId)
            .toList();

        if (cachedLocations.isNotEmpty) {
          return cachedLocations[0].parent;
        }
      }

      Dio dio = Dio();
      Response response = await dio.get(locationUrl);
      List apiLocationsAll = (response.data['data'] as List<dynamic>)
          .map((item) => Location.fromJson(item))
          .where((item) => item.id == locationId)
          .toList();

      if (apiLocationsAll.isNotEmpty) {
        // Save data to cache
        prefs.setString('location', jsonEncode(response.data['data']));

        return apiLocationsAll[0].parent;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
