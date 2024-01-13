import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:yitirdim/API/data/models/message_model.dart';

class ChatService {
  Future chatPost(int fromClinet_id, toClinet_id, String text, status) async {
    Box dataBox = Hive.box('api');
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${dataBox.get('accessToken')}'
    };
    var data = FormData.fromMap({
      "fromClient_id": fromClinet_id,
      "toClient_id": toClinet_id,
      "text": text,
      'status': status
    });
    var dio = Dio();
    var response = await dio.request(
      'https://finder.alemtilsimat.com/api/chatAdd',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future fetchMessages() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          'https://finder.alemtilsimat.com/api/chat'); // Replace with your actual API endpoint

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        List<Message> messages =
            data.map((item) => Message.fromJson(item)).toList();
        return messages;
      } else {
        throw Exception('Failed to load messages');
      }
    } catch (e) {
      throw Exception('Failed to load messages');
    }
  }
}
