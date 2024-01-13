// import 'package:dio/dio.dart';
// import 'package:yitirdim/API/data/services/auth_service.dart';
// import 'package:yitirdim/Theme/constants.dart';

import 'package:dio/dio.dart';

Future otpCheckService({
  phoneNumber,
}) async {
  Dio dio = Dio();

  final otpUrl = 'https://finder.alemtilsimat.com/api/auth/verification';
  final data = {'phone': phoneNumber};

  try {
    Response response = await dio.post(otpUrl, data: data);
    if (response.statusCode == 200) {
      return response.data['code'];
    }
    print(response.data['code']);
  } catch (e) {
    return false;
  }
}
