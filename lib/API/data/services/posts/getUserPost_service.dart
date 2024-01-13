import 'package:dio/dio.dart';
import 'package:yitirdim/Theme/constants.dart';

class UserPostGet {
  Future getUserPosts() async {
    String userPost = '${url}userPosts';
    Dio dio = Dio();
    Response response = await dio.get(userPost);
    if (response.statusCode == 200) {}
  }
}
