import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yitirdim/API/data/models/types_model.dart';

import '../../../Theme/constants.dart';

class TypesService {
  Future getTypes() async {
    Dio dio = Dio();
    String typeUrl = '${url}types';
    Response response = await dio.get(typeUrl);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      String? cachedData = prefs.getString('typesData'); // Read data from cache
      if (cachedData != null) {
        List<dynamic> cachedDataList = json.decode(cachedData);
        List<TypesModel> cachedTypesList =
            cachedDataList.map((item) => TypesModel.fromJson(item)).toList();
        return cachedTypesList;
      } else {
        final apiData = response.data['data'];
        final apiDataList =
            apiData.map((item) => TypesModel.fromJson(item)).toList();
        prefs.setString('typesData', json.encode(apiDataList));
        return apiDataList;
      }
    } catch (e) {
      String? cachedData = prefs.getString('typesData'); // Read data from cache

      if (cachedData != null) {
        List<dynamic> cachedDataList = json.decode(cachedData);
        List<TypesModel> cachedTypesList =
            cachedDataList.map((item) => TypesModel.fromJson(item)).toList();
        return cachedTypesList;
      }
    }
  }
}
