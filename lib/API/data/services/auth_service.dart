import 'dart:convert';

import 'package:hive/hive.dart';

class Auth {
  Box dataBox = Hive.box('api');
  Future<bool> setToken(String token) async {
    dataBox.put('accessToken', token);

    return dataBox.get('accessToken') == null ? false : true;
  }

  void loginlocal(name, phoneNumber, id) async {
    final datas = {'name': name, 'phoneNumber': phoneNumber, 'id': id};
    await dataBox.put('data', json.encode(datas));
  }

  Future<bool> logout() async {
    await dataBox.delete('data');

    return dataBox.get('data') == null ? true : false;
  }

  Future<bool> removeToken() async {
    await dataBox.delete('accessToken');
    return dataBox.get('accessToken') == null ? true : false;
  }

  Future getToken() async {
    return dataBox.get('accessToken');
  }
}
