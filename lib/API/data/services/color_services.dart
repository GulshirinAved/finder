import 'package:dio/dio.dart';
import 'package:yitirdim/API/data/models/color_model.dart';
import 'package:yitirdim/Theme/constants.dart';

class ColorServices {
  Future getColors(id) async {
    Dio dio = Dio();
    String colorUrl = '${url}colors';
    Response response = await dio.get(colorUrl);
    if (response.statusCode == 200) {
      final apiData = response.data['data'];

      if (id == null) {
        final apiDataALlList =
            apiData.map((item) => ColorModel.fromJson(item)).toList();
        return apiDataALlList;
      } else {
        final apiDataColor = apiData
            .map((item) => ColorModel.fromJson(item))
            .where((item) => item.id == id)
            .toList();

        return apiDataColor;
      }
    } else {
      return [];
    }
  }
}
