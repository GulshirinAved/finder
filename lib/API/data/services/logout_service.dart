import 'package:dio/dio.dart';

Future logoutService({token}) async {
  Dio dio = Dio();

  final otpUrl = 'https://finder.alemtilsimat.com/api/logout';
  dio.options.headers['Authorization'] = 'Bearer $token';

  try {
    Response response = await dio.post(otpUrl);
    if (response.statusCode == 200) {
      return true;
    }
  } catch (e) {
    return false;
  }
}
