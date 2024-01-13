import 'dart:convert';

import 'package:dio/dio.dart';

Future postDelete(id, token) async {
  Dio dio = Dio();
  dio.options.headers['Authorization'] = 'Bearer $token';
  var headers = {'Authorization': 'Bearer ${token}'};
  var response = await dio.delete(
    'https://finder.alemtilsimat.com/api/deletePost/${id}',
  );

  if (response.statusCode == 200) {
    print(response.data);
    return true;
  } else {
    print(response.statusMessage);
    return false;
  }
}
