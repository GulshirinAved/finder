import 'package:dio/dio.dart';
import 'package:yitirdim/API/data/models/filter_model.dart';

import '../../../Theme/constants.dart';

class FavoriteService {
  Future favoriteAdd(postId) async {
    Dio dio = Dio();
    String favoriteUrl = '${url}favoriteAdd/$postId';
    Response response = await dio.get(favoriteUrl);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future favoriteAll() async {
    Dio dio = Dio();
    String favoriteAll = 'https://finder.alemtilsimat.com/api/favorite';
    Response response = await dio.get(favoriteAll);

    List<dynamic> data =
        response.data['data'].map((item) => Data.fromJson(item)).toList();
    ;
    if (response.statusCode == 200) {
      return data;
    }
  }
}
