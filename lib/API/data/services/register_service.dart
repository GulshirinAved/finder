import 'package:dio/dio.dart';
import 'package:yitirdim/API/data/services/auth_service.dart';
import 'package:yitirdim/Theme/constants.dart';

class RegisterService {
  Future login(String phone, String password, String name) async {
    final loginUrl = '${url}auth/login';
    final data = {'phone': phone, 'code': password};
    final dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    try {
      Response response = await dio.post(
        loginUrl,
        data: data,
        options: Options(
          followRedirects: false,
        ),
      );
      if (response.statusCode == 302) {
      } else if (response.statusCode == 200) {
        Auth().setToken(response.data['token']);
        Auth().loginlocal(name, phone, response.data['user']['id']);
        return true;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return false;
    }
  }
// }

// {
//     "user": {
//         "name": "Plany",
//         "phone": "61212121",
//         "updated_at": "2023-12-18T16:31:51.000000Z",
//         "created_at": "2023-12-18T16:31:51.000000Z",
//         "id": 5
//     },
//     "token": "1|BLdKedjFPFE0RjfnnxoKFjS3yrQhmhsxw1ObhM0g06694b27"
}
