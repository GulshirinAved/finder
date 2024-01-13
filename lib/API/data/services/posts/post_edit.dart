import 'package:dio/dio.dart';
import 'package:yitirdim/Theme/constants.dart';

Future editPost(
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
    int? height,
    int? weight,
    int? id) async {
  Dio dio = Dio();
  dio.options.headers['Accept'] = 'application/json';
  dio.options.headers['Authorization'] = 'Bearer $token';
  dio.options.followRedirects = false;
  final addPostUrl = 'https://finder.alemtilsimat.com/api/editPost/${id}';
  var data = FormData.fromMap({
    'category_id': '3',
    'location_id': '2',
    'type_id': '2',
    'client_id': '1',
    'color_id': '1',
    'phone': '61216483',
    'name_tm': '4juw64',
    'desc_tm': 'w64uw',
  });

  List<MultipartFile> files = [];
  for (var imageFile in images) {
    files.add(await MultipartFile.fromFile(imageFile, filename: '1'));
  }

  data.files.addAll(files.map((file) => MapEntry('images[]', file)));

  try {
    Response response = await dio.put(addPostUrl, data: data);
    print(response.data);

    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
