import 'package:dio/dio.dart';

// import '../models/message_model.dart';

// class GetChat {
//   FutureList<Message>> fetchMessages() async {
//     try {
//       Dio dio = Dio();
//       Response response = await dio.get(
//           'YOUR_API_ENDPOINT_HERE'); // Replace with your actual API endpoint

//       if (response.statusCode == 200) {
//         List<dynamic> data = response.data['data'];
//         List<Message> messages =
//             data.map((item) => Message.fromJson(item)).toList();
//         return messages;
//       } else {
//         throw Exception('Failed to load messages');
//       }
//     } catch (e) {
//       throw Exception('Failed to load messages');
//     }
//   }
// }
