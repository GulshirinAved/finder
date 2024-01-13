import 'package:dio/dio.dart';

Future contactService(String name, String phone, String text) async {
  Dio dio = Dio();
  dio.options.headers['Content-Type'] = 'application/json';
  final contactUrl = 'https://finder.alemtilsimat.com/api/contact';
  final data = {
    'name': name,
    'phone': phone,
    'text': text,
  };
  try {
    Response response = await dio.post(contactUrl, data: data);
    if (response.statusCode == 200) {
      return true;
    }
  } catch (e) {
    return false;
  }
}
