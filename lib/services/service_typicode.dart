import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpodexample/constants/mainconstants.dart';
import 'package:riverpodexample/model/user_model.dart';

class ServiceTypicode {
  static final ServiceTypicode instance = ServiceTypicode._();
  ServiceTypicode._();
  factory ServiceTypicode() {
    return instance;
  }

  Future<List<UserModel>> fetch([String url = ""]) async {
    var uri = url == "" ? Uri.parse(MainConstents.todosUrl) : Uri.parse(url);
    var response = await http.get(uri);

    var userList = jsonDecode(response.body) as List<dynamic>;
    var list = userList.map((e) => UserModel.fromJson(e));
    return list.toList();
  }
}
