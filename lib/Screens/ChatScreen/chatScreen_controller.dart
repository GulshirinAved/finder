import 'package:get/get.dart';

class ChatScreenController extends GetxController {
  RxList chatList = [].obs;
  void addingChatList(Map message) {
    chatList.add(message);
    update();
  }
}
