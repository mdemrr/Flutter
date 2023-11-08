import 'package:flutter/material.dart';
import 'package:riverpodexample/model/user_model.dart';
import 'package:riverpodexample/services/service_typicode.dart';

class MainPageController extends ChangeNotifier {
  List<UserModel> user = [];

  Future getUser() async {
    user = await ServiceTypicode.instance.fetch();
    //return user;
    notifyListeners();
  }
}
