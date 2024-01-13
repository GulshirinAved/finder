import 'package:dio/dio.dart';

import 'package:yitirdim/Theme/constants.dart';

Future userPost(
  int category_id,
  int location_id,
  int type_id,
  int color_id,
  int client_id,
  String name_tm,
  String name_ru,
  String desc_tm,
  String desc_ru,
  int phone,
  List images,
  String token,
  String? time,
  String? height,
  String? weight,
) async {
  Dio dio = Dio();
  dio.options.headers['Accept'] = 'application/json';
  // dio.options.headers['Content-Type'] = 'multipart/form-data';
  dio.options.headers['Authorization'] = 'Bearer $token';
  dio.options.followRedirects = false;

  final addPostUrl = '${url}addPost';

  // Replace with your addPostURL
  var data = FormData.fromMap({
    'type_id': type_id,
    'client_id': client_id,
    'color_id': color_id,
    'phone': phone.toString(),
    'name_tm': name_tm,
    'desc_tm': desc_tm,
    'category_id': category_id,
    'location_id': location_id,
    'time': time,
    'height': height,
    'weight': weight,
  });

  List<MultipartFile> files = [];
  for (var imageFile in images) {
    files.add(await MultipartFile.fromFile(imageFile, filename: '1'));
  }

  data.files.addAll(files.map((file) => MapEntry('images[]', file)));

  try {
    Response response = await dio.post(addPostUrl, data: data);

    return true;
  } catch (e) {
    return false;
  }
}
